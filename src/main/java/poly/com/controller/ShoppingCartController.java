package poly.com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import poly.com.entity.Account;
import poly.com.services.SessionService;
import poly.com.services.ShoppingCartService;

@Controller
public class ShoppingCartController {

    @Autowired
    ShoppingCartService cart; // Tiêm Spring Bean đã tạo

    @Autowired
    SessionService session;

    @RequestMapping("/cart/view")
    public String view(Model model) {
        model.addAttribute("cart", cart);
        model.addAttribute("Count", cart.getCount());
        model.addAttribute("Amount", cart.getAmount());
        return "cart";
    }

    @RequestMapping("/cart/addToCart")
    public String add(@RequestParam("id") Integer id) {
        // Kiểm tra người dùng đã đăng nhập chưa
        Account user = (Account) session.get("user");
        if (user != null) {
            cart.add(id);
            return "redirect:/cart/view"; // Hiển thị giỏ hàng
        } else {
            return "redirect:/account/login";
        }
    }

    @RequestMapping("/cart/remove/{id}")
    public String remove(@PathVariable("id") Integer id) {
        cart.remove(id);
        return "redirect:/cart/view";
    }

    @RequestMapping("/cart/update/{id}/{pre}")
    public String update(@PathVariable("id") Integer id, @PathVariable("pre") String pre) {
        cart.update(id, pre);
        return "redirect:/cart/view";
    }

    @RequestMapping("/cart/clear")
    public String clear() {
        cart.clear();
        return "redirect:/cart/view";
    }

    @PostMapping("/checkout")
    public String checkout(Model model) {
        Account userLogin = (Account) session.get("user");
        System.out.println("User login: " + (userLogin != null));
        if (userLogin != null) {
            boolean result = cart.checkout(userLogin);
            System.out.println("Checkout result: " + result);
            if (result) {
            	
                cart.clear();
                return "redirect:/cart/view";
            } else {
                model.addAttribute("error", "Checkout failed. Please try again.");
                return "cart";
            }
        } else {
            return "redirect:/account/login";
        }
    }
}
