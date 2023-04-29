package com.develop.gpp.controller;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
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
import com.develop.gpp.domain.entity.FornecedorModel;
import com.develop.gpp.domain.entity.ItemDocumentoFiscalModel;
import com.develop.gpp.domain.entity.ProdutoModel;
import com.develop.gpp.domain.repository.DocumentoFiscalRepository;
import com.develop.gpp.domain.repository.ItemDocFiscalRepository;
import com.develop.gpp.domain.service.DocumentoFiscalService;

@RestController
@RequestMapping("/doc")
public class DocumentoFiscalController {

    // @Autowired
    // public DocumentoFiscalRepository documentoFiscalRepository;

    // @Autowired
    // public ItemDocFiscalRepository docFiscalRepository;

    // @PostConstruct
    // public void init() {

    // ProdutoModel prod = new ProdutoModel();
    // ClienteModel cli = new ClienteModel();
    // ItemDocumentoFiscalModel item = new ItemDocumentoFiscalModel();
    // ItemDocumentoFiscalModel item2 = new ItemDocumentoFiscalModel();
    // DocumentoFiscalModel doc = new DocumentoFiscalModel();
    // FornecedorModel fornc = new FornecedorModel();
    // Double valor = 450.99;
    // Integer qtd = 2;

    // // cliente
    // cli.setCpfCnpj("06523244105");
    // cli.setEmail("asterty15@gmail.com");
    // cli.setNome("Wenderson Reis");

    // // fornecedor
    // fornc.setNomeFornecedor("teste");

    // // produto
    // prod.setFornecedor(fornc);
    // prod.setDescricao("teste");

    // // itemDoc
    // item.setDocumentoFiscal(doc);
    // item.setIdProduto(8);
    // item.setQtde(qtd);
    // item.setValorVenda(valor);
    // item.valorTotal(qtd, valor);
    // item.setDocumentoFiscal(doc);
    // item.setIdItemDocFiscal(doc.getIdDocumentoFiscal());

    // // item2
    // item2.setDocumentoFiscal(doc);
    // item2.setIdProduto(5);
    // item2.setQtde(qtd);
    // item2.setValorVenda(valor);
    // item2.valorTotal(qtd, valor);
    // item2.setDocumentoFiscal(doc);
    // item2.setIdItemDocFiscal(doc.getIdDocumentoFiscal());

    // //lista de itens
    // List<ItemDocumentoFiscalModel> listaItens = new ArrayList<>();
    // listaItens.add(item);
    // listaItens.add(item2);

    // // documento
    // doc.setCliente(cli);
    // doc.setCpfCnpj(cli.getCpfCnpj());
    // doc.setDataEmissao(LocalDateTime.now());
    // doc.setFornecedor(prod.getFornecedor().getNomeFornecedor());
    // doc.setItens(listaItens);
    // doc.setNumDocFiscal(456654);
    // doc.setSerieDocFiscal("10");
    // doc.setIdFilialSaida(456);

    // documentoFiscalRepository.save(doc);
    // docFiscalRepository.saveAll(listaItens);

    // }

    @Autowired
    private DocumentoFiscalService documentoFiscalService;

    @PostMapping("/")
    public DocumentoFiscalModel salvarDoc(@RequestBody DocumentoFiscalModel doc) {

        return documentoFiscalService.salvarDoc(doc);
    }

    @GetMapping("/{prod}")
    public List<DocumentoFiscalModel> listaPorProduto(@PathVariable Integer prod)
    {

    List<DocumentoFiscalModel> doc =
    documentoFiscalService.listaPorProduto(prod);

    return doc;

    }

    @GetMapping("")
    public List<DocumentoFiscalModel> todas() {

        return documentoFiscalService.todas();

    }

}
