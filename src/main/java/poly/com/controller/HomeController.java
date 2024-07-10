package poly.com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.validation.Valid;
import poly.com.dao.CategoryDAO;
import poly.com.dao.ProductDAO;
import poly.com.entity.Category;
import poly.com.entity.Product;
import poly.com.services.SessionService;

import java.util.List;
import java.util.Optional;

import javax.management.RuntimeErrorException;

@Controller
public class HomeController {
    @Autowired
    ProductDAO productDAO;
    @Autowired
    CategoryDAO categoryDAO;

    @Autowired
    SessionService session;
    
    @RequestMapping("/")
    public String index(Model model) {
        Product item = new Product();
        model.addAttribute("item", item);
        List<Product> items = productDAO.findAll();
        model.addAttribute("items", items);
        List<Category> categories = categoryDAO.findAll();
        model.addAttribute("categories", categories);
        return "index";
    }

    @RequestMapping("/product/edit/{id}")
    public String edit(Model model, @PathVariable("id") Integer id) {
        Product item = productDAO.findById(id).orElse(null); // Sử dụng orElse để tránh NullPointerException
        model.addAttribute("item", item);
        List<Product> items = productDAO.findAll();
        model.addAttribute("items", items);
        List<Category> categories = categoryDAO.findAll();
        model.addAttribute("categories", categories);
        return "product/index";
    }


    @RequestMapping(value = "/product/create")
    public String create(@Valid @ModelAttribute("item") Product item, BindingResult result, Model model) {
        if (result.hasErrors()) {
            List<Product> items = productDAO.findAll();
            model.addAttribute("items", items);
            List<Category> categories = categoryDAO.findAll();
            model.addAttribute("categories", categories);
            return "product/index";
        }
        productDAO.save(item);
        return "redirect:/product/index";
    }


    @RequestMapping("/product/update")
    public String update(Product item) {
        productDAO.save(item);
        return "redirect:/product/edit/" + item.getId();
    }

    @RequestMapping("/product/delete/{id}")
    public String delete(@PathVariable("id") Integer id) {
        productDAO.deleteById(id);
        return "redirect:/product/index";
    }
    @RequestMapping("/search")
    public String search(Model model,
                         @RequestParam("keywords") Optional<String> kw) {

        String keywords = kw.orElse((String) session.get("keywords", ""));
        session.set("keywords", keywords);

        // Thực hiện tìm kiếm sản phẩm
        List<Product> searchResult = productDAO.findByKeywords("%" + keywords + "%");

        // Đặt các thuộc tính vào model
        model.addAttribute("search", searchResult);
        model.addAttribute("keywords", keywords);

        return "search";
    }

    @RequestMapping("/detail/{id}")
    public String detail(Model model, @PathVariable("id") Integer id) {
        Product item = productDAO.findById(id).orElse(null); // Sử dụng orElse để tránh NullPointerException
        model.addAttribute("item", item);
        return "product-details";
    }

    @RequestMapping("/product/page")
    public String searchAndPage(Model model,
                                @RequestParam("p") Optional<Integer> p) {
        Pageable pageable = PageRequest.of(p.orElse(0), 5);
        Page<Product> page = productDAO.findAll(pageable);
        model.addAttribute("page", page);
        return "index";
    }
    }
