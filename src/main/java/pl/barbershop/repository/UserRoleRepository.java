package pl.barbershop.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.barbershop.model.UserRole;

import javax.transaction.Transactional;

@Transactional
public interface UserRoleRepository extends JpaRepository<UserRole,Long> {

}
