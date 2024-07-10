package poly.com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import poly.com.dao.OrderDAO;
import poly.com.entity.Order;

import java.util.List;

@Controller
@RequestMapping("/orders")
public class OrderController {

    @Autowired
    OrderDAO dao;

    @GetMapping
    public String getAllOrders(Model model) {
        List<Order> orders = dao.findAll();
        for (Order order : orders) {
            Double totalPrice = dao.getTotalPriceByOrderId(order.getId());
            order.setTotalAmount(totalPrice);
        }
        model.addAttribute("orders", orders);
        return "admin/orders"; // 
    }

    @GetMapping("/{id}")
    public String getOrderById(@PathVariable Integer id, Model model) {
        Order order = dao.findById(id).orElse(null);
        if (order == null) {
            return "redirect:/orders"; 
        }

        // Tính tổng giá tiền và gán vào đối tượng Order
        Double totalPrice = dao.getTotalPriceByOrderId(id);
        order.setTotalAmount(totalPrice);
        dao.save(order);
        model.addAttribute("order", order);
        return "admin/order-details"; // 
    }
}