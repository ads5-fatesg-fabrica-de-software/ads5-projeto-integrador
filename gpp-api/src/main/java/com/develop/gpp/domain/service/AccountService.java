package com.develop.gpp.domain.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;

import com.develop.gpp.domain.entity.Account;
import com.develop.gpp.domain.entity.PerfilUsuarioModel;
import com.develop.gpp.domain.entity.dto.LoginDTO;
import com.develop.gpp.domain.repository.AccountRepository;
import com.develop.gpp.domain.repository.PerfilRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AccountService {

    @Autowired
    private AccountRepository repository;

    @Autowired
    private PerfilRepository perfilRepository;

    public Account register(Account account) {
        existsByUsername(account.getUsername());
        return repository.save(account);
    }

    public Account getByLogin(LoginDTO dto) {
        Optional<Account> acc = repository.findByUsernameAndPassword(dto.getUsername(), dto.getPassword());

        if (acc.isEmpty()) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Invalid username or password");
        } else if (acc.get().getPerfilUsuario() == null) {

            throw new ResponseStatusException(HttpStatus.UNAUTHORIZED,
                    "Usuário sem perfil vinculado! Solicite acesso ao Administrador do sistema!");
        }

        return acc.get();
    }

    public Account getUser(LoginDTO dto) {
        Optional<Account> user = repository.findByUsernameAndPassword(dto.getUsername(), dto.getPassword());

        if (user.isEmpty()) {

            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Usuário não encontrado!");

        }
        return user.get();
    }

    public Account vincularPerfil(LoginDTO dto, Long id) {

        Optional<Account> user = repository.findByUsernameAndPassword(dto.getUsername(), dto.getPassword());

        Optional<PerfilUsuarioModel> perfil = perfilRepository.findById(id);

        try {

            if (user.isPresent()) {

                // if (user.get().getPerfilUsuario().getIdPerfilUsuario() ==
                // perfil.get().getIdPerfilUsuario()) {

                // throw new ResponseStatusException(HttpStatus.BAD_REQUEST,
                // "O perfil informado ja encontrasse vinculado ao usuário!");

                // }

                if (perfil == null) {

                    throw new ResponseStatusException(HttpStatus.BAD_REQUEST,
                            "Perfil deve ser escolhido para fazer o vinculo!");

                }
                user.get().setPerfilUsuario(perfil.get());

            }

            return repository.save(user.get());
        } catch (Exception e) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Erro ao vincular Perfil! " + e.getMessage());
        }

    }

    private void existsByUsername(String username) {
        if (repository.findByUsername(username).isPresent()) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Username already registered!");
        }
    }
}
