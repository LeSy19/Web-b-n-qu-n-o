package poly.com.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import poly.com.entity.Product;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProductCart {
	Product product;
	int soLuong;
	double donGia;
	
}
