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
// //@Table(name = "prateleira_enderecamento")
// public class PrateleiraEnderecamentoModel {

//   @Id
//   @GeneratedValue(strategy = GenerationType.IDENTITY)
//   private Long id_prateleira;

//   @Column(name = "desc_prateleira")
//   private String desc_prateleira;

//   @ManyToOne(fetch = FetchType.LAZY)
//   @JoinColumn(name = "id_estante")
//   private EstanteEnderecamentoModel estante;

//   @ManyToOne(fetch = FetchType.LAZY)
//   @JoinColumn(name = "id_box")
//   private BoxEnderecamentoModel box;

//   public PrateleiraEnderecamentoModel() {}

//   public PrateleiraEnderecamentoModel(String desc_prateleira, EstanteEnderecamentoModel estante, BoxEnderecamentoModel box) {
//     this.desc_prateleira = desc_prateleira;
//     this.estante = estante;
//     this.box = box;
//   }

//   // Getters and setters
//   // ...
// }
