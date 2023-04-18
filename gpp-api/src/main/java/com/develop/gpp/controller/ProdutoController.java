package com.develop.gpp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.develop.gpp.domain.entity.ProdutoModel;
import com.develop.gpp.domain.service.ProdutoService;

@RestController
@RequestMapping("/produto")
public class ProdutoController {

    @Autowired
    public ProdutoService produtoService;

    @PostMapping("/")
    public ProdutoModel salvarProduto(@RequestBody ProdutoModel prod) {

        return produtoService.salvarProduto(prod);
    }

    @GetMapping("/")
    public List<ProdutoModel> listarTodos() {

        return produtoService.listaProduto();

    }

}
