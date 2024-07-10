package poly.com.services;



import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.apache.catalina.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.context.annotation.SessionScope;

import poly.com.dao.OrderDAO;
import poly.com.dao.OrderDetailDAO;
import poly.com.dao.ProductDAO;
import poly.com.entity.Account;
import poly.com.entity.Order;
import poly.com.entity.OrderDetail;
import poly.com.entity.Product;
import poly.com.model.ProductCart;
@SessionScope
@Service
public class ShoppingCartServiceImpl implements ShoppingCartService{
	Map<Integer, ProductCart> map = new HashMap<>();
	@Autowired
    ProductDAO dao; // Giả sử bạn có DAO để lấy thông tin về sản phẩm
	@Autowired
	OrderDAO orderDao;
	@Autowired
	OrderDetailDAO oderDetailDao;
	@Override
	public boolean checkout(Account userLogin) {
		try {
		// TODO Auto-generated method stub
		Order order = new Order();
		order.setAccount(userLogin);
		order.setCreateDate(new java.util.Date());
		order.setStatus("Chờ xử lý");//NEW CONFIRMED SUCCESS CANCEL
		order.setTotalAmount(this.getAmount());
		order = orderDao.save(order);
		//order se co id
		Collection<ProductCart> listProductCarts = map.values();
		for(ProductCart pCart:listProductCarts) {
			OrderDetail orderDetail = new OrderDetail();
			orderDetail.setOrder(order);
			orderDetail.setPrice(pCart.getDonGia());
			orderDetail.setProduct(pCart.getProduct());
			orderDetail.setQuantity(pCart.getSoLuong());
			oderDetailDao.save(orderDetail);
		}
		}catch(Exception e) {
			return false;
		}
		return true;
	}

	
	@Override
    public ProductCart add(Integer id) {
		ProductCart item = map.get(id);
        if (item == null) { // Chưa có trong giỏ hàng
            Optional<Product> optionalProduct = dao.findById(id); // Lấy thông tin sản phẩm từ cơ sở dữ liệu
            if (optionalProduct.isPresent()) {
                Product product = optionalProduct.get();
                item = new ProductCart();
                item.setProduct(product); // Gán thông tin sản phẩm vào CartShoes
                item.setSoLuong(1); // Gán số lượng là 1
                item.setDonGia(product.getPrice()); // Gán thành tiền ban đầu là giá của sản phẩm
                map.put(id, item);
            } else {
                throw new RuntimeException("Product not found");
            }
        } else {
            item.setSoLuong(item.getSoLuong() + 1);
            item.setDonGia(item.getSoLuong() * item.getProduct().getPrice()); // Cập nhật thành tiền
        }
        return item;
    }

	@Override
	public void remove(Integer id) {
		map.remove(id);
	}

	@Override
	public ProductCart update(Integer id, String soLuong) {
		ProductCart item = map.get(id);
		if(soLuong.equals("minus") && item.getSoLuong()>0) {
			item.setSoLuong(item.getSoLuong()-1);
			if(item.getSoLuong() == 0)
				this.remove(id);
		}else if(soLuong.equals("plus") &&item.getSoLuong()<100) {
			item.setSoLuong(item.getSoLuong()+1);
		}
		
		return item;
	}

	@Override
	public void clear() {
		// xoa het gio hang
		map.clear();
	}

	@Override
	public Collection<ProductCart> getItems() {
		return map.values();
	}

	@Override
	public int getCount() {
		return map.values().stream().mapToInt(item -> item.getSoLuong()).sum();
	}

	@Override
	public double getAmount() {
		return map.values().stream().mapToDouble(item -> item.getDonGia()*item.getSoLuong()).sum();
	}


}
