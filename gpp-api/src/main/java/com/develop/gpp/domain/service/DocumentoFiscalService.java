package com.develop.gpp.domain.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestBody;

import com.develop.gpp.domain.entity.DocumentoFiscalModel;
import com.develop.gpp.domain.repository.DocumentoFiscalRepository;

@Service
public class DocumentoFiscalService {

    @Autowired
    private DocumentoFiscalRepository documentoFiscalRepository;

    public DocumentoFiscalModel salvarDoc(@RequestBody DocumentoFiscalModel doc) {

        return documentoFiscalRepository.save(doc);
    }

}