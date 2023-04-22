package com.develop.gpp.domain.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Table;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import java.math.BigDecimal;
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

    @ManyToOne
    @JoinColumn(name = "documento_fiscal_id")
    private DocumentoFiscalModel documentoFiscal;

    @ManyToOne
    private ProdutoModel produto;

    private Integer qtde;

    private BigDecimal valorVenda;

    public BigDecimal valorTotal() {

        return BigDecimal.valueOf(valorVenda.doubleValue() * qtde);
    }

}
