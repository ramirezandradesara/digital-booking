package com.dh.digitalbooking.repository;
import com.dh.digitalbooking.entities.Rol;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface RolRepository extends JpaRepository <Rol,Long> {
}
