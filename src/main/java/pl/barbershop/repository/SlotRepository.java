package pl.barbershop.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.barbershop.model.Slot;

import javax.transaction.Transactional;

@Transactional
public interface SlotRepository extends JpaRepository<Slot,Long> {
}
