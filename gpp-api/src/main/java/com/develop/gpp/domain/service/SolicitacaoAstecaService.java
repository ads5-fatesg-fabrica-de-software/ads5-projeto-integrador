package com.develop.gpp.domain.service;

import java.util.List;
import java.util.Optional;

import org.apache.catalina.connector.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.develop.gpp.domain.entity.SolicitacaoAstecaModel;
import com.develop.gpp.domain.repository.SolicitacaoAstecaRepository;

@Service
public class SolicitacaoAstecaService {

    private SolicitacaoAstecaRepository solicitacaoAstecaRepository;

    @Autowired
    public SolicitacaoAstecaService(SolicitacaoAstecaRepository solicitacaoAstecaRepository) {
        this.solicitacaoAstecaRepository = solicitacaoAstecaRepository;
    }

    public ResponseEntity<SolicitacaoAstecaModel> salvarAsteca(SolicitacaoAstecaModel asteca) {
        SolicitacaoAstecaModel solicitacaoSalva = solicitacaoAstecaRepository.save(asteca);
        return new ResponseEntity<>(solicitacaoSalva, HttpStatus.CREATED);
    }

    public List<SolicitacaoAstecaModel> listarTodas() {

        return solicitacaoAstecaRepository.findAll();
    }

}
