package com.dh.digitalbooking.service;

import com.dh.digitalbooking.Exceptions.BadRequetsException;
import com.dh.digitalbooking.Exceptions.ResourceNotFoundException;
import com.dh.digitalbooking.entities.*;
import com.dh.digitalbooking.repository.ProductoRepository;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.HashSet;
import java.util.List;
import java.util.Optional;
import java.util.Set;

@Service
public class ProductoService {
    @Autowired
    ProductoRepository repository;
    @Autowired
    UbicacionService ubicacionService;
    @Autowired
    CategoriaService categoriaService;
    @Autowired
    CaracteristicaService caracteristicaService;
    @Autowired
    PoliticaService politicaService;

    // inicializamos nuestros servicios:

    //agregar producto
    public Producto agregarProducto(Producto producto) {
        //seteamos los valores para no pasarle objetos dentro de objetos solo el id
     Optional<Categoria> categoriaBuscada=categoriaService.buscarCategoriaXId(producto.getCategoria().getId());
     Optional<Ubicacion> ubicacionBuscada=ubicacionService.buscarUbicacionXId(producto.getUbicacion().getId());
     producto.setCategoria(categoriaBuscada.get());
     producto.setUbicacion(ubicacionBuscada.get());
     //inicializamos un array para meterle los valores por id
        Set<Caracteristica> caracteristicas = new HashSet<>();
         for (Caracteristica caracteristica : producto.getCaracteristicas()){
             //buscamos cada id de caracteristicas y lo añadimos al array
            Optional<Caracteristica>caracteristicaBuscada=caracteristicaService.buscarCaracteristicaXId(caracteristica.getId());
            caracteristicas.add(caracteristicaBuscada.get());
         }
         //seteamos que el array de caracteristicas del producto sea igual al que creamos
         producto.setCaracteristicas(caracteristicas);

        //inicializamos un array para meterle los valores por id
         Set<Politica> politicas=new HashSet<>();

         for(Politica politica : producto.getPoliticas()){
             // buscamos cada id de caracteristicas y lo añadimos al array
             Optional<Politica> politicaBuscada = politicaService.buscarPoliticaXId(politica.getId());
             politicas.add(politicaBuscada.get());
         }
         //seteamos que el array de politicas sea igual al que creamos
        producto.setPoliticas(politicas);
        return repository.save(producto);
    }
    //listar productos
    public List<Producto> listarProductos(){
        return  repository.findAll();
    }
    //buscar producto por su id
    public Optional<Producto> buscarProductoXId(Long id){
        return repository.findById(id);
    }

    //buscar producto por su ubicacion
    public Optional<List<Producto>> listarProductoXUbicacion(Long id) {
       return repository.findAllByUbicacionId(id);

    }
    //buscar producto por su categoria
    public Optional <List<Producto>> listarProductosXCategoria(Long id) {
       return repository.findAllByCategoriaId(id);

    }
    //buscar producto por su ubicacion junto a las dos fechas que yo le pase
    public Optional <List<Producto>> listarProductosXUbicacionFechas(Long id ,LocalDate fechaInicio, LocalDate fechaFinal){
        return repository.findProductoXFechas(fechaInicio,fechaFinal,id);
    }


    //editar producto
    public Producto editarProducto(Producto producto) throws BadRequetsException{
        //se le añaden algunas verificaciones para que realmente se pueda modificar (debe tener elementos de un producto existente)
        //se le pueden añadir mas segiridad.
        Optional<Producto> productoBuscado=buscarProductoXId(producto.getId());
        Optional<Ubicacion> ubicacionBuscada=ubicacionService.buscarUbicacionXId(producto.getUbicacion().getId());
        Optional<Categoria> categoriaBuscada=categoriaService.buscarCategoriaXId(producto.getCategoria().getId());
        if (productoBuscado.isPresent()&&ubicacionBuscada.isPresent()&&categoriaBuscada.isPresent()){
            return repository.save(producto);
        }else{
            throw new BadRequetsException("No se puede actualizar el Producto con el id : " +producto.getId()+
                    " ya que no se encuentran los datos necesarios para realizar la peticion." );
        }

    }

    //eliminar producto (opcional)
    public void eliminarProductoXId(Long id) throws ResourceNotFoundException {
        Optional<Producto> productoBuscado = buscarProductoXId(id);
        if (productoBuscado.isPresent()){
            repository.deleteById(id);
        }else{
            throw new ResourceNotFoundException("No existe el producto con id : "+id+" no se puede borrar");
        }

    }

}
