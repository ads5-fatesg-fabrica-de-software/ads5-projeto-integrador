package com.develop.gpp.domain.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.develop.gpp.domain.entity.DocumentoFiscalModel;

@Repository
public interface DocumentoFiscalRepository extends JpaRepository<DocumentoFiscalModel,Integer>{
    
}