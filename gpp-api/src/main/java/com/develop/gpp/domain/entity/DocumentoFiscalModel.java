package com.develop.gpp.domain.entity;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
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
    @Column(name = "id_documento_fiscal")
    private Integer idDocumentoFiscal;

    @Column(name = "id_filial_saida")
    private Integer idFilialSaida;

    @Column(name = "nome")
    private String nome;

    @Column(name = "cpf_cnpj")
    private String cpfCnpj;

    @Column(name = "num_doc_fiscal")
    private Integer numDocFiscal;

    @Column(name = "serie_doc_fiscal")
    private String serieDocFiscal;

    @Column(name = "data_emissao")
    private LocalDateTime dataEmissao;

    @OneToOne
    @JoinColumn(name = "id_item_doc_fiscal")
    private ItemDocumentoFiscalModel ItemDocumentoFiscal;

    @ManyToOne
    @JoinColumn(name = "id_cliente")
    private ClienteModel cliente;

    @Column(name = "descricao")
    private String descricao;

    @Column(name = "fornecedor")
    private String fornecedor;

}
