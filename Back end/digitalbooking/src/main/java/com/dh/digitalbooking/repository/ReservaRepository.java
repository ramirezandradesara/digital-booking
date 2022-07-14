package com.dh.digitalbooking.repository;
import com.dh.digitalbooking.entities.Reserva;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface ReservaRepository extends JpaRepository<Reserva,Long> {
    Optional<List<Reserva>> findAllByProductoId(Long id);
    Optional<List<Reserva>> findAllByUsuarioId(Long id);
}
