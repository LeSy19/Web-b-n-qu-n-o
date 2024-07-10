package poly.com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import poly.com.services.PasswordResetService;

@Controller
public class PasswordResetController {

    @Autowired
    private PasswordResetService passwordResetService;

    @GetMapping("/reset-password-form")
    public String showResetPasswordForm(@RequestParam("email") String email, Model model) {
        model.addAttribute("email", email);
        return "reset-password-form";
    }
    @PostMapping("/reset-password")
    public String handleResetPassword(@RequestParam("email") String email,
                                      @RequestParam("code") String code,
                                      @RequestParam("newPassword") String newPassword,
                                      Model model) {
        if (passwordResetService.resetPassword(email, code, newPassword)) {
            model.addAttribute("message", "Your password has been successfully reset.");
            return "redirect:/login"; // Redirect về trang đăng nhập sau khi đặt lại mật khẩu thành công
        } else {
            model.addAttribute("email", email);
            model.addAttribute("errorMessage", "Failed to reset password. Please try again later.");
            return "reset-password-form"; // Trở lại form đặt lại mật khẩu với thông báo lỗi
        }
    }

}