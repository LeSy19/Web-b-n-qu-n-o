package poly.com.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import poly.com.entity.Category;

public interface CategoryDAO extends JpaRepository<Category, String>{

}
