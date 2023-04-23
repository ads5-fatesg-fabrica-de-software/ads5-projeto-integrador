package com.develop.gpp.controller;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.develop.gpp.domain.entity.ClienteModel;
import com.develop.gpp.domain.entity.DocumentoFiscalModel;
import com.develop.gpp.domain.entity.ItemDocumentoFiscalModel;
import com.develop.gpp.domain.entity.ProdutoModel;
import com.develop.gpp.domain.service.DocumentoFiscalService;

@RestController
@RequestMapping("/doc")
public class DocumentoFiscalController {

    @PostConstruct
    public void init() {

        ProdutoModel prod = new ProdutoModel();
        ClienteModel cli = new ClienteModel();
        ItemDocumentoFiscalModel item = new ItemDocumentoFiscalModel();
        DocumentoFiscalModel doc = new DocumentoFiscalModel();
        // cli
        cli.setCpfCnpj("06523244105");
        cli.setEmail("asterty15@gmail.com");
        cli.setNome("Wenderson Reis");

        

    }

    @Autowired
    private DocumentoFiscalService documentoFiscalService;

    // @PostMapping("/")
    // public DocumentoFiscalModel salvarDoc(@RequestBody DocumentoFiscalModel doc)
    // {

    // return documentoFiscalService.salvarDoc(doc);
    // }

}
