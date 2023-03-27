package com.develop.gpp.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.develop.gpp.domain.entity.PecaModel;

@Controller
@RequestMapping(name = "/pecas")
public class PecaController {
    
    @Autowired
    private  PecaService pecaService ;

    // @GetMapping("/{id}")
    // public ResponseEntity<PecaModel> getPeca(@PathVariable Integer id) {
    //     Optional <PecaModel> optionalPeca = pecaService.findById(id);
    //     if (optionalPeca.isPresent()) {
    //         return ResponseEntity.ok(optionalPeca.get());
    //     } else {
    //         return ResponseEntity.notFound().build();
    //     }
       
    // }

}
