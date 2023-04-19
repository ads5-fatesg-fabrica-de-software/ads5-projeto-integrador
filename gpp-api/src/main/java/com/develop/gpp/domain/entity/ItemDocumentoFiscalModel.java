package com.develop.gpp.domain.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Table;
import javax.persistence.ManyToOne;



import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "item_documento_fiscal")
public class ItemDocumentoFiscalModel {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer idItemDocFiscal;

    private Integer numDocFiscal;

    private Integer idDocumentoFiscal;

    @ManyToOne
    private ProdutoModel produto;

    private Integer qtde;

    private Double valorVenda;

    // Default constructor
    public ItemDocumentoFiscalModel() {
    }

}
