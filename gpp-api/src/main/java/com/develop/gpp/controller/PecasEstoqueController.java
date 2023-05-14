package com.develop.gpp.controller;

import com.develop.gpp.domain.entity.PecaModel;
import com.develop.gpp.domain.entity.PecasEstoqueModel;
import com.develop.gpp.domain.entity.dto.PecaDTO;
import com.develop.gpp.domain.service.PecaService;
import com.develop.gpp.domain.service.PecasEstoqueService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/pecasestoque")
public class PecasEstoqueController {

    @Autowired
    private PecasEstoqueService pecasEstoqueService;

    @GetMapping("/")
    public List<PecasEstoqueModel> listaPecasEstoque() {
        return pecasEstoqueService.listarTodos();
    }


}
