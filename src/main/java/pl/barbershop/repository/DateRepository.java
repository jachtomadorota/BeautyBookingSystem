package pl.barbershop.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.barbershop.model.Date;
import javax.transaction.Transactional;

@Transactional
public interface DateRepository extends JpaRepository<Date,Long> {
}
