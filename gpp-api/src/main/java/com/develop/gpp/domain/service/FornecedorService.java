package com.develop.gpp.domain.service;

import java.util.List;
import java.util.Optional;

import javax.websocket.server.PathParam;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.server.ResponseStatusException;

import com.develop.gpp.domain.entity.FornecedorModel;
import com.develop.gpp.domain.repository.FornecedorRepository;

@Service
public class FornecedorService {

    @Autowired
    private FornecedorRepository fornecedorRepository;

    public FornecedorModel salvarFornec(@RequestBody FornecedorModel fornec) {

        Optional<FornecedorModel> validacao = fornecedorRepository.findByNomeFornecedor(fornec.getNomeFornecedor());

        if (validacao.isPresent()) {

            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Fornecedor Já cadastrado!");

        } else {

            return fornecedorRepository.save(fornec);

        }
    }

    public List<FornecedorModel> listarPorNome(@PathVariable String nome) {

        return fornecedorRepository.listarPorNome(nome);
    }

    public List<FornecedorModel> listarTodos() {

        return fornecedorRepository.findAll();
    }

    public void deletarFornec(@PathVariable Integer id) {

        fornecedorRepository.deleteById(id);

    }

}
