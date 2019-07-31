package pl.barbershop.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import pl.barbershop.model.Barber;

import javax.transaction.Transactional;
import java.util.Set;

@Transactional
public interface BarberRepository extends JpaRepository<Barber,Long> {

    @Query(value = "select * from barbers where barbershop_id= ?1",nativeQuery = true)
    Set<Barber> findByBarbershopId(Long id);
}
