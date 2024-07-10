package poly.com.entity;

import java.util.List;
import org.hibernate.validator.constraints.NotEmpty;
import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import jakarta.validation.constraints.DecimalMin;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "Products")
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    
    Integer id;
    
    @NotEmpty(message = "{NotEmpty.product.name}")
    String name;
    
    @NotNull(message = "{NotNull.product.price}")
    @DecimalMin(value = "0", message = "{DecimalMin.product.price}")
    Double price;
    
    @NotNull(message = "{NotNull.product.quantity}")
    @Min(value = 1, message = "{Min.product.quantity}")
    Integer quantity;
    
    
    String image;
    
    @NotEmpty(message = "{NotEmpty.product.material}")
    String material;
    
    @NotEmpty(message = "{NotEmpty.product.size}")
    String size;
    
    @NotEmpty(message = "{NotEmpty.product.description}")
    String description;
    
    @ManyToOne
    @JoinColumn(name = "Categoryid")
    Category category;
    
    @JsonIgnore
    @OneToMany(mappedBy = "product")
    List<OrderDetail> orderDetails;    
}
