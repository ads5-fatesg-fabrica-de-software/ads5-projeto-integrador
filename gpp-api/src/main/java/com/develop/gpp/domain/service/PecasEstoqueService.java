package com.develop.gpp.domain.service;
import com.develop.gpp.domain.entity.PecasEstoqueModel;
import com.develop.gpp.domain.repository.PecasEstoqueRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.Collection;
import java.util.List;

@Service
public class PecasEstoqueService {

    @Autowired
    private PecasEstoqueRepository pecasEstoqueRepository;

    public List<PecasEstoqueModel> listarTodos() {
        return pecasEstoqueRepository.findAll();
    }




}
