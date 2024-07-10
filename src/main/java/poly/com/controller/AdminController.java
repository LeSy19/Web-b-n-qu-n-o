//package poly.com.controller;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.servlet.ModelAndView;
//import org.springframework.web.servlet.mvc.support.RedirectAttributes;
//
//import jakarta.servlet.http.HttpSession;
//import poly.com.entity.Account;
//import poly.com.services.AccountService;
//
//@Controller
//public class AdminController {
//	@Autowired
//    private AccountService accountService;
//	
//	@RequestMapping("admin/index")
//	public String admin(HttpSession session, RedirectAttributes redirectAttributes) {
//		Account loggedUser = (Account) session.getAttribute("loggedUser");
//		 if (loggedUser != null && loggedUser.isRole()) {
//	            // Nếu người dùng là admin, hiển thị trang tạo sản phẩm
//	            return "admin/index";
//	        } else {
//	            // Nếu không phải admin, điều hướng về trang chủ và hiển thị thông báo lỗi
//	            redirectAttributes.addFlashAttribute("error", "Bạn không có quyền truy cập vào trang này!");
//	            return "redirect:/";
//	        }
//		
//	}
//	
//	@GetMapping("/product")
//    public ModelAndView showProductPage() {
//        ModelAndView mav = new ModelAndView("admin/index");
//        mav.addObject("pageContent", "editProduct.jsp");
//        return mav;
//    }
//
//    @GetMapping("/account")
//    public ModelAndView showAccountPage() {
//        ModelAndView mav = new ModelAndView("admin/index");
//        mav.addObject("pageContent", "account.jsp");
//        return mav;
//    }
//
//    @GetMapping("/report")
//    public ModelAndView showReportPage() {
//        ModelAndView mav = new ModelAndView("admin/index");
//        mav.addObject("pageContent", "sales-report.jsp");
//        return mav;
//    }
//}
