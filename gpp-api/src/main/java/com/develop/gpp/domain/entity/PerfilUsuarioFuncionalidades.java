package com.develop.gpp.domain.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.ManyToAny;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "perfil_usuario_funcionalidade")
public class PerfilUsuarioFuncionalidades {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer idPerfilUsuarioFuncionalidadade;

    @ManyToOne
    private FuncionalidadesModel funcionalidade;

    @ManyToOne
    private PerfilUsuarioModel perfilUsuario; 
    
}
