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

@Getter @Setter @Entity @NoArgsConstructor @AllArgsConstructor @Table(name = "categorias")
public class Categoria {
    @Id @GeneratedValue(strategy = GenerationType.IDENTITY) @NotNull
    private Long id;
    @Column @NotNull @Size (min = 1, max = 250)
    private String titulo;
    @Column @NotNull @Size(min = 1)
    private String descripcion;
    @Column() @NotNull @Size (min = 1, max = 250)
    private  String urlImagen;

    @OneToMany(mappedBy = "categoria",fetch = FetchType.LAZY,cascade =CascadeType.ALL)
    @JsonIgnore
    private Set<Producto> productos=new HashSet<>();


}

