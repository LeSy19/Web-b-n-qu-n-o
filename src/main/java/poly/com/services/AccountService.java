package poly.com.services;

import java.util.Optional;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import poly.com.dao.AccountDAO;
import poly.com.entity.Account;

@Service
@Transactional
public class AccountService {

    @Autowired
    private AccountDAO accountRepository;

    @Autowired
    private JavaMailSender mailSender;
    
    public Optional<Account> findByEmail(String email) {
        return accountRepository.findByEmail(email);
    }

    public Account save(Account account) {
        return accountRepository.save(account);
    }

    public void sendResetToken(String email) {
        Optional<Account> optionalAccount = accountRepository.findByEmail(email);
        if (optionalAccount.isPresent()) {
            Account account = optionalAccount.get();
            String token = UUID.randomUUID().toString();
            account.setResetToken(token);
            accountRepository.save(account);

            SimpleMailMessage message = new SimpleMailMessage();
            message.setTo(email);
            message.setSubject("Password Reset Request");
            message.setText("To reset your password, use this token: " + token);
            mailSender.send(message);
        }
    }


	public boolean resetPassword(String token, String newPassword) {
        Account account = accountRepository.findByResetToken(token);
        if (account != null) {
            account.setPassword(newPassword);
            account.setResetToken(null);
            accountRepository.save(account);
            return true;
        }
        return false;
    }
}