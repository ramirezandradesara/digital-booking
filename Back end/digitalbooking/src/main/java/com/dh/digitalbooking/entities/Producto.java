package com.dh.digitalbooking.entities;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.HashSet;
import java.util.Set;

@Getter @Setter @NoArgsConstructor @AllArgsConstructor @Entity @Table(name = "productos")
public class Producto {
    @Id @GeneratedValue(strategy = GenerationType.IDENTITY) @NotNull
    private Long id;
    @Column @NotNull @Size(min = 1, max = 250)
    private String nombre;
    @Column @NotNull @Size(min = 1, max = 250)
    private String titulo;
    @Column @NotNull @Size(min = 1)
    private String descripcion;
    @Column @NotNull
    private double precio;
    @Column @NotNull
    private boolean disponible;
    @Column @NotNull
    private double latitud;
    @Column @NotNull
    private double longitud;
    @Column @NotNull @Size(min = 1,max = 250)
    private String direccion;

    @ManyToMany(cascade = CascadeType.MERGE, fetch = FetchType.LAZY)
    @JoinTable(
            name = "productos_caracteristicas",
            joinColumns = @JoinColumn(name = "id_producto"),
            inverseJoinColumns = @JoinColumn(name = "id_caracteristica")
    )
    private Set<Caracteristica> caracteristicas = new HashSet<>();

    @ManyToMany(cascade = CascadeType.MERGE, fetch = FetchType.LAZY)
    @JoinTable(
            name = "productos_politicas",
            joinColumns = @JoinColumn(name = "id_producto"),
            inverseJoinColumns = @JoinColumn(name = "id_politica")
    )
    private Set<Politica> politicas = new HashSet<>();

    @JsonIgnoreProperties(value = {"hibernateLazyInitializer", "handler"})
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "categoria", referencedColumnName = "id")
    private Categoria categoria;

    @JsonIgnoreProperties(value = {"hibernateLazyInitializer", "handler"})
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "ubicacion", referencedColumnName = "id")
    private Ubicacion ubicacion;

    @OneToMany(mappedBy = "producto", fetch = FetchType.LAZY)
    @JsonIgnoreProperties(value = {"producto"})
    private Set<Imagen> imagenes = new HashSet<>();

    @OneToMany(mappedBy = "producto",fetch =FetchType.LAZY)
    @JsonIgnoreProperties(value = {"producto","usuario"})
    private Set<Reserva> reservas =new HashSet<>();

    @OneToMany(mappedBy = "producto",fetch = FetchType.LAZY)
    @JsonIgnoreProperties(value = {"producto"})
    private Set<Puntuacion> puntuaciones =new HashSet<>();

}