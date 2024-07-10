package poly.com.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import poly.com.entity.Product;
import poly.com.entity.Report;

public interface ProductDAO extends JpaRepository<Product, Integer>{
	@Query("SELECT o FROM Product o WHERE o.price BETWEEN ?1 AND ?2")
	List<Product> findByPrice(double minPrice, double maxPrice);

//	@Query("SELECT o FROM Product o WHERE o.price BETWEEN ?1 AND ?2")
//	List<Product> findByPrice(double minPrice, double maxPrice);
	List<Product> findByPriceBetween(double minPrice, double maxPrice);

//@Query("SELECT o FROM Product o WHERE o.name LIKE ?1")
//Page<Product> findByKeywords(String keywords, Pageable pageable);

//Page<Product> findAllByNameLike(String keywords, Pageable pageable);


    @Query("SELECT o FROM Product o WHERE o.name LIKE ?1")
    List<Product> findByKeywords(String keywords);
	
	@Query("SELECT new Report(o.category, sum(o.price), count(o)) "
			+ " FROM Product o "
			+ " GROUP BY o.category"
			+ " ORDER BY sum(o.price) DESC")
	List<Report> getInventoryByCategory();
	
	@Query("SELECT new poly.com.entity.Report(p.name, SUM(od.price * od.quantity), SUM(od.quantity)) " +
	 	       "FROM OrderDetail od JOIN od.product p " +
	 	       "WHERE MONTH(od.order.createDate) = :month AND YEAR(od.order.createDate) = :year " +
	 	       "GROUP BY p.name " +
	 	       "ORDER BY SUM(od.quantity) DESC")
	 	List<Report> getInventoryByProductAndMonth(int month, int year);
	
	@Query("SELECT o FROM Product o WHERE o.name like ?1 ")
	Page<Product> findByKeyword(String keywords, Pageable pageable);

}
