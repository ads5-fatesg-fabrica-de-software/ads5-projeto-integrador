package com.develop.gpp.controller;

import com.develop.gpp.domain.entity.PecaModel;
import com.develop.gpp.domain.entity.dto.PecaDTO;
import com.develop.gpp.domain.service.PecaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/pecas")
public class PecaController {

    private final PecaService pecaService;

    @Autowired
    public PecaController(PecaService pecaService) {
        this.pecaService = pecaService;
    }

    @GetMapping("/")
    public List<PecaDTO> listaPecas() {
        return pecaService.listaPecas();
    }

    @PostMapping("/")
    @ResponseStatus(HttpStatus.CREATED)
    public PecaModel salvarPeca(@RequestBody PecaModel peca) {
        return pecaService.salvarPeca(peca);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<PecaModel> deletePeca(@PathVariable Integer id) {
        return pecaService.deletePeca(id);
    }

    @GetMapping("/{prod}")
    public List<PecaDTO> buscarPorProduto(@PathVariable Integer prod) {
        return pecaService.buscarPorProduto(prod);
    }
}