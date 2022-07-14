package com.dh.digitalbooking.controller;

import com.dh.digitalbooking.Exceptions.BadRequetsException;
import com.dh.digitalbooking.Exceptions.ResourceNotFoundException;
import com.dh.digitalbooking.entities.AppUser;
import com.dh.digitalbooking.entities.Reserva;
import com.dh.digitalbooking.entities.Ubicacion;
import com.dh.digitalbooking.service.UserService;
import io.swagger.v3.oas.annotations.Operation;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

import org.springframework.web.bind.annotation.*;

import java.util.Optional;

@RestController
@RequestMapping("/usuarios")
public class UserController {
    //instanciamos los servicios que le daremos a nuestra api
    @Autowired
    UserService userService;
    //getxemail
    @Operation(summary = "busca usuario por mail ")
    @GetMapping("/{email}")
    public ResponseEntity<AppUser> buscarUser(@PathVariable String email) throws ResourceNotFoundException {
        return ResponseEntity.ok( userService.buscarUsuarioXEmail(email));
    }

   //metodo post
    @Operation(summary = "Crear un nuevo usuario ")
    @PostMapping
    public ResponseEntity<AppUser> crearUsuario(@RequestBody  AppUser user) throws BadRequetsException {
        return ResponseEntity.status(HttpStatus.CREATED).body(userService.crearUsuario(user));

    }
    //metodo put
    @Operation(summary = "Editar un  usuario")
    @PutMapping
    public ResponseEntity<AppUser>editarUsuario(@RequestBody AppUser user)throws BadRequetsException {
        AppUser userEditado=userService.editarUser(user);
         return ResponseEntity.ok(userEditado);
    }
    //metodo confirmacion
    @Operation(summary = "confirma el token del email")
    @GetMapping("/confirmar")
     public ResponseEntity<String> confimacion(@RequestParam("token")String token) {
        return ResponseEntity.ok(userService.confirmarToken(token));
     }


}
