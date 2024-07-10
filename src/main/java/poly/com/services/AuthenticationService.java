package poly.com.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import poly.com.dao.AccountDAO;
import poly.com.entity.Account;

import java.util.Optional;

@Service
public class AuthenticationService {
    @Autowired
    private AccountDAO accountRepository;

    public boolean authenticate(String username, String password) {
        Optional<Account> optionalAccount = accountRepository.findOptionalByUsername(username);
        if (optionalAccount.isPresent()) {
            Account account = optionalAccount.get();
            return account.getPassword().equals(password);
        }
        return false;
    }
}