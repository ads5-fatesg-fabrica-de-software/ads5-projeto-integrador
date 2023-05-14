package com.develop.gpp.domain.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;

import com.develop.gpp.domain.entity.PecaModel;
import com.develop.gpp.domain.entity.dto.PecaDTO;
import com.develop.gpp.domain.repository.PecaRepository;

@Service
public class PecaService {

    @Autowired
    private PecaRepository pecaRepository;

    public List<PecaDTO> listaPecas() {
        PecaDTO peca = new PecaDTO();
        List<PecaDTO> dto = new ArrayList<>();
        List<PecaModel> lista = pecaRepository.findAll();

        for (int i = 0; i < lista.size(); i++) {

            peca.setCor(lista.get(i).getCor());
            peca.setDescricao(lista.get(i).getDescricao());
            peca.setMaterial(lista.get(i).getMaterial());

            dto.add(peca);

        }

        return dto;
    }

    public PecaModel salvarPeca(@RequestBody PecaModel peca) {

        return pecaRepository.save(peca);

    }

    public ResponseEntity<PecaModel> BuscarPorId(@PathVariable Integer id) {

        Optional<PecaModel> optionalPeca = pecaRepository.findById(id);

        if (optionalPeca.isPresent()) {
            return ResponseEntity.ok(optionalPeca.get());
        } else {
            return ResponseEntity.notFound().build();
        }

    }

    public ResponseEntity<PecaModel> deletePeca(@PathVariable Integer id) {
        Optional<PecaModel> optionalPeca = pecaRepository.findById(id);
        if (optionalPeca.isPresent()) {
            pecaRepository.delete(optionalPeca.get());
            return ResponseEntity.ok().build();
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    public List<PecaDTO> buscarPorProduto(@PathVariable Integer prod) {

        PecaDTO peca = new PecaDTO();
        List<PecaDTO> dto = new ArrayList<>();
        List<PecaModel> lista = pecaRepository.buscarPorProduto(prod);
        


        for (int i = 0; i < lista.size(); i++) {

            peca.setCor(lista.get(i).getCor());
            peca.setDescricao(lista.get(i).getDescricao());
            peca.setMaterial(lista.get(i).getMaterial());

            dto.add(peca);

        }

        return dto;
    }

}
