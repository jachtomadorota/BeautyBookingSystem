package pl.barbershop.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.barbershop.model.Barbershop;

import javax.transaction.Transactional;

@Transactional
public interface BarbershopRepository extends JpaRepository<Barbershop,Long> {
}
