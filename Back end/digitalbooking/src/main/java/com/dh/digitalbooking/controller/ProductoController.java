package com.dh.digitalbooking.controller;


import com.dh.digitalbooking.Exceptions.BadRequetsException;
import com.dh.digitalbooking.Exceptions.ResourceNotFoundException;
import com.dh.digitalbooking.entities.Producto;
import com.dh.digitalbooking.service.ProductoService;
import io.swagger.v3.oas.annotations.Operation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.Date;
import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/productos")
public class ProductoController {
    //intanciamos los servicios que le daremos a nuestra api
    @Autowired
    ProductoService productoService;

    //metodo get
    @Operation(summary = "Traer todos los productos")
    @GetMapping
    public ResponseEntity<List<Producto>> listarProductos() {
        return ResponseEntity.ok(productoService.listarProductos());
    }
    //get por id
    @Operation(summary = "Buscar producto por id")
    @GetMapping("/{id}")
    public ResponseEntity<Producto> buscarProducto(@PathVariable Long id) {
        Optional<Producto> productoBuscado = productoService.buscarProductoXId(id);
        return productoBuscado.map(ResponseEntity::ok).orElseGet(() -> ResponseEntity.status(HttpStatus.NOT_FOUND).build());
    }
    //metodo get por ubicacion
    @Operation(summary = "trae una lista de productos segun el id de su ciudad")
    @GetMapping("/ubicacion/{id}")
    public ResponseEntity <List<Producto>> buscarProductosXciudad(@PathVariable Long id)  {
        Optional<List<Producto>> productosBuscados=productoService.listarProductoXUbicacion(id);
        return productosBuscados.map(ResponseEntity::ok).orElseGet(()-> ResponseEntity.status(HttpStatus.NOT_FOUND).build());
    }
    //metodo get por categoria
    @Operation(summary = "trae una lista de productos segun el id de su categoria")
    @GetMapping("/categoria/{id}")
    public ResponseEntity <List<Producto>> buscarProductosXcategoria(@PathVariable Long id) {
        Optional<List<Producto>> productosBuscados=productoService.listarProductosXCategoria(id);
        return productosBuscados.map(ResponseEntity::ok).orElseGet(()-> ResponseEntity.status(HttpStatus.NOT_FOUND).build());
    }
    //metodo get por ubicacion y fechas
    @Operation(summary = "trae una lista de productos cuando le pasamos el id de ubicacion y una fecha inicial y final")
    @GetMapping("/ubicacion/{id}/fechainicial/{fechaInicial}/fechafinal/{fechaFinal}")
    public ResponseEntity <List<Producto>> buscarProductoXUbicacionYFechas(@PathVariable Long id, @DateTimeFormat (iso = DateTimeFormat.ISO.DATE)@PathVariable LocalDate fechaInicial,
                                                                           @DateTimeFormat(iso = DateTimeFormat.ISO.DATE)@PathVariable LocalDate fechaFinal){

        Optional<List<Producto>> productosBuscados=productoService.listarProductosXUbicacionFechas(id,fechaInicial,fechaFinal);
        return productosBuscados.map(ResponseEntity::ok).orElseGet(()->ResponseEntity.status(HttpStatus.NOT_FOUND).build());
    }
    //optional(prueba si funciona eliminar get ubicacion y ubicacion y fechas)
    @Operation(summary = "filtra una lista de productos podemos pasarle el id de la ubicacion o ubicacion y un rango de fechas")
    @GetMapping("/filter")
    public ResponseEntity<List<Producto>> filtroUbicacionXfecha(@RequestParam (required = false)Long id,
                                                                @DateTimeFormat (iso = DateTimeFormat.ISO.DATE)@RequestParam (required = false)LocalDate fechaInicial,
                                                                @DateTimeFormat (iso = DateTimeFormat.ISO.DATE)@RequestParam (required = false)LocalDate fechaFinal){

        if (id==null && fechaInicial==null&fechaFinal==null) {
            return ResponseEntity.ok(productoService.listarProductos());
        }else if (fechaInicial==null&& fechaFinal==null){
            Optional<List<Producto>> productosBuscados=productoService.listarProductoXUbicacion(id);
            return productosBuscados.map(ResponseEntity::ok).orElseGet(()-> ResponseEntity.status(HttpStatus.NOT_FOUND).build());
        }else{
            Optional<List<Producto>> productosBuscados=productoService.listarProductosXUbicacionFechas(id,fechaInicial,fechaFinal);
            return productosBuscados.map(ResponseEntity::ok).orElseGet(()->ResponseEntity.status(HttpStatus.NOT_FOUND).build());
        }
    }

    //metodo post
    @Operation(summary = "Crear un nuevo producto")
    @PostMapping
    public ResponseEntity<Producto> agregarProducto(@RequestBody Producto producto) {
        return ResponseEntity.status(HttpStatus.CREATED).body(productoService.agregarProducto(producto));
    }
    //metodo put
    @Operation(summary = "Edita una producto ")
    @PutMapping
    public ResponseEntity<Producto> editarProducto(@RequestBody Producto producto) throws BadRequetsException {
        Producto productoEditado=productoService.editarProducto(producto);
        return ResponseEntity.ok(productoEditado);
    }

    //metodo delete
    @Operation(summary = "Borra el producto que especificamos por su id ")
    @DeleteMapping("{id}")
    public ResponseEntity<String> eliminarProducto(@PathVariable Long id) throws ResourceNotFoundException {
        productoService.eliminarProductoXId(id);
        return ResponseEntity.ok("Producto con id " + id + " fue eliminado con exito. ");
    }


}
