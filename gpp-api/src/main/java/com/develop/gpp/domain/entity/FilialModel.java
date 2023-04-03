package com.develop.gpp.domain.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
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
@Table(name = "filial")
public class FilialModel {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_filial")
    private Integer idFilial;


    @Column(name = "sigla")
    private String sigla;


    private Integer numeroFilial;

    // @OneToOne(mappedBy = "filial")
    // private ClienteFilialModel clienteFilial;

    public FilialModel() {
    }

    public FilialModel(Integer idFilial, String sigla) {
        this.idFilial = idFilial;
        this.sigla = sigla;
        // this.clienteFilial = clienteFilial;
    }

}
