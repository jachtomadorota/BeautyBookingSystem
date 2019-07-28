package pl.barbershop.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.barbershop.model.User;

import javax.transaction.Transactional;

@Transactional
public interface UserRepository  extends JpaRepository<User,Long> {


    User findByEmail(String email);
}
