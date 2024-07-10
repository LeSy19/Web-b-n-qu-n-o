package poly.com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {

	@RequestMapping("/login")
	public String login() {
		return "account/login";
	}
	
	@RequestMapping("/signup")
	public String signup() {
		return "acccount/signup";
	}
	
//	@RequestMapping("/order")
//	public String order() {
//		return "gioHangForm";
//	}
	@RequestMapping("/orderDetail")
	public String orderDetail() {
		return "HDChiTietForm";
	}
	
//	@RequestMapping("/index")
//	public String index() {
//		return "index";
//	}
//	
	@RequestMapping("/forgotpassword")
	public String form() {
		return "forgot-password";
	}
//	@RequestMapping("/product-details")
//	public String productDetail() {
//		return "product-details";
//	}
	@RequestMapping("/reset-password")
	public String resetPassword() {
		return "reset-password";
	}
	
	
}
