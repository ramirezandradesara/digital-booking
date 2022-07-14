package com.dh.digitalbooking.service;

import com.dh.digitalbooking.Exceptions.BadRequetsException;
import com.dh.digitalbooking.Exceptions.ResourceNotFoundException;
import com.dh.digitalbooking.entities.Categoria;
import com.dh.digitalbooking.repository.CategoriaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class CategoriaService {
    @Autowired
    CategoriaRepository repository;
    // inicializamos nuestros servicios:

    //agregar categoria
    public Categoria agregarCategoria(Categoria categoria){

        return repository.save(categoria);
    }
    //listar categorias
    public List<Categoria> listarCategorias(){
        return  repository.findAll();
    }

    //buscar categoria por su id
    public Optional<Categoria> buscarCategoriaXId(Long id){
        return repository.findById(id);
    }
    //editar categoria (opcional)
    public Categoria editarCategoria(Categoria categoria)throws BadRequetsException {
        Optional<Categoria> categoriaBuscada = buscarCategoriaXId(categoria.getId());
        if (categoriaBuscada.isPresent()){
            return repository.save(categoria);
        }
        else {
            throw new BadRequetsException("No se pudo actualizar la categoria con id : "+categoria.getId()+" con nombre : "+categoria.getTitulo()+
                    " con descripcion : "+categoria.getDescripcion()+" con la url : " + categoria.getUrlImagen()+" ya que no se encuentran los elementos necesarios"
                    +"para realizar la peticion. ");
        }

    }
    //eliminar categoria (opcional)
    public void eliminarCategoriaXId(Long id) throws ResourceNotFoundException {
        Optional<Categoria> categoriaBuscada = buscarCategoriaXId(id);
        if (categoriaBuscada.isPresent()){
            repository.deleteById(id);
        }else{
            throw new ResourceNotFoundException("No existe la categoria con id : "+id+" no se puede borrar");
        }

    }


}
