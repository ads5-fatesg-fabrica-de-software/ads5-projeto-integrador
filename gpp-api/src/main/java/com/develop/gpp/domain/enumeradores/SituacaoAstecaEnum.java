package com.develop.gpp.domain.enumeradores;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@ToString
public enum SituacaoAstecaEnum {

    EMABERTO("Em aberto", 1),
    CANCELADA("Cancelada", 2),
    EMEXECUCAO("Em Execução", 3),
    FINALIZADA("Finalizada", 4);

    private int valor;
    private String descricao;

    private SituacaoAstecaEnum(String descricao, int valor) {
        this.descricao = descricao;
        this.valor = valor;
    }

}
