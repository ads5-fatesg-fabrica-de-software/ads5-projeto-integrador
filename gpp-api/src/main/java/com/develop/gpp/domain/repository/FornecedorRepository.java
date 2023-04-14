package com.develop.gpp.domain.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.develop.gpp.domain.entity.FornecedorModel;

@Repository
public interface FornecedorRepository extends JpaRepository<FornecedorModel, Integer> {

    Optional<FornecedorModel> findByNomeFornecedor(String nome);

    @Query(nativeQuery = true, value = "select * from fornecedor f where lower(f.nome_fornecedor) like lower(:nome)")
    List<FornecedorModel> listarPorNome(@Param("nome") String nome);

}
