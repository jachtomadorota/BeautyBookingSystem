package pl.barbershop.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.barbershop.model.Barber;

import javax.transaction.Transactional;

@Transactional
public interface BarberRepository extends JpaRepository<Barber,Long> {
}
