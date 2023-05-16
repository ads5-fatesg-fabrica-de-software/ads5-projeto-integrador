package com.develop.gpp.domain.repository;

import com.develop.gpp.domain.entity.PecaModel;
import com.develop.gpp.domain.entity.PecasEstoqueModel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PecasEstoqueRepository extends JpaRepository<PecasEstoqueModel, Integer> {
    List<PecasEstoqueModel> findByPeca_IdPeca(Integer idPeca);
}

