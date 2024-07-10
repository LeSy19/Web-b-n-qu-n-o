package poly.com.dao;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import poly.com.entity.Account;

public interface AccountDAO extends JpaRepository<Account, String>{

	Account findByUsername(String username);
	
	Optional<Account> findOptionalByUsername(String username); 
	
	Integer findRoleByUsername(String username);
	
	 
	Optional<Account> findByEmail(String email); // Trả về Optional<Account>
	
		boolean existsByEmail(String email);

		boolean existsByUsername(String username);

		void save(Optional<Account> account);

		 Account findByResetToken(String resetToken);
}
