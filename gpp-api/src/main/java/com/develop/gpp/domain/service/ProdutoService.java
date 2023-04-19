package com.develop.gpp.domain.service;

import java.util.Optional;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.annotation.ReadOnlyProperty;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.server.ResponseStatusException;

import com.develop.gpp.domain.entity.FornecedorModel;
import com.develop.gpp.domain.entity.ProdutoModel;
import com.develop.gpp.domain.repository.FornecedorRepository;
import com.develop.gpp.domain.repository.ProdutoRepository;

@Service
public class ProdutoService {

    @Autowired
    public ProdutoRepository produtoRepository;

    @Autowired
    public FornecedorRepository fornecedorRepository;

    public ProdutoModel salvarProduto(@RequestBody ProdutoModel prod) {

        Optional<FornecedorModel> validacao = fornecedorRepository.findById(prod.getFornecedor().getIdFornecedor());

        Optional<ProdutoModel> validacaoProduto = produtoRepository.findByDescricao(prod.getDescricao());

        if (validacao.isPresent()) {

            if (validacaoProduto.isPresent()) {
                throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Nome de Produto já cadastrado!!");

            } else {
                return produtoRepository.save(prod);

            }

        } else {

            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Fornecedor não encontrado");
        }

    }

    public List<ProdutoModel> listaProduto() {

        return produtoRepository.findAll();

    }
}
