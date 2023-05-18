package com.develop.gpp.domain.entity;

import javax.persistence.*;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "pecas_estoque")
public class PecasEstoqueModel {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer idPecaEstoque;

    @ManyToOne
    @JoinColumn(name = "idPeca")
    private PecaModel peca;

    @Column(nullable = false)
    private Integer saldoDisponivel;

    @Column(nullable = false)
    private Integer saldoReservado;

    private String fornecedor;

    private String endereco;

    private Integer quantidadeMinima;

    private Integer quantidadeMaxima;

    private Integer quantidadeIdeal;


}
