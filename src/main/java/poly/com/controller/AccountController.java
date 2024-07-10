package poly.com.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jakarta.validation.Valid;
import poly.com.dao.AccountDAO;
import poly.com.dao.OrderDAO;
import poly.com.dao.ProductDAO;
import poly.com.entity.Account;
import poly.com.services.SessionService;

@Controller
public class AccountController {

	@Autowired
	private AccountDAO accountDAO;
	@Autowired
	SessionService session;

	@Autowired
	private OrderDAO orderDAO;

//	@GetMapping("/account/login")
//    public String login() {
//        return "account/login";
//    }
//	@PostMapping("/admin/themxoasua") // la vao trang them, xoa, sua
//	public String loginIndex1() {
//		return "admin/index";
//	}
	@RequestMapping("/account/index")
	public String form(Model model) {
		List<Account> accounts = accountDAO.findAll();
		Account item = new Account();
		model.addAttribute("item", item);
		model.addAttribute("items", accounts);
		return "admin/account";
	}

	@RequestMapping(value = "/account/create", method = RequestMethod.POST)
	public String create(@Valid @ModelAttribute("item") Account account, BindingResult result, Model model) {
		if (result.hasErrors()) {
			model.addAttribute("items", accountDAO.findAll());
			return "admin/account";
		} else {
			accountDAO.save(account);
		}
		return "redirect:/account/index";
	}

	@RequestMapping(value = "/account/update", method = RequestMethod.POST)
	public String update(@Valid @ModelAttribute("item") Account account, BindingResult result, Model model) {
		if (result.hasErrors()) {
			model.addAttribute("items", accountDAO.findAll());
			return "admin/account";
		} else {
			accountDAO.save(account);
			return "redirect:/account/edit/" + account.getUsername();
		}
	}

	@RequestMapping("/account/edit/{username}")
	public String edit(Model model, @PathVariable("username") String username) {
		Account item = accountDAO.findById(username).orElse(null);
		model.addAttribute("item", item);
		model.addAttribute("items", accountDAO.findAll());
		return "admin/account";
	}

	 @RequestMapping("/account/delete/{username}")
	    public String delete(Model model, @PathVariable("username") String username, RedirectAttributes redirectAttributes) {
	        if (orderDAO.existsByAccount_Username(username)) {
	        	redirectAttributes.addFlashAttribute("errorMessage", "Tài khoản không thể xóa vì có ràng buộc với đơn hàng.");
	        return "redirect:/account/index";
	        } else {
	            accountDAO.deleteById(username);
	            return "redirect:/account/index";
	        }
	    }
}
