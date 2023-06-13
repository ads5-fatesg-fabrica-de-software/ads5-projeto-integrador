package com.develop.gpp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.develop.gpp.domain.entity.Account;
import com.develop.gpp.domain.service.AccountService;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
public class AccountController {
    
	private final AccountService service = new AccountService();

    @PostMapping("register")
    public Account register(@RequestBody Account account) {
        return service.register(account);
    }
}
