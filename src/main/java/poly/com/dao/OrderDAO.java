package poly.com.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import poly.com.entity.Order;

public interface OrderDAO extends JpaRepository<Order, Integer>{
	@Query("SELECT SUM(od.price * od.quantity) FROM OrderDetail od WHERE od.order.id = :orderId")
    Double getTotalPriceByOrderId(@Param("orderId") Integer orderId);
	
	 boolean existsByAccount_Username(String username);
}
