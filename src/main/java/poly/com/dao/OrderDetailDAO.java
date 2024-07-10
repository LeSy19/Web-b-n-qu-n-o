package poly.com.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import poly.com.entity.OrderDetail;

public interface OrderDetailDAO extends JpaRepository<OrderDetail, Integer>{
	boolean existsByProduct_Id(int Id);
}
