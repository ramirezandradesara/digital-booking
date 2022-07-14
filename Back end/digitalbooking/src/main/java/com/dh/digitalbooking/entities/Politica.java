package com.dh.digitalbooking.entities;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.HashSet;
import java.util.Set;


@Getter @Setter @NoArgsConstructor @AllArgsConstructor @Entity @Table(name = "politicas")
public class Politica {
    @Id @GeneratedValue(strategy = GenerationType.IDENTITY) @NotNull
    private Long id;
    @Column @NotNull @Size(min = 1,max = 100)
    private String tipo;
    @Column @NotNull @Size (min = 1, max = 250)
    private String titulo;
    @Column @NotNull @Size(min = 1)
    private String descripcion;
    @JsonIgnore
    @ManyToMany(mappedBy = "politicas",fetch = FetchType.LAZY)
    private Set<Producto> productos = new HashSet<>();



}
