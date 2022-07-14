package com.dh.digitalbooking.service;

import com.dh.digitalbooking.Exceptions.BadRequetsException;
import com.dh.digitalbooking.Exceptions.ResourceNotFoundException;
import com.dh.digitalbooking.entities.Imagen;
import com.dh.digitalbooking.entities.Politica;
import com.dh.digitalbooking.repository.ImagenRepository;
import com.dh.digitalbooking.repository.PoliticaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class PoliticaService {
    @Autowired
    PoliticaRepository repository;
    //inicializamos nuestros servicios.

    //agregar politica
    public Politica agregarPolitica (Politica politica){
        return repository.save(politica);
    }
    //listar politicas.
    public List<Politica> listarPoliticas(){
        return  repository.findAll();
    }
    //buscar politica por su id
    public Optional<Politica> buscarPoliticaXId(Long id){
        return repository.findById(id);
    }
    //editar politica
    public Politica editarPolitica(Politica politica)throws BadRequetsException {
        Optional<Politica> politicaBuscada = buscarPoliticaXId(politica.getId());
        if (politicaBuscada.isPresent()){
            return repository.save(politica);
        }
        else {
            throw new BadRequetsException("No se pudo actualizar la politica con id : "+politica.getId()+" con titulo : "+politica.getTitulo()+
                    " con descripcion : "+politica.getDescripcion()+" ya que no se encuentran los elementos necesarios para realizar la peticion. ");
        }

    }
    //eliminar politica
    public void eliminarPoliticaXId(Long id) throws ResourceNotFoundException {
        Optional<Politica> politicaBuscada = buscarPoliticaXId(id);
        if (politicaBuscada.isPresent()){
            repository.deleteById(id);
        }else{
            throw new ResourceNotFoundException("No existe la politica con id : "+id+" no se puede borrar");
        }

    }
}
