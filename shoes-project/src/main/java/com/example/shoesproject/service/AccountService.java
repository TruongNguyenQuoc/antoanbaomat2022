package com.example.shoesproject.service;

import com.example.shoesproject.model.Account;

import java.util.List;

public interface AccountService {

    List<Account> findAll();

    Account findById(long id);

    Account findByIds(long id);

    Account findByUserName(String username);

    Account findByUserName(String username, String password);

    Account update(Account account);

    Account save(Account account);
}
