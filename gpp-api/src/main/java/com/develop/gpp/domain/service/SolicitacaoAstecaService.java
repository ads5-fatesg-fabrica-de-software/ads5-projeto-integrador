package com.develop.gpp.domain.service;

import java.util.List;
import java.util.Optional;

import org.apache.catalina.connector.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestBody;

import com.develop.gpp.domain.entity.SolicitacaoAstecaModel;
import com.develop.gpp.domain.enumeradores.SituacaoAstecaEnum;
import com.develop.gpp.domain.repository.SolicitacaoAstecaRepository;

@Service
public class SolicitacaoAstecaService {

    @Autowired
    private SolicitacaoAstecaRepository solicitacaoAstecaRepository;

   
    // public SolicitacaoAstecaService(SolicitacaoAstecaRepository solicitacaoAstecaRepository) {
    //     this.solicitacaoAstecaRepository = solicitacaoAstecaRepository;
    // }

    public ResponseEntity<SolicitacaoAstecaModel> salvarAsteca(@RequestBody SolicitacaoAstecaModel asteca) {
        SolicitacaoAstecaModel solicitacaoSalva = solicitacaoAstecaRepository.save(asteca);

        return new ResponseEntity<>(solicitacaoSalva, HttpStatus.CREATED);
    }

    public ResponseEntity<SolicitacaoAstecaModel> executarSolicitacao(@RequestBody SolicitacaoAstecaModel asteca ){

        asteca.setSituacaoAsteca(SituacaoAstecaEnum.EMEXECUCAO);

        SolicitacaoAstecaModel solicitacaoSalva = solicitacaoAstecaRepository.save(asteca);
        return new ResponseEntity<>(solicitacaoSalva, HttpStatus.OK);

    }

    public List<SolicitacaoAstecaModel> listarTodas() {

      


        return solicitacaoAstecaRepository.findAll();
    }

}
