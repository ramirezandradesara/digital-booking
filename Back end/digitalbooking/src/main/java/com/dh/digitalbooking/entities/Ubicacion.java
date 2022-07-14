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


@Getter
@Setter
@Entity
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "ubicaciones")
public class Ubicacion {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @NotNull
    private Long id;
    @Column
    @NotNull
    @Size(min = 1, max = 250)
    private String ciudad;
    @Column
    @NotNull
    @Size (min = 1, max = 250)
    private String pais;
    @Column
    @NotNull
    @Size (min = 1, max = 250)
    private String continente;


     @OneToMany(mappedBy = "ubicacion",fetch = FetchType.LAZY)
     @JsonIgnore
     private Set<Producto> productos=new HashSet<>();

}
