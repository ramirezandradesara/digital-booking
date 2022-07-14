package com.dh.digitalbooking.repository;

import com.dh.digitalbooking.entities.Ubicacion;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UbicacionRepository extends JpaRepository <Ubicacion,Long>{
}
