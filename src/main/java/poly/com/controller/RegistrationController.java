//package poly.com.controller;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.ModelAttribute;
//import org.springframework.web.bind.annotation.PostMapping;
//import poly.com.dao.AccountDAO;
//import poly.com.entity.Account;
//
//@Controller
//public class RegistrationController {
//
//    @Autowired
//    private AccountDAO accountDAO;
//
//    @GetMapping("/register")
//    public String showRegistrationForm(Model model) {
//        model.addAttribute("account", new Account());
//        return "account/signup";
//    }
//
//    @PostMapping("/register")
//    public String registerAccount(@ModelAttribute("account") Account account, Model model) {
//        // Kiểm tra username đã tồn tại chưa
//        if (accountDAO.existsById(account.getUsername())) {
//            // Xử lý trường hợp username đã tồn tại
//            model.addAttribute("error", "Tên người dùng đã tồn tại.");
//            return "account/signup"; // Trả về trang đăng ký với thông báo lỗi
//        }
//
//        // Lưu tài khoản vào cơ sở dữ liệu
//        accountDAO.save(account);
//
//        // Chuyển hướng đến trang đăng nhập hoặc trang chính của ứng dụng
//        return "redirect:/login";
//    }
//}