package com.develop.gpp.controller;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.develop.gpp.domain.entity.ClienteModel;
import com.develop.gpp.domain.entity.DocumentoFiscalModel;
import com.develop.gpp.domain.entity.FilialModel;
import com.develop.gpp.domain.entity.FornecedorModel;
import com.develop.gpp.domain.entity.ItemDocumentoFiscalModel;
import com.develop.gpp.domain.entity.ProdutoModel;
import com.develop.gpp.domain.repository.ClienteRepository;
import com.develop.gpp.domain.repository.DocumentoFiscalRepository;
import com.develop.gpp.domain.repository.FilialRepository;
import com.develop.gpp.domain.repository.FornecedorRepository;
import com.develop.gpp.domain.repository.ItemDocFiscalRepository;
import com.develop.gpp.domain.repository.ProdutoRepository;
import com.develop.gpp.domain.service.DocumentoFiscalService;

@RestController
@RequestMapping("/doc")
public class DocumentoFiscalController {

    @Autowired
    public DocumentoFiscalRepository documentoFiscalRepository;

    @Autowired
    public ProdutoRepository produtoRepository;

    @Autowired
    public FornecedorRepository fornecedorRepository;

    @Autowired
    public ClienteRepository clienteRepository;

    @Autowired
    public FilialRepository filialRepository;

    @Autowired
    public ItemDocFiscalRepository docFiscalRepository;

    @PostConstruct
    public void init() {

        ItemDocumentoFiscalModel item = new ItemDocumentoFiscalModel();
        ItemDocumentoFiscalModel item2 = new ItemDocumentoFiscalModel();
        DocumentoFiscalModel doc = new DocumentoFiscalModel();
        List<ProdutoModel> prod = produtoRepository.findAll();
        List<ClienteModel> cli = clienteRepository.findAll();
        List<FilialModel> fi = filialRepository.findAll();
        Double valor1 = 450.99;
        Integer qtd1 = 2;
        Double valor2 = 15.400;
        Integer qtd2 = 1;

        // itemDoc
        //item.setDocumentoFiscal(doc);
        item.setProduto(prod.get(2));
        item.setQtde(qtd1);
        item.setValorVenda(valor1);
        item.valorTotal(qtd1, valor1);
        // item.setDocumentoFiscal(doc);
        item.setIdItemDocFiscal(doc.getIdDocumentoFiscal());

        // item2
        //item2.setDocumentoFiscal(doc);
        // item2.setIdProduto(prod.get(3).getIdProduto());
        // item2.setQtde(qtd2);
        // item2.setValorVenda(valor2);
        // item2.valorTotal(qtd2, valor2);
        // // item2.setDocumentoFiscal(doc);
        // item2.setIdItemDocFiscal(doc.getIdDocumentoFiscal());

        // lista de itens
        List<ItemDocumentoFiscalModel> listaItens = new ArrayList<>();
        listaItens.add(item);
        //listaItens.add(item2);

        // documento
        doc.setCliente(cli.get(0));
        doc.setCpfCnpj(cli.get(0).getCpfCnpj());
        doc.setDataEmissao(LocalDateTime.now());
        doc.setFornecedor(prod.get(0).getFornecedor().getNomeFornecedor());
        doc.setItens(listaItens);
        doc.setSerieDocFiscal("10");
        doc.setIdFilialSaida(fi.get(0).getIdFilial());
        doc.setDescricao(prod.get(1).getDescricao());

        documentoFiscalRepository.save(doc);
        docFiscalRepository.saveAll(listaItens);

    }

    @Autowired
    private DocumentoFiscalService documentoFiscalService;

    @PostMapping("/")
    public DocumentoFiscalModel salvarDoc(@RequestBody DocumentoFiscalModel doc) {

        return documentoFiscalService.salvarDoc(doc);
    }

    @GetMapping("/{prod}")
    public List<DocumentoFiscalModel> listaPorProduto(@PathVariable Integer prod) {

        List<DocumentoFiscalModel> doc = documentoFiscalService.listaPorProduto(prod);

        return doc;

    }

    @GetMapping("/")
    public List<DocumentoFiscalModel> todas() {

        return documentoFiscalService.todas();

    }

}
