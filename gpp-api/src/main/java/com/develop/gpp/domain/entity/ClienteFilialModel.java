package com.develop.gpp.domain.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "cliente_filial")
public class ClienteFilialModel {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Integer idCliente;

  private int idFilial;

  @OneToOne
  @JoinColumn(name = "cliente_id")
  private ClienteModel cliente;

  @OneToOne
  @JoinColumn(name = "filial_id")
  private FilialModel filial;

  public ClienteFilialModel() {
  }

  public ClienteFilialModel(Integer idCliente, int idFilial, ClienteModel cliente, FilialModel filial) {
    this.idCliente = idCliente;
    this.idFilial = idFilial;
    this.cliente = cliente;
    this.filial = filial;
  }

}
