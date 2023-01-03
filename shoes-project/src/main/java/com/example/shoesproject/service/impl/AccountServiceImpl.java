package com.example.shoesproject.service.impl;

import com.example.shoesproject.dao.AccountDAO;
import com.example.shoesproject.dao.impl.AccountDAOImpl;
import com.example.shoesproject.model.Account;
import com.example.shoesproject.service.AccountService;

import java.util.List;

public class AccountServiceImpl implements AccountService {

    private AccountDAO accountDAO = new AccountDAOImpl();

    @Override
    public List<Account> findAll() {
        return accountDAO.findAll();
    }

    @Override
    public Account findById(long id) {
        return accountDAO.findById(id);
    }

    @Override
    public Account findByIds(long id) {
        return accountDAO.findByIds(id);
    }

    @Override
    public Account findByUserName(String username) {
        return accountDAO.findByUserName(username);
    }

    @Override
    public Account findByUserName(String username, String password) {
        return accountDAO.findByUserName(username, password);
    }

    @Override
    public Account update(Account account) {
        return accountDAO.update(account);
    }

    @Override
    public Account save(Account account) {
        return accountDAO.save(account);
    }
}
