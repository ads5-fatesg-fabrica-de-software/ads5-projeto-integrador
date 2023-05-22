package com.develop.gpp.controller;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.develop.gpp.domain.entity.AstecaMotivoModel;
import com.develop.gpp.domain.entity.DocumentoFiscalModel;
import com.develop.gpp.domain.entity.ItemSolicitacaoAstecaModel;
import com.develop.gpp.domain.entity.PecasEstoqueModel;
import com.develop.gpp.domain.entity.SolicitacaoAstecaModel;
import com.develop.gpp.domain.enumeradores.SituacaoAstecaEnum;
import com.develop.gpp.domain.enumeradores.TipoAstecaEnum;
import com.develop.gpp.domain.repository.AstecaMotivoRepository;
import com.develop.gpp.domain.repository.DocumentoFiscalRepository;
import com.develop.gpp.domain.repository.ItemAstecaRepository;
import com.develop.gpp.domain.repository.PecasEstoqueRepository;
import com.develop.gpp.domain.repository.ProdutoRepository;
import com.develop.gpp.domain.repository.SolicitacaoAstecaRepository;
import com.develop.gpp.domain.service.AstecaMotivoService;
import com.develop.gpp.domain.service.PecasEstoqueService;
import com.develop.gpp.domain.service.SolicitacaoAstecaService;

@RestController
@RequestMapping("/asteca")
public class SolicitacaoAstecaController {

    @Autowired
    private SolicitacaoAstecaService solicitacaoAstecaService;

    @Autowired
    private ItemAstecaRepository itemAstecaRepository;

    @Autowired
    private PecasEstoqueRepository pecasEstoqueRepository;

    @Autowired
    private DocumentoFiscalRepository documentoFiscalRepository;

    @Autowired
    private AstecaMotivoRepository astecaMotivoRepository;

    @PostConstruct
    public void init() {

            ItemSolicitacaoAstecaModel item = new ItemSolicitacaoAstecaModel();
            ItemSolicitacaoAstecaModel item2 = new ItemSolicitacaoAstecaModel();
            SolicitacaoAstecaModel  asteca = new SolicitacaoAstecaModel();
            List<DocumentoFiscalModel> documento = documentoFiscalRepository.findAll();
            List<PecasEstoqueModel> pecasEstoque = pecasEstoqueRepository.findAll();
            List<AstecaMotivoModel> motivo = astecaMotivoRepository.findAll();
            SituacaoAstecaEnum situacao = null;
            TipoAstecaEnum tipo = null;


            item.setPecaEstoque(pecasEstoque.get(0));
            item.setQuantidade(2);

            item2.setPecaEstoque(pecasEstoque.get(0));
            item2.setQuantidade(3);

            List<ItemSolicitacaoAstecaModel> listaItens = new ArrayList<>();

            listaItens.add(item);
            listaItens.add(item2);

            itemAstecaRepository.saveAll(listaItens);

            asteca.setDataCriacao(LocalDateTime.now());
            asteca.setDocumentoFiscal(documento.get(8));
            asteca.setDescricaoProduto(documento.get(8).getDescricao());
            asteca.setIdProduto(3);
            asteca.setItensAsteca(listaItens);
            asteca.setMotivoCriacaoAsteca(motivo.get(0));
            asteca.setObservacao("Primeiro Teste");
            asteca.setSituacaoAsteca(situacao.EMABERTO);
            asteca.setTipoAsteca(tipo.VISTORIA);

           
            solicitacaoAstecaService.salvarAsteca(asteca);
            

    }

    @GetMapping("/")
    public List<SolicitacaoAstecaModel> listarTodas(){

        return solicitacaoAstecaService.listarTodas();
    }

}
