package com.develop.gpp.domain.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.support.JpaRepositoryFactory;
import org.springframework.stereotype.Repository;

import com.develop.gpp.domain.entity.PecaModel;

@Repository
public interface PecaRepository extends JpaRepository<PecaModel,Integer>{
    
}