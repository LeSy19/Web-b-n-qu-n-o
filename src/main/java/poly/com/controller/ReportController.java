package poly.com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import poly.com.dao.ProductDAO;
import poly.com.entity.Report;

import java.util.List;


@Controller
public class ReportController {
    @Autowired
    ProductDAO dao;
    
    
    @RequestMapping("/report")
    public String inventory(@RequestParam(name = "month", required = false) Integer month,
                            @RequestParam(name = "year", required = false) Integer year,
                            Model model) {
        // Lấy giá trị tháng và năm mặc định nếu không có giá trị được cung cấp
        if (month == null || month < 1 || month > 12) {
            month = java.time.LocalDate.now().getMonthValue();
        }
        if (year == null || year < 1900 || year > 2100) {
            year = java.time.LocalDate.now().getYear();
        }
        
        // Gọi DAO để lấy dữ liệu báo cáo từ cơ sở dữ liệu dựa trên tháng và năm
        List<Report> items = dao.getInventoryByProductAndMonth(month, year);
        
        model.addAttribute("items", items);
        model.addAttribute("selectedMonth", month);
        model.addAttribute("selectedYear", year);
        
        return "admin/sales-report";
    }
}