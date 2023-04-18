package com.develop.gpp.domain.service;

import java.util.Optional;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.annotation.ReadOnlyProperty;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.server.ResponseStatusException;

import com.develop.gpp.domain.entity.ProdutoModel;
import com.develop.gpp.domain.repository.ProdutoRepository;

@Service
public class ProdutoService {

    @Autowired
    public ProdutoRepository produtoRepository;

    public ProdutoModel salvarProduto(@RequestBody ProdutoModel prod) {

        Optional<ProdutoModel> validacao = produtoRepository.findByFornecedor(prod.getFornecedor());

        if (validacao.isEmpty()) {

            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Fornecedor é obrigatório!");

        } else {

            return produtoRepository.save(prod);

        }

    }

    public List<ProdutoModel> listaProduto() {

        return produtoRepository.findAll();

    }
}
