package com.develop.gpp.controller;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.develop.gpp.domain.entity.AstecaMotivoModel;
import com.develop.gpp.domain.entity.DocumentoFiscalModel;
import com.develop.gpp.domain.entity.ItemSolicitacaoAstecaModel;
import com.develop.gpp.domain.entity.PecasEstoqueModel;
import com.develop.gpp.domain.entity.SolicitacaoAstecaModel;
import com.develop.gpp.domain.enumeradores.SituacaoAstecaEnum;
import com.develop.gpp.domain.enumeradores.TipoAstecaEnum;
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
    private SolicitacaoAstecaRepository solicitacaoAstecaRepository;

    @Autowired
    private ItemAstecaRepository itemAstecaRepository;

    @Autowired
    private PecasEstoqueService pecasEstoqueService;

    @Autowired
    private DocumentoFiscalRepository documentoFiscalRepository;

    @Autowired
    private AstecaMotivoService astecaMotivoService;

    @PostConstruct
    public void init() {

      

            // populando valores nos itens
            Random random = new Random();

            Integer qtd1 = random.nextInt(8) + 1;

            Integer qtd2 = random.nextInt(8) + 1;

            ItemSolicitacaoAstecaModel item = new ItemSolicitacaoAstecaModel();
            ItemSolicitacaoAstecaModel item2 = new ItemSolicitacaoAstecaModel();
            SolicitacaoAstecaModel  asteca = new SolicitacaoAstecaModel();
            List<DocumentoFiscalModel> documento = documentoFiscalRepository.listarPorProduto(3);
            List<PecasEstoqueModel> pecasEstoque = pecasEstoqueService.listarTodos();
            List<AstecaMotivoModel> motivo = astecaMotivoService.listaAstecaMotivo();
            SituacaoAstecaEnum situacao = null;
            TipoAstecaEnum tipo = null;


            item.setPecaEstoque(pecasEstoque.get(0));
            item.setQuantidade(qtd1);

            item2.setPecaEstoque(pecasEstoque.get(0));
            item2.setQuantidade(qtd2);

            List<ItemSolicitacaoAstecaModel> listaItens = new ArrayList<>();

            listaItens.add(item);
            listaItens.add(item2);

            asteca.setDataCriacao(LocalDateTime.now());
            //asteca.setDocumentoFiscal(documento.get(0));
            asteca.setDescricaoProduto(documento.get(2).getDescricao());
            asteca.setIdProduto(3);
            //asteca.setItensAsteca(listaItens);
            //asteca.setMotivoCriacaoAsteca(motivo.get(2));
            asteca.setObservacao("Primeiro Teste");
            asteca.setSituacaoAsteca(situacao.EMABERTO);
            asteca.setTipoAsteca(tipo.REPARO);

            itemAstecaRepository.saveAll(listaItens);
            solicitacaoAstecaRepository.save(asteca);
            

    }

}
