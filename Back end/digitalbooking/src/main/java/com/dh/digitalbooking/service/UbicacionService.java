package com.dh.digitalbooking.service;

import com.dh.digitalbooking.Exceptions.BadRequetsException;
import com.dh.digitalbooking.Exceptions.ResourceNotFoundException;
import com.dh.digitalbooking.entities.Ubicacion;
import com.dh.digitalbooking.repository.UbicacionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class UbicacionService {
    @Autowired
    UbicacionRepository repository;
    //inicializamos nuestros servicios

    //agregar ubicacion
    public Ubicacion agregarUbicacion(Ubicacion ubicacion){

        return repository.save(ubicacion);
    }
    //listar ubicaciones
    public List<Ubicacion> listarUbicaciones(){
        return  repository.findAll();
    }
    //buscar ubicaciones
    public Optional<Ubicacion> buscarUbicacionXId(Long id){
        return repository.findById(id);
    }
    //editar ubicacion
    public Ubicacion editarUbicacion(Ubicacion ubicacion)throws BadRequetsException {
        Optional<Ubicacion> ubicacionBuscada = buscarUbicacionXId(ubicacion.getId());
        if (ubicacionBuscada.isPresent()){
            return repository.save(ubicacion);
        }
        else {
            throw new BadRequetsException("No se pudo actualizar la ubicacion con id : "+ ubicacion.getId()+" con nombre: "+ ubicacion.getCiudad()+
                    " con pais : "+ ubicacion.getPais()+" con el continente  : " + ubicacion.getContinente()+" ya que no se encuentran los elementos necesarios"
                    +"para realizar la peticion. ");
        }

    }
    //eliminar ubicacion(opcional)
    public void eliminarUbicacionXId(Long id) throws ResourceNotFoundException {
        Optional<Ubicacion> ubicacionBuscada = buscarUbicacionXId(id);
        if (ubicacionBuscada.isPresent()){
            repository.deleteById(id);
        }else{
            throw new ResourceNotFoundException("No existe la ubicacion con id : "+id+" no se puede borrar");
        }

    }
}
