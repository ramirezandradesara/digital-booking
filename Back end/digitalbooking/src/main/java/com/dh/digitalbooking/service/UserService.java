package com.dh.digitalbooking.service;

import com.dh.digitalbooking.Exceptions.BadRequetsException;
import com.dh.digitalbooking.email.token.entities.ConfirmationToken;
import com.dh.digitalbooking.email.token.service.ConfirmationTokenService;
import com.dh.digitalbooking.email.EmailService;
import com.dh.digitalbooking.email.EmailValidator;
import com.dh.digitalbooking.entities.AppUser;
import com.dh.digitalbooking.entities.Rol;
import com.dh.digitalbooking.repository.UserRepository;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Log4j
@Service
public class UserService  implements UserDetailsService {
    @Autowired
    UserRepository repository;
    @Autowired
    RolService rolService;
    @Autowired
    EmailValidator emailValidator;
    @Autowired
    ConfirmationTokenService tokenService;
    @Autowired
    UserRepository userRepository;
    @Autowired
    EmailService emailService;

    //inicializamos los servicio
    //agregamos un usuario

    public AppUser crearUsuario(AppUser appUser) throws BadRequetsException {
        //valida el email:
        boolean esValido = emailValidator.test(appUser.getEmail());
        if (!esValido) {
            throw new BadRequetsException("El email : " + appUser.getEmail() + " no es valido");
        }
        AppUser usuarioBuscado = repository.findByEmail(appUser.getEmail());
        if (usuarioBuscado != null) {
            throw new BadRequetsException("Este email ya esta asociada con una cuenta creada");
        } else {
            Optional<Rol> rolBuscado = rolService.buscarRolXId(appUser.getRol().getId());
            appUser.setRol(rolBuscado.get());
            BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
            String password = passwordEncoder.encode(appUser.getPassword());
            appUser.setContraseña(password);
            appUser.setEnabled(false);
            repository.save(appUser);

            //creamos el token y lo enviamos.
            String token = UUID.randomUUID().toString();
            ConfirmationToken confirmationToken = new ConfirmationToken(token, LocalDateTime.now(), LocalDateTime.now().plusMinutes(30), appUser);
            //lo guardamos:
            tokenService.guardarToken(confirmationToken);

            String link = "http://ec2-13-49-0-184.eu-north-1.compute.amazonaws.com:8080/usuarios/confirmar?token=" + token;
            emailService.enviar(appUser.getEmail(), emailService.armarEmail(appUser.getNombre(), link));
            return appUser;
        }

    }

    //listar usuarios
    public List<AppUser> listarUsuarios() {
        return repository.findAll();
    }

    //buscar usuario por id
    public Optional<AppUser> buscarUsuarioPorId(Long id) {
        return repository.findById(id);
    }

    //buscar usuario por mail
    public AppUser buscarUsuarioXEmail(String email) {
        return repository.findByEmail(email);
    }

    //editar usuario
    public AppUser editarUser(AppUser user) throws BadRequetsException {
        Optional<AppUser> userBuscado = buscarUsuarioPorId(user.getId());
        if (userBuscado.isPresent()) {
            BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
            String password = passwordEncoder.encode(user.getPassword());
            user.setContraseña(password);
            return repository.save(user);
        } else {
            throw new BadRequetsException("No se pudo actualizar al usuario con id : " + user.getId() + " con nombre :" + user.getNombre() +
                    " no se encontraron los datos necesarios para realizar la peticion ");
        }
    }

    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        AppUser user = repository.findByEmail(email);
        List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
        authorities.add(new SimpleGrantedAuthority(user.getRol().getNombre()));
        return new User(email, user.getContraseña(), user.isEnabled(), true, true, true, authorities);

    }

    public int enableAppUser(String email) {
        return userRepository.enableAppUser(email);
    }

    //confirmar token:
    @Transactional
    public String confirmarToken(String token) {
        Optional<ConfirmationToken> confirmToken = tokenService.buscarXToken(token);
        if (confirmToken.isEmpty()) {
            throw new IllegalStateException("Token no encontrado");

        }
        if (confirmToken.get().getConfirmedAt() != null) {
            throw new IllegalStateException("El email ya esta confirmado");
        }
        LocalDateTime expiredAt = confirmToken.get().getExpiresAt();
        if (expiredAt.isBefore(LocalDateTime.now())) {
            throw new IllegalStateException("El token ya expiro");
        }
        tokenService.setConfirmedAt(token);
        enableAppUser(confirmToken.get().getAppUser().getEmail());

        return "<style type=\"text/css\">\n" +
                "        *{\n" +
                "            margin: 0;\n" +
                "            padding: 0;\n" +
                "        }\n" +
                "        div{\n" +
                "            background-image: url(\"https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+complementos/imagen.png\");\n" +
                "            background-size: cover;\n" +
                "            background-repeat: no-repeat;\n" +
                "            height: 100vh;\n" +
                "            background-position: 69%;\n" +
                "\n" +
                "        }\n" +
                "     \n" +
                "    \n" +
                "        @media screen and (max-width: 900px) {\n" +
                "           div {\n" +
                "    \n" +
                "                 background-image: url(\"https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+complementos/tablet-svg.png\");\n" +
                "\n" +
                "} \n" +
                "        }\n" +
                "          \n" +
                "        @media screen and (max-width:500px) {\n" +
                "           div {\n" +
                "    \n" +
                "                background-image: url(\"https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+complementos/mobile-svg.png\");\n" +
                "                width: 100vw;\n" +
                "                height: 100vh;\n" +
                "                background-position: 69%;\n" +
                "   \n" +
                "           } \n" +
                "        }\n" +
                "            \n" +
                "        \n" +
                "    </style>\n" +
                "\n" +
                "    <div ></div>";

    }
}
