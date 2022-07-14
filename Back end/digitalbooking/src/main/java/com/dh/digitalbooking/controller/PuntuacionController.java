package com.dh.digitalbooking.controller;

import com.dh.digitalbooking.Exceptions.BadRequetsException;
import com.dh.digitalbooking.entities.Producto;
import com.dh.digitalbooking.entities.Puntuacion;
import com.dh.digitalbooking.service.PuntuacionesService;
import io.swagger.v3.oas.annotations.Operation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/puntuaciones")
public class PuntuacionController {
    //intanciamos los servicios que le daremos a nuestra api
    @Autowired
    PuntuacionesService puntuacionesService;

    //metodo get por producto
    @Operation(summary = "trae una lista de puntuaciones segun el id de su producto")
    @GetMapping("/producto/{id}")
    public ResponseEntity <List<Puntuacion>> buscarPuntuacionXproducto(@PathVariable Long id)  {
        Optional<List<Puntuacion>> puntuacionesBuscadas=puntuacionesService.buscarPuntuacionXProductoId(id);
        return puntuacionesBuscadas.map(ResponseEntity::ok).orElseGet(()-> ResponseEntity.status(HttpStatus.NOT_FOUND).build());
    }
    //metodo post
    @Operation(summary = "Crear una nueva puntuacion")
    @PostMapping
    public ResponseEntity<Puntuacion> agregarPuntuacion(@RequestBody Puntuacion puntuacion) {
        return ResponseEntity.ok(puntuacionesService.agregarPuntuacion(puntuacion));
    }
    //metodo put
    @Operation(summary = "Edita una puntuacion ")
    @PutMapping
    public ResponseEntity<Puntuacion> editarPuntuacion(@RequestBody Puntuacion puntuacion) throws BadRequetsException {
        Puntuacion puntuacionEditada=puntuacionesService.editarPuntuacion(puntuacion);
        return ResponseEntity.ok(puntuacionEditada);
    }

}
