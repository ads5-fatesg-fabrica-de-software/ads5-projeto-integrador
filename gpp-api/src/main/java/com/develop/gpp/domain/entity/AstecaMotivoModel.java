package com.develop.gpp.domain.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.time.LocalDateTime;

@Getter
@Setter
@Entity
@Table(name = "asteca_motivo")
public class AstecaMotivoModel {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer idAstecaMotivo;

    @Column(nullable = false)
    private String denominacao;

    @Column(nullable = false)
    private LocalDateTime dataCriacao;

    @Column(nullable = false)
    private LocalDateTime dataAlteracao;

}
