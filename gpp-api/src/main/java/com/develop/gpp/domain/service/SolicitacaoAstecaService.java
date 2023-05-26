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
import org.springframework.web.client.HttpClientErrorException;

import com.develop.gpp.domain.entity.PecasEstoqueModel;
import com.develop.gpp.domain.entity.SolicitacaoAstecaModel;
import com.develop.gpp.domain.enumeradores.SituacaoAstecaEnum;
import com.develop.gpp.domain.enumeradores.TipoAstecaEnum;
import com.develop.gpp.domain.repository.PecasEstoqueRepository;
import com.develop.gpp.domain.repository.SolicitacaoAstecaRepository;

@Service
public class SolicitacaoAstecaService {

    @Autowired
    private SolicitacaoAstecaRepository solicitacaoAstecaRepository;

    @Autowired
    private PecasEstoqueRepository pecasEstoqueRepository;

    @Autowired
    private PecasEstoqueService pecasEstoqueService;

    // public SolicitacaoAstecaService(SolicitacaoAstecaRepository
    // solicitacaoAstecaRepository) {
    // this.solicitacaoAstecaRepository = solicitacaoAstecaRepository;
    // }

    public ResponseEntity<SolicitacaoAstecaModel> salvarAsteca(@RequestBody SolicitacaoAstecaModel asteca) {

        if (asteca.getTipoAsteca().toString() == null) {

            throw new HttpClientErrorException(HttpStatus.BAD_REQUEST, "Tipo da Asteca deve ser informado");

        } else {

            if (asteca.getTipoAsteca().ordinal() == 0
                    || asteca.getTipoAsteca().toString().equalsIgnoreCase("VISTORIA")) {

                asteca.setTipoAsteca(TipoAstecaEnum.VISTORIA);

            } else if (asteca.getTipoAsteca().ordinal() == 1
                    || asteca.getTipoAsteca().toString().equalsIgnoreCase("reparo")) {

                asteca.setTipoAsteca(TipoAstecaEnum.REPARO);
            }

            asteca.setSituacaoAsteca(SituacaoAstecaEnum.EMABERTO);

        }

        for (int i = 0; i < asteca.getItensAsteca().size(); i++) {

            PecasEstoqueModel estoque = asteca.getItensAsteca().get(i).getPecaEstoque();

            pecasEstoqueService.editarPeca(estoque, asteca.getItensAsteca().get(i).getQuantidade());

        }

        SolicitacaoAstecaModel solicitacaoSalva = solicitacaoAstecaRepository.save(asteca);

        return new ResponseEntity<>(solicitacaoSalva, HttpStatus.CREATED);
    }

    public ResponseEntity<SolicitacaoAstecaModel> executarSolicitacao(@RequestBody SolicitacaoAstecaModel asteca) {

        asteca.setSituacaoAsteca(SituacaoAstecaEnum.EMEXECUCAO);

        SolicitacaoAstecaModel solicitacaoSalva = solicitacaoAstecaRepository.save(asteca);
        return new ResponseEntity<>(solicitacaoSalva, HttpStatus.OK);

    }

    public List<SolicitacaoAstecaModel> listarTodas() {
        return solicitacaoAstecaRepository.findAll();
    }

}
