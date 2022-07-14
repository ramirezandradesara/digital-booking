package com.dh.digitalbooking.service;
import com.dh.digitalbooking.entities.Rol;
import com.dh.digitalbooking.repository.RolRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class RolService {
    @Autowired
    RolRepository repository;
    //inicializamos nuestros servicios.

    //buscar rol por su id
    public Optional<Rol> buscarRolXId(Long id){
        return repository.findById(id);
    }

}
