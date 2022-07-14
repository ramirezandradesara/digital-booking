package com.dh.digitalbooking.controller;

import com.dh.digitalbooking.Exceptions.BadRequetsException;
import com.dh.digitalbooking.Exceptions.ResourceNotFoundException;
import com.dh.digitalbooking.entities.Producto;
import com.dh.digitalbooking.entities.Reserva;
import com.dh.digitalbooking.service.ReservaService;
import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.v3.oas.annotations.Operation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.print.attribute.standard.MediaSize;
import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/reservas")
public class ReservaController {
    //instanciamos los servicios que le daremos a nuestra api
    @Autowired
    ReservaService reservaService;
    //get por id
    @Operation(summary = "Buscar reserva por id")
    @GetMapping("/{id}")
    public ResponseEntity<Reserva> buscarReserva(@PathVariable Long id)  {
        Optional<Reserva> reservaBuscada = reservaService.buscarReservaXId(id);
        return reservaBuscada.map(ResponseEntity::ok).orElseGet(() -> ResponseEntity.status(HttpStatus.NOT_FOUND).build());
    }

    //metodo get por producto id
    @Operation(summary = "trae una lista de reservas segun el id de su producto")
    @GetMapping("/producto/{id}")
    public ResponseEntity <List<Reserva>> buscarReservasXproducto(@PathVariable Long id)  {
        Optional<List<Reserva>> reservasBuscadas=reservaService.listarReservasXProductoId(id);
        return reservasBuscadas.map(ResponseEntity::ok).orElseGet(()-> ResponseEntity.status(HttpStatus.NOT_FOUND).build());
    }
    //metodo get por usuario id
    @Operation(summary = "trae una lista de reservas segun el id de su usuario")
    @GetMapping("/usuario/{id}")
    public ResponseEntity<List<Reserva>>buscarReservasXusuario(@PathVariable Long id){
        Optional<List<Reserva>> reservasBuscadas=reservaService.listarReservasXUsuarioId(id);
        return reservasBuscadas.map(ResponseEntity::ok).orElseGet(()-> ResponseEntity.status(HttpStatus.NOT_FOUND).build());

    }
    //listar todas las reservas
    @Operation(summary = "buasca todas las reservas " )
    @GetMapping
    public ResponseEntity<List<Reserva>> listarReservas() {
        return ResponseEntity.ok(reservaService.listarReservas());
    }
    //metodo post
    @Operation(summary = "Crear una nueva reserva")
    @PostMapping
    public ResponseEntity <Reserva> agregarReserva(@RequestBody Reserva reserva) {
        return ResponseEntity.status(HttpStatus.CREATED).body(reservaService.agregarReserva(reserva));
    }
    //metodo put (opcional)
    @Operation(summary = "Edita una reserva ")
    @PutMapping
    public ResponseEntity<Reserva> editarReserva(@RequestBody Reserva reserva) throws BadRequetsException {
        Reserva reservaeditada=reservaService.editarReserva(reserva);
        return ResponseEntity.ok(reservaeditada);
    }
    //metodo delete(opcional)
    @Operation(summary = "Borra a la reserva que especificamos por su id ")
    @DeleteMapping("{id}")
    public ResponseEntity<String> eliminarReserva(@PathVariable Long id ) throws ResourceNotFoundException {
        reservaService.eliminarReservaXId(id);
        return ResponseEntity.ok("Reserva con id "+ id+" fue eliminada con exito. ");
    }
}
