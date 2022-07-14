package com.dh.digitalbooking.entities;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.*;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.HashSet;
import java.util.Set;

@Getter @Setter @NoArgsConstructor @AllArgsConstructor @Entity @Table(name = "caracteristicas") @ToString
public class Caracteristica {
    @Id @GeneratedValue(strategy = GenerationType.IDENTITY) @NotNull
    private Long id;
    @Column @NotNull @Size(min = 1, max = 100)
    private String nombre;
    @Column @NotNull @Size(min = 1,max = 250)
    private String icono;
    @JsonIgnore
    @ManyToMany(mappedBy = "caracteristicas",fetch = FetchType.LAZY)
    private Set<Producto> productos = new HashSet<>();


}
