package com.dh.digitalbooking.controller;


import com.dh.digitalbooking.Exceptions.BadRequetsException;
import com.dh.digitalbooking.Exceptions.ResourceNotFoundException;

import com.dh.digitalbooking.entities.Ubicacion;
import com.dh.digitalbooking.service.UbicacionService;
import io.swagger.v3.oas.annotations.Operation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/ubicaciones")
public class UbicacionController {
    //instanciamos los servicios que le daremos a nuestra api
    @Autowired
    UbicacionService ubicacionService;

    //metodo get
    @Operation(summary = "Traer todas las ubicaciones")
    @GetMapping()
    public ResponseEntity<List<Ubicacion>> listarUbicaciones() {
        return ResponseEntity.ok(ubicacionService.listarUbicaciones());
    }

    //get por id
    @Operation(summary = "Buscar ubicacion por id")
    @GetMapping("/{id}")
    public ResponseEntity<Ubicacion> buscarUbicacion(@PathVariable Long id) throws ResourceNotFoundException {
        Optional<Ubicacion> ubicacionBuscada = ubicacionService.buscarUbicacionXId(id);
        return ubicacionBuscada.map(ResponseEntity::ok).orElseGet(() -> ResponseEntity.status(HttpStatus.NOT_FOUND).build());
    }

    //metodo post
    @Operation(summary = "Crear una nueva ubicacion")
    @PostMapping
    public ResponseEntity<Ubicacion> agregarUbicacion(@RequestBody Ubicacion ubicacion) {
        return ResponseEntity.ok(ubicacionService.agregarUbicacion(ubicacion));
    }

    //metodo put
    @Operation(summary = "Edita una ubicacion ")
    @PutMapping
    public ResponseEntity<Ubicacion> editarUbicacion(@RequestBody Ubicacion ubicacion) throws BadRequetsException {
        Ubicacion ubicacionEditada = ubicacionService.editarUbicacion(ubicacion);
        return ResponseEntity.ok(ubicacionEditada);
    }

    //metodo delete
    @Operation(summary = "Borra a la ubicacion que especificamos por su id ")
    @DeleteMapping("{id}")
    public ResponseEntity<String> eliminarUbicacion(@PathVariable Long id) throws ResourceNotFoundException {
        ubicacionService.eliminarUbicacionXId(id);
        return ResponseEntity.ok("Ubicacion con id " + id + " fue eliminada con exito. ");
    }
}
