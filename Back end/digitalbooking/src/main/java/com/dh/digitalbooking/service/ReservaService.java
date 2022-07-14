package com.dh.digitalbooking.service;

import com.dh.digitalbooking.Exceptions.BadRequetsException;
import com.dh.digitalbooking.Exceptions.ResourceNotFoundException;
import com.dh.digitalbooking.entities.AppUser;
import com.dh.digitalbooking.entities.Producto;
import com.dh.digitalbooking.entities.Reserva;
import com.dh.digitalbooking.repository.ReservaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ReservaService {
    @Autowired
    ReservaRepository repository;
    @Autowired
    ProductoService productoService;
    @Autowired
    UserService userService;
    //inicializamos los servicios

    //agregar reservas:
    public Reserva agregarReserva(Reserva reserva)  {

        Optional<Producto> productoBuscado=productoService.buscarProductoXId(reserva.getProducto().getId());
        reserva.setProducto(productoBuscado.get());

        Optional <AppUser> usuarioBuscado=userService.buscarUsuarioPorId(reserva.getUsuario().getId());
        reserva.setUsuario(usuarioBuscado.get());
        System.out.println("reserva" +reserva );
        return repository.save(reserva);
    }
    //traer reservas (adicional)
    public List<Reserva> listarReservas(){
        return repository.findAll();
    }

    //buscar reserva X id:
    public Optional<Reserva> buscarReservaXId(Long id) {
        return repository.findById(id);
    }
    //buscar reserva por id de producto
    public Optional<List<Reserva>> listarReservasXProductoId(Long id) {
        return repository.findAllByProductoId(id);

    }
    //buscar reserva por id de usuario
    public Optional<List<Reserva>> listarReservasXUsuarioId(Long id){
        return repository.findAllByUsuarioId(id);
    }

    //editar reserva (opcional):
    public Reserva editarReserva(Reserva reserva) throws BadRequetsException {
        Optional<Reserva> reservaBuscada = buscarReservaXId(reserva.getId());
        Optional<Producto> productoBuscado=productoService.buscarProductoXId(reserva.getProducto().getId());
        if (reservaBuscada.isPresent() && productoBuscado.isPresent()) {
            return repository.save(reserva);
        } else {
            throw new BadRequetsException("No se pudo actualizar la Reserva con id " + reserva.getId() +
                    "con hora : " + reserva.getHora() + " con fecha de inicio : " + reserva.getFechaInicio() + "y fecha final : " +
                    reserva.getFechaFinal() + "por que no se encontraron los datos necesarios para realizar la peticion. ");
        }

    }
    //eliminar Reserva (Opcional)
    public void eliminarReservaXId(Long id) throws ResourceNotFoundException{
        Optional<Reserva> reservaBuscada = buscarReservaXId(id);
        if (reservaBuscada.isPresent()){
            repository.deleteById(id);
        }else{
            throw new ResourceNotFoundException("No existe la reserva con id :"+id+"no se puede borrar.");
        }
    }
}
