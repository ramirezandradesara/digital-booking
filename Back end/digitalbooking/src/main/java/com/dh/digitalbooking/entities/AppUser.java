package com.dh.digitalbooking.entities;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.Collection;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "usuarios")
public class AppUser implements UserDetails {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @NotNull
    private Long id;
    @Column
    @NotNull
    @Size(min = 1, max = 250)
    private String nombre;
    @Column
    @NotNull
    @Size(min = 1, max = 250)
    private String apellido;
    @Column
    @NotNull
    @Size(min = 1, max = 250)
    private String email;
    @Column
    @NotNull
    @Size(min = 1, max = 250)
    private String contraseña;
    @Column
    @NotNull
    @Size(min = 1,max = 250)
    private String ciudad;
    @OneToMany(mappedBy = "usuario",fetch =FetchType.LAZY)
    @JsonIgnoreProperties(value = {"usuario"})
    private Set<Reserva> reservas =new HashSet<>();

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "rol",referencedColumnName = "id")
     private Rol rol;

    @OneToMany(mappedBy = "usuario",fetch = FetchType.LAZY)
    @JsonIgnoreProperties(value = {"usuario"})
    private Set<Puntuacion> puntuaciones = new HashSet<>();
    @Column
    private boolean enabled;

//devuelve los metodos autorizados
    @JsonIgnore
    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        SimpleGrantedAuthority grantedAuthority = new SimpleGrantedAuthority(rol.getNombre());
        return Collections.singletonList(grantedAuthority);
    }
    @JsonIgnore
    @Override
    public String getPassword() {
        return contraseña;
    }
    @JsonIgnore
    @Override
    public String getUsername() {
        return email;
    }
    @JsonIgnore
    @Override
    public boolean isAccountNonExpired() {
        return true;
    }
    @JsonIgnore
    @Override
    public boolean isAccountNonLocked() {
        return true;
    }
    @JsonIgnore
    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }
    @JsonIgnore
    @Override
    public boolean isEnabled() {
        return enabled;
    }
}
