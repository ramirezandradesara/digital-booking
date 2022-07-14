package com.dh.digitalbooking.service;

import com.dh.digitalbooking.Exceptions.BadRequetsException;
import com.dh.digitalbooking.Exceptions.ResourceNotFoundException;
import com.dh.digitalbooking.entities.Imagen;
import com.dh.digitalbooking.entities.Producto;
import com.dh.digitalbooking.repository.ImagenRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Optional;

@Service
public class ImagenService {

    @Autowired
    ImagenRepository repository;
    @Autowired
    ProductoService productoService;

    //inicializamos nuestros servicios.

    //agregar imagen.
    public Imagen agregarImagen(Imagen imagen){

     Optional<Producto> productoBuscado=productoService.buscarProductoXId(imagen.getProducto().getId());
     imagen.setProducto(productoBuscado.get());

        return repository.save(imagen);
    }
    //listar imagenes.
    public List<Imagen> listarImagen(){
        return  repository.findAll();
    }
    //buscar Imagen por su id
    public Optional<Imagen> buscarImagenXId(Long id){
        return repository.findById(id);
    }
    //editar imagen
    public Imagen editarImagen(Imagen imagen)throws BadRequetsException {
        Optional<Imagen> imagenBuscada = buscarImagenXId(imagen.getId());
        if (imagenBuscada.isPresent()){
            return repository.save(imagen);
        }
        else {
            throw new BadRequetsException("No se pudo actualizar la imagen con id : "+imagen.getId()+" con titulo : "+imagen.getTitulo()+
                    " con url : "+imagen.getUrlImg()+" ya que no se encuentran los elementos necesarios para realizar la peticion. ");
        }

    }
    //eliminar imagen
    public void eliminarImagenXId(Long id) throws ResourceNotFoundException {
        Optional<Imagen> imagenBuscada = buscarImagenXId(id);
        if (imagenBuscada.isPresent()){
            repository.deleteById(id);
        }else{
            throw new ResourceNotFoundException("No existe la imagen con id : "+id+" no se puede borrar");
        }

    }
}
