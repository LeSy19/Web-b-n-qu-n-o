package poly.com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import poly.com.entity.Account;
import poly.com.services.AccountService;
import poly.com.services.PasswordResetService;

@Controller
public class ForgotPasswordController {

    @Autowired
    private PasswordResetService passwordResetService;

    @Autowired
    private AccountService accountService;

    @GetMapping("/forgot-password")
    public String showForgotPasswordForm() {
        return "forgot-password";
    }

    @PostMapping("/forgot-password")
    public String handleForgotPassword(@RequestParam("email") String email, Model model) {
        // Gửi mã xác nhận đặt lại mật khẩu
        passwordResetService.sendResetPasswordCode(email);
        // Hiển thị thông báo cho người dùng
        model.addAttribute("message", "A verification code has been sent to " + email);
        return "reset-password-form";
    }
}