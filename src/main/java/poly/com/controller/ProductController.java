package poly.com.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jakarta.validation.Valid;
import poly.com.dao.CategoryDAO;
import poly.com.dao.OrderDetailDAO;
import poly.com.dao.ProductDAO;
import poly.com.entity.Category;
import poly.com.entity.Product;

@Controller
public class ProductController {
    @Autowired
    ProductDAO productDAO;

    @Autowired
    CategoryDAO categoryDAO;
    
    @Autowired
    OrderDetailDAO orderdetailDAO;

    private static final String UPLOAD_DIR = "D:/FPT Polytechnic/SOF3021-JAVA5/ShopQuanAo_Nhom2_ASM/src/main/webapp/upload/";

    @RequestMapping("/editproduct/index")
    public String index(Model model) {
        Product product = new Product();
        model.addAttribute("product", product);
        List<Product> products = productDAO.findAll();
        List<Category> categories = categoryDAO.findAll();
        model.addAttribute("products", products);
        model.addAttribute("categories", categories);
        return "admin/editProduct";
    }

    @RequestMapping("/editproduct/edit/{id}")
    public String edit(Model model, @PathVariable("id") Integer id) {
        Product product = productDAO.findById(id).orElse(null);
        List<Product> products = productDAO.findAll();
        List<Category> categories = categoryDAO.findAll();
        
        model.addAttribute("product", product);
        model.addAttribute("products", products);
        model.addAttribute("categories", categories);
        
        return "admin/editProduct";
    }

    @RequestMapping(value = "/editproduct/create", method = RequestMethod.POST)
    public String create(@Valid @ModelAttribute("product") Product product, 
                         @RequestParam("imageFile") MultipartFile imageFile,
                         BindingResult result, Model model) throws IOException {
        if (result.hasErrors()) {
            List<Product> products = productDAO.findAll();
            model.addAttribute("product",products);
            return "admin/editProduct"; // Adjust the path here
        } else {
            if (!imageFile.isEmpty()) {
                File uploadDir = new File(UPLOAD_DIR);
                if (!uploadDir.exists()) {
                    uploadDir.mkdirs();
                }
                String imagePath = UPLOAD_DIR + imageFile.getOriginalFilename();
                imageFile.transferTo(new File(imagePath));
                product.setImage(imageFile.getOriginalFilename());
            }
            productDAO.save(product);
        }
        return "redirect:/editproduct/index";
    }

    @RequestMapping(value = "/editproduct/update", method = RequestMethod.POST)
    public String update(@Valid @ModelAttribute("product") Product product, 
                         @RequestParam("imageFile") MultipartFile imageFile,
                         BindingResult result, Model model) throws IOException { 
        if (result.hasErrors()) {
            List<Product> products = productDAO.findAll();
            model.addAttribute("products",products);
            return "admin/editProduct"; // Adjust the path here
        } else {
            if (!imageFile.isEmpty()) {
                File uploadDir = new File(UPLOAD_DIR);
                if (!uploadDir.exists()) {
                    uploadDir.mkdirs();
                }
                String imagePath = UPLOAD_DIR + imageFile.getOriginalFilename();
                imageFile.transferTo(new File(imagePath));
                product.setImage(imageFile.getOriginalFilename());
            }
            productDAO.save(product);
        }
        return "redirect:/editproduct/index";
    }

    @RequestMapping("/editproduct/delete/{id}")
    public String delete(@PathVariable("id") int id, RedirectAttributes redirectAttributes) {
    	if(orderdetailDAO.existsByProduct_Id(id)) {
    		redirectAttributes.addFlashAttribute("message", "Không thể xóa sản phẩm này vì id sản phẩm có liên kết với bảng hóa đơn chi tiết !");
    		return "redirect:/editproduct/index";
    	}else {
        productDAO.deleteById(id);
    	}
        return "redirect:/editproduct/index";
    }
}