package com.dh.digitalbooking.entities;


import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.*;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.time.LocalDate;
import java.time.LocalTime;

@Getter @Setter @ToString
@NoArgsConstructor @AllArgsConstructor @Entity @Table(name = "reservas")
public class Reserva {

    @Id @GeneratedValue(strategy = GenerationType.IDENTITY) @NotNull
    private Long id;
    @Column @NotNull
    private LocalTime hora;
    @Column(name = "fechaInicio") @NotNull
    private LocalDate fechaInicio;
    @Column(name = "fechaFinal") @NotNull
    private LocalDate fechaFinal;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_producto", referencedColumnName = "id")
    @JsonIgnoreProperties(value = {"reservas","imagenes","ubicacion","categoria","politicas","caracteristicas","direccion","longitud","latidud","disponible","precio","descripcion","puntuaciones","titulo","nombre","latitud","hibernateLazyInitializer","handler"})
    private Producto producto;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_usuario",referencedColumnName = "id")
    @JsonIgnoreProperties(value = {"nombre","apellido","email","contraseña","ciudad","rol","reservas","puntuaciones","enabled","hibernateLazyInitializer","handler"})
    private AppUser usuario;

    @Column(name = "datosExtra")
    @NotNull
    private String datosExtra;
    @Column
    @NotNull
    private boolean vacunado;

}
