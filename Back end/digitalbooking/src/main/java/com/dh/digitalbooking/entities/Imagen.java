package com.dh.digitalbooking.entities;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.*;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@AllArgsConstructor @ToString @Getter @Setter @NoArgsConstructor @Entity @Table(name = "imagenes")
public class Imagen {
    @Id @GeneratedValue(strategy = GenerationType.IDENTITY) @NotNull
    private Long id;
    @Column @NotNull @Size(min = 1, max = 250)
    private String titulo;
    @NotNull @Size (min = 1, max = 250) @Column
    private String urlImg;

    @ManyToOne(fetch = FetchType.LAZY,cascade = CascadeType.PERSIST)
    @JoinColumn(name = "id_producto",referencedColumnName = "id")
    @JsonIgnoreProperties(value = {"imagenes","hibernateLazyInitializer","handler","nombre","titulo","descripcion","precio","disponible","latitud","longitud","direccion","caracteristicas","politicas","categoria","ubicacion","imagenes","reservas","puntuaciones"})
    private Producto producto;



}
