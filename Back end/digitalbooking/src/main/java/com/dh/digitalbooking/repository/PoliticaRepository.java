package com.dh.digitalbooking.repository;

import com.dh.digitalbooking.entities.Politica;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PoliticaRepository extends JpaRepository<Politica,Long> {
}
