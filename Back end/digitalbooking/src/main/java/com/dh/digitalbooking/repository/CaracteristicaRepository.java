package com.dh.digitalbooking.repository;

import com.dh.digitalbooking.entities.Caracteristica;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CaracteristicaRepository extends JpaRepository<Caracteristica,Long> {
}
