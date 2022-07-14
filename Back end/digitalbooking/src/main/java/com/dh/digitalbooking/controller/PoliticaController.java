package com.dh.digitalbooking.controller;

import com.dh.digitalbooking.Exceptions.BadRequetsException;
import com.dh.digitalbooking.Exceptions.ResourceNotFoundException;
import com.dh.digitalbooking.entities.Politica;
import com.dh.digitalbooking.service.PoliticaService;
import io.swagger.v3.oas.annotations.Operation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/politicas")
public class PoliticaController {
    //instanciamos los servicios que le daremos a nuestra api
    @Autowired
    PoliticaService politicaService;
    //metodo get
    @Operation(summary = "Traer todas las politicass")
    @GetMapping
    public ResponseEntity<List<Politica>> listarPoliticas(){
        return ResponseEntity.ok(politicaService.listarPoliticas());
    }
    //get por id
    @Operation(summary = "Buscar politica por id")
    @GetMapping("/{id}")
    public ResponseEntity<Politica> buscarPolitica(@PathVariable Long id) throws ResourceNotFoundException {
        Optional<Politica> politicaBuscada = politicaService.buscarPoliticaXId(id);
        return politicaBuscada.map(ResponseEntity::ok).orElseGet(() -> ResponseEntity.status(HttpStatus.NOT_FOUND).build());
    }
    //metodo post
    @Operation(summary = "Crear una nueva politica")
    @PostMapping
    public ResponseEntity <Politica> agregarPolitica(@RequestBody Politica politica){
        return ResponseEntity.ok(politicaService.agregarPolitica(politica));
    }
    //metodo put
    @Operation(summary = "Edita una politica ")
    @PutMapping
    public ResponseEntity<Politica> editarPolitica(@RequestBody Politica politica) throws BadRequetsException {
        Politica politicaeditada=politicaService.editarPolitica(politica);
        return ResponseEntity.ok(politicaeditada);
    }
    //metodo delete
    @Operation(summary = "Borra a la politica que especificamos por su id ")
    @DeleteMapping("{id}")
    public ResponseEntity<String> eliminarPolitica(@PathVariable Long id ) throws ResourceNotFoundException {
        politicaService.eliminarPoliticaXId(id);
        return ResponseEntity.ok("Politica con id "+ id+" fue eliminada con exito. ");
    }
}
