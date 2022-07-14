package com.dh.digitalbooking.repository;

import com.dh.digitalbooking.entities.Producto;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;

import java.util.List;
import java.util.Optional;

@Repository
public interface ProductoRepository extends JpaRepository<Producto, Long> {

    Optional<List<Producto>> findAllByUbicacionId(Long id);

    Optional<List<Producto>> findAllByCategoriaId(Long id);

    @Query(value = "select * from productos left join reservas on productos.id = reservas.id_producto where ((reservas.fechaInicio not between ?1 and ?2) " +
            "or (reservas.fechaInicio is null)) and ((reservas.fechaFinal not between ?1 and ?2) or (reservas.fechaFinal is null))and productos.ubicacion like ?3 " +
            "group by productos.id",nativeQuery = true)
    Optional<List<Producto>> findProductoXFechas(LocalDate fechaInicio, LocalDate fechaFinal, Long id) ;


}
