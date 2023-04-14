package com.develop.gpp.domain.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.annotation.ReadOnlyProperty;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestBody;

import com.develop.gpp.domain.entity.ProdutoModel;
import com.develop.gpp.domain.repository.ProdutoRepository;

@Service
public class ProdutoService {

    @Autowired
    public ProdutoRepository produtoRepository;

    public ProdutoModel salvarProduto(@RequestBody ProdutoModel prod) {

        return produtoRepository.save(prod);
    }

}
