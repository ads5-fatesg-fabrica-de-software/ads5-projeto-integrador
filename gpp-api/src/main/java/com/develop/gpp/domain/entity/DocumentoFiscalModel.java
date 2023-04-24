package com.develop.gpp.domain.entity;

import java.time.LocalDateTime;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "documento_fiscal")
public class DocumentoFiscalModel {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer idDocumentoFiscal;

    private Integer idFilialSaida;

    private String cpfCnpj;

    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer numDocFiscal;

    private String serieDocFiscal;

    private LocalDateTime dataEmissao;

    @OneToMany(mappedBy = "documentoFiscal")
    private List<ItemDocumentoFiscalModel> itens;

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "id_cliente")
    private ClienteModel cliente;

    private String descricao;

    private String fornecedor;

}
