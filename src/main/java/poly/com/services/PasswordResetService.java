package poly.com.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import poly.com.dao.AccountDAO;
import poly.com.entity.Account;

import java.util.Optional;
import java.util.UUID;

@Service
public class PasswordResetService {

    @Autowired
    private JavaMailSender javaMailSender;

    @Autowired
    private AccountDAO accountRepository;

    public void sendResetPasswordCode(String email) {
        // Generate a random verification code
        String resetCode = UUID.randomUUID().toString().substring(0, 6); // For example, take the first 6 characters

        // Save the reset code to the database
        Optional<Account> accountOptional = accountRepository.findByEmail(email);
        if (accountOptional.isPresent()) {
            Account account = accountOptional.get();
            account.setResetToken(resetCode);
            accountRepository.save(account);
            // Send email containing the verification code
            sendEmail(email, resetCode);
        } else {
            // Handle case when email is not found
            // For example, you can log an error or notify the user
        }
    }

    public boolean verifyResetPasswordCode(String email, String code) {
        Optional<Account> accountOptional = accountRepository.findByEmail(email);
        if (accountOptional.isPresent()) {
            Account account = accountOptional.get();
            String savedCode = account.getResetToken();
            return savedCode != null && savedCode.equals(code);
        }
        return false;
    }

    public void removeResetCode(String email) {
        Optional<Account> accountOptional = accountRepository.findByEmail(email);
        if (accountOptional.isPresent()) {
            Account account = accountOptional.get();
            account.setResetToken(null);
            accountRepository.save(account);
        }
    }

    private void sendEmail(String email, String code) {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(email);
        message.setSubject("Password Reset Verification Code");
        message.setText("Your verification code to reset the password is: " + code);
        javaMailSender.send(message);
    }

    public boolean resetPassword(String email, String code, String newPassword) {
        // Verify the reset password code first
        if (verifyResetPasswordCode(email, code)) {
            // Find the account by email
            Optional<Account> accountOptional = accountRepository.findByEmail(email);
            if (accountOptional.isPresent()) {
                // Update the password
                Account account = accountOptional.get();
                account.setPassword(newPassword);
                accountRepository.save(account);
             // Remove the reset code after successfully resetting the password
                removeResetCode(email);
                
                return true;
            }
        }
        return false;
    }
}