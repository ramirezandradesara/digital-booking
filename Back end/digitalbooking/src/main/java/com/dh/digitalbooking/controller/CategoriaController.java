package com.dh.digitalbooking.controller;

import com.dh.digitalbooking.Exceptions.BadRequetsException;
import com.dh.digitalbooking.Exceptions.ResourceNotFoundException;
import com.dh.digitalbooking.entities.Categoria;
import com.dh.digitalbooking.service.CategoriaService;
import io.swagger.v3.oas.annotations.Operation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/categorias")
public class CategoriaController {
    //intanciamos los servicios que le daremos a nuestra api
    @Autowired
    CategoriaService categoriaService;

    //metodo get
     @Operation(summary = "Traer todas las categorias")
     @GetMapping
    public ResponseEntity<List<Categoria>> listarCategorias(){
         return ResponseEntity.ok(categoriaService.listarCategorias());
     }
     //metodo post
     @Operation(summary = "Crear una nueva categoria")
     @PostMapping
    public ResponseEntity <Categoria> agregarCategoria(@RequestBody Categoria categoria){
         return ResponseEntity.ok(categoriaService.agregarCategoria(categoria));
     }
     //metodo put
     @Operation(summary = "Edita una categoria ")
     @PutMapping
    public ResponseEntity<Categoria> editarCategoria(@RequestBody Categoria categoria) throws BadRequetsException {
         Categoria categoriaEditada=categoriaService.editarCategoria(categoria);
         return ResponseEntity.ok(categoriaEditada);
    }
    //metodo delete
    @Operation(summary = "Borra a la categoria que especificamos por su id ")
    @DeleteMapping("{id}")
    public ResponseEntity<String> eliminarCategoria(@PathVariable Long id ) throws ResourceNotFoundException {
         categoriaService.eliminarCategoriaXId(id);
         return ResponseEntity.ok("Categoria con id "+ id+" fue eliminada con exito. ");
    }
}
