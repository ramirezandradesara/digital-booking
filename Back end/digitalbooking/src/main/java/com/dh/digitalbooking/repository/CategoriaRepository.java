package com.dh.digitalbooking.repository;

import com.dh.digitalbooking.entities.Categoria;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;



@Repository
public interface CategoriaRepository extends JpaRepository<Categoria,Long> {
}
