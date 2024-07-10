package poly.com.entity;

import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;

import org.hibernate.validator.constraints.NotEmpty;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import jakarta.validation.constraints.Email;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "Account")
public class Account {
	@Id
	@NotEmpty(message = "{NotEmpty.account.username}")
	String username;
	@NotEmpty(message = "{NotEmpty.account.password}")
	String password;
	@NotEmpty(message = "{NotEmpty.account.fullname}")
	String fullname;
	@NotEmpty(message = "{NotEmpty.account.email}")
	@Email(message = "{NotEmpty.account.email}")
	String email;
	@NotEmpty(message = "{NotEmpty.account.phone}")
	String phone;
	@NotEmpty(message = "{NotEmpty.account.adress}")
	String adress;
	boolean role ;
	private String resetToken;
	@Temporal(TemporalType.DATE)
	@Column(name = "Createdate")
	Date createDate = new Date();
	@JsonIgnore
	@OneToMany(mappedBy = "account")
	List<Order> orders;
}
