// package com.develop.gpp.domain.entity;

// import javax.persistence.Entity;
// import javax.persistence.GeneratedValue;
// import javax.persistence.GenerationType;
// import javax.persistence.Id;
// import javax.persistence.JoinColumn;
// import javax.persistence.ManyToMany;
// import javax.persistence.ManyToOne;
// import javax.persistence.Table;

// import lombok.Getter;
// import lombok.Setter;

// @Getter
// @Setter
// @Entity
// @Table(name = "produto_peca")
// public class ProdutoPecaModel {

//   @Id
//   @GeneratedValue(strategy = GenerationType.IDENTITY)
//   private Integer idProdutoPeca;

//   private int quantidadePorProduto;

//   @ManyToOne
//   @JoinColumn(name = "id_peca")
//   private PecaModel peca;

//   @ManyToOne
//   @JoinColumn(name = "id_produto")
//   private ProdutoModel produto;

//   private int status;

//   private int situacao;

 
// }
