package poly.com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpServletRequest;
import poly.com.dao.AccountDAO;
import poly.com.entity.Account;
import poly.com.services.SessionService;





@Controller
public class AccountInterceptorController {
	@Autowired
	AccountDAO dao;
	@Autowired
	SessionService session;
	@Autowired
    HttpServletRequest request; 

	@GetMapping("/account/login")
	public String login() {
		return "account/login";
	};
//	}

	@PostMapping("/account/index") // la vao trang them, xoa, sua
	public String loginIndex1() {
		return "admin/editProduct";
	}
	@GetMapping("/account/logout")
	public String accountLogout() {
		Account accountLogin = (Account)session.get("user");
		if(accountLogin != null)
			session.set("user", null);
		return "/account/login";
	}
	
	 @PostMapping("/account/login")
	    public String login(Model model, @RequestParam("username") String username,
	                        @RequestParam("password") String password) {
	        Account user = dao.findByUsername(username);
	        if (user == null || !user.getPassword().equals(password)) {
	            model.addAttribute("message", "Invalid username or password!");
	            return "account/login";
	        } else {
	            session.set("user", user);
	            String userRole = user.isRole() ? "ADMIN" : "CUSTOMER";
	            request.getSession().setAttribute("role", userRole);
	            System.out.println("User role: " + userRole);
	            request.getSession().setAttribute("isLoggedIn", true);

	            // Chuyển hướng người dùng đến trang index sau khi đăng nhập thành công
	            return "redirect:/";
	            }
	        }
	    }
