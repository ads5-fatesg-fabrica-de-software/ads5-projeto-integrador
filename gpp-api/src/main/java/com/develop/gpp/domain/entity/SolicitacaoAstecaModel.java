package com.develop.gpp.domain.entity;
import java.util.Date;
import java.util.List;

import javax.persistence.CollectionTable;
import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "solicitacao_asteca")
public class SolicitacaoAstecaModel {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_asteca")
    private Integer idAsteca;

   
    private String astecaMotivo;

   
    private Integer tipoAsteca;

   
    private Long idFilialRegistro;

    
    private String observacao;

  
    private String defeitoEstadoProd;

   
    @Temporal(TemporalType.DATE)
    private Date dataCriacao;

   @ManyToOne
   @JoinColumn(name = "id_doc")
    private DocumentoFiscalModel documentoFiscal;

    @Column(name = "funcionario")
    private String funcionario;

    @Column(name = "pedido_saida")
    private String pedidoSaida;

    @Column(name = "pedido_entrada")
    private String pedidoEntrada;

    @ElementCollection
    @CollectionTable(name = "asteca_pendencias", joinColumns = @JoinColumn(name = "id_asteca"))
    @Column(name = "asteca_pendencias")
    private List<String> astecaPendencias;

   
}
