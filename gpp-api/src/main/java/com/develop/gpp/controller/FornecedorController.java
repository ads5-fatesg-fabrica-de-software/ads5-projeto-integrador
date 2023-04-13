package com.develop.gpp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.develop.gpp.domain.entity.FornecedorModel;
import com.develop.gpp.domain.service.FornecedorService;

@RestController
@RequestMapping("/fornecedor")
public class FornecedorController {

    @Autowired
    private FornecedorService fornecedorService;

    @GetMapping("/")
    public List<FornecedorModel> listarTodos() {

        return fornecedorService.listarTodos();
    }

    @GetMapping("/{nome}")
    public List<FornecedorModel> listarPorNome(@PathVariable String nome) {

        return fornecedorService.listarPorNome(nome);
    }

    @DeleteMapping("/{id}")
    public void deletarFornec(@PathVariable Integer id) {

        fornecedorService.deletarFornec(id);

    }

    @PostMapping("/")
    public FornecedorModel salvarFornec(@RequestBody FornecedorModel fornec) {

        return fornecedorService.salvarFornec(fornec);
    }

}
