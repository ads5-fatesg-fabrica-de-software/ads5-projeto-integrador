package com.develop.gpp.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PathVariable;

import com.develop.gpp.domain.entity.PecaModel;
import com.develop.gpp.domain.repository.PecaRepository;


@Service
public class PecaService {

@Autowired
private PecaRepository pecaRepository;





// public ResponseEntity<PecaModel> BuscarPeca(@PathVariable Integer id) {

//     PecaModel peca = pecaRepository.findById(id);

//     return ResponseEntity.ok(peca.get);
   
// }






}
