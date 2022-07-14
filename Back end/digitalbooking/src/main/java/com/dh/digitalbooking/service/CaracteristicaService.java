package com.dh.digitalbooking.service;
import com.dh.digitalbooking.Exceptions.BadRequetsException;
import com.dh.digitalbooking.Exceptions.ResourceNotFoundException;
import com.dh.digitalbooking.entities.Caracteristica;
import com.dh.digitalbooking.repository.CaracteristicaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Optional;

@Service
public class CaracteristicaService {
    @Autowired
    CaracteristicaRepository repository;
    //inicializamos los servicios:

    //agregar caracteristica
    public Caracteristica agregarCaracteristica(Caracteristica caracteristica) {
        return repository.save(caracteristica);
    }

    //listar caracteristicas
    public List<Caracteristica> listarCaracteristicas() {
        return repository.findAll();
    }

    //buscar Caracteristica por su id
    public Optional<Caracteristica> buscarCaracteristicaXId(Long id) {
        return repository.findById(id);
    }

    //editar caracteristica
    public Caracteristica editarCaracteristica(Caracteristica caracteristica) throws BadRequetsException {
        Optional<Caracteristica> caracteristicaBuscada = buscarCaracteristicaXId(caracteristica.getId());
        if (caracteristicaBuscada.isPresent()) {
            return repository.save(caracteristica);
        } else {
            throw new BadRequetsException("No se pudo actualizar la caracteristica con id: " + caracteristica.getId() + " con nombre: " + caracteristica.getNombre() +
                    "ya que no se encuentran los datos necesarios para realizar la peticion. ");
        }

    }

    //eliminar Caracteristica
    public void eliminarCaracteristicaXId(Long id) throws ResourceNotFoundException {
        Optional<Caracteristica> caracteristicaBuscada = buscarCaracteristicaXId(id);
        if (caracteristicaBuscada.isPresent()) {
            repository.deleteById(id);
        } else {
            throw new ResourceNotFoundException("No existe la caracteristica con id : " + id + " no se puede borrar");
        }

    }
}
