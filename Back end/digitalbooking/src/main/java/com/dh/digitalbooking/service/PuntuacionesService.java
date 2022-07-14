package com.dh.digitalbooking.service;

import com.dh.digitalbooking.Exceptions.BadRequetsException;
import com.dh.digitalbooking.Exceptions.ResourceNotFoundException;
import com.dh.digitalbooking.entities.AppUser;
import com.dh.digitalbooking.entities.Producto;
import com.dh.digitalbooking.entities.Puntuacion;
import com.dh.digitalbooking.repository.PuntuacionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class PuntuacionesService {
    @Autowired
    PuntuacionRepository repository;
    @Autowired
    ProductoService productoService;
    @Autowired
    UserService usuarioService;
    //inicializamos nuestros servicios

    //buscar puntuacion por su id
    public Optional<Puntuacion> buscarPuntajeXId(Long id){
        return repository.findById(id);
    }
    //bucar puntuaciones segun el producto
    public Optional <List<Puntuacion>> buscarPuntuacionXProductoId(Long id) {
        return repository.findAllByProductoId(id);
    }
    //agregar puntuacion
    public Puntuacion agregarPuntuacion(Puntuacion puntuacion){
        //seteamos los valores para no pasarle objetos dentro de objetos solo el id
        Optional<Producto> productoBuscado=productoService.buscarProductoXId(puntuacion.getProducto().getId());
        Optional<AppUser> usuarioBuscado=usuarioService.buscarUsuarioPorId(puntuacion.getUsuario().getId());
        puntuacion.setProducto(productoBuscado.get());
        puntuacion.setUsuario(usuarioBuscado.get());
        return repository.save(puntuacion);
    }
    //editar puntuacion(opcional)
    public Puntuacion editarPuntuacion(Puntuacion puntuacion)throws BadRequetsException{
        //se le añaden algunas verificaciones para que realmente se pueda modificar (debe tener elementos de un puntaje existente)
        Optional<Puntuacion> puntuacionBuscada = buscarPuntajeXId(puntuacion.getId());
        Optional<Producto> productoBuscado= productoService.buscarProductoXId(puntuacion.getProducto().getId());
        if (productoBuscado.isPresent()&&puntuacionBuscada.isPresent()){
            return repository.save(puntuacion);
        }else{
            throw new BadRequetsException("No se puede actualizar la puntuacion con id :"+ puntuacion.getId() +" con valor :" +puntuacion.getValor() +" asociada al producto :" + puntuacion.getProducto().getId()+
                    " no se encontraron los datos necesarios para realizar esta peticion");
        }

    }
}

