// package com.develop.gpp.domain.entity;

// import javax.persistence.Column;
// import javax.persistence.Entity;
// import javax.persistence.FetchType;
// import javax.persistence.GeneratedValue;
// import javax.persistence.GenerationType;
// import javax.persistence.Id;
// import javax.persistence.JoinColumn;
// import javax.persistence.ManyToOne;
// import javax.persistence.Table;
// import lombok.Getter;
// import lombok.Setter;

// @Getter
// @Setter
// //@Entity
// //@Table(name = "piso_enderecamento")
// public class PisoEnderecamentoModel {

//   @Id
//   @GeneratedValue(strategy = GenerationType.IDENTITY)
//   @Column(name = "id_piso")
//   private Long idPiso;

//   @Column(name = "desc_piso")
//   private String descPiso;

//   @Column(name = "id_filial")
//   private Long idFilial;

//   @ManyToOne(fetch = FetchType.LAZY)
//   @JoinColumn(name = "id_corredor")
//   private CorredorEnderecamentoModel corredor;

//   // Constructors, getters and setters
// }

