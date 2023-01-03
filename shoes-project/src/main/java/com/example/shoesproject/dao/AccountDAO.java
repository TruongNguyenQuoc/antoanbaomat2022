package com.example.shoesproject.dao;

import com.example.shoesproject.model.Account;

import java.util.List;

public interface AccountDAO {

    List<Account> findAll();

    Account findById(long id);

    Account findByIds(long id);

    Account findByUserName(String userName);

    Account findByUserName(String userName, String password);

    Account update(Account account);

    Account save(Account account);

}
