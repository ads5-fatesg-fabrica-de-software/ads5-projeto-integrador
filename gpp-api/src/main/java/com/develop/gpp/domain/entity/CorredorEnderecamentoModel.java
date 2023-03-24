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
// //@Table(name = "corredor_enderecamento")
// public class CorredorEnderecamentoModel {
//   @Id
//   @GeneratedValue(strategy = GenerationType.IDENTITY)
//   @Column(name = "id_corredor")
//   private int idCorredor;

//   @Column(name = "desc_corredor")
//   private String descCorredor;

//   @Column(name = "id_piso")
//   private int idPiso;

//   @ManyToOne(fetch = FetchType.LAZY)
//   @JoinColumn(name = "id_piso", referencedColumnName = "id_piso", insertable = false, updatable = false)
//   private PisoEnderecamentoModel piso;

//   @ManyToOne(fetch = FetchType.LAZY)
//   @JoinColumn(name = "id_estante", referencedColumnName = "id_estante")
//   private EstanteEnderecamentoModel estante;

//   // Constructors, getters, and setters omitted for brevity
// }
