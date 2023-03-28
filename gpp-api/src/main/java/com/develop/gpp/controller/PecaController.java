package com.develop.gpp.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.develop.gpp.domain.entity.PecaModel;
import com.develop.gpp.domain.service.PecaService;

@Controller
@RequestMapping(name = "/pecas")
public class PecaController {

    @Autowired
    private PecaService pecaService;

    @GetMapping("/")
    public List<PecaModel> listaPecas() {

        return pecaService.listaPecas();
    }

    @PostMapping("/")
    @ResponseStatus(code = HttpStatus.CREATED)
    public PecaModel salvarPeca(@RequestBody PecaModel peca) {

        return pecaService.salvarPeca(peca);

    }

    @GetMapping("/{id}")
    @ResponseStatus(code = HttpStatus.OK)
    public ResponseEntity<PecaModel> BuscarPorId(@PathVariable Integer id) {

        return pecaService.BuscarPorId(id);

    }

    @DeleteMapping("/{id}")
    public ResponseEntity<PecaModel> deletePeca(@PathVariable Integer id) {
      return pecaService.deletePeca(id);
    }

}
