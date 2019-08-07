package pl.barbershop.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import pl.barbershop.model.Reservation;

import javax.transaction.Transactional;
import java.util.Set;

@Transactional
public interface ReservationRepository extends JpaRepository<Reservation,Long>{

    @Query(value = "select * from reservations where user_id=?1",nativeQuery = true)
    Set<Reservation> findByUserId(Long id);

    @Query(value = "/select * from reservations where barbershop_id=?1",nativeQuery = true)
    Set<Reservation> findbyBarbershopId(Long id);

    @Query(value = "select * from reservations where barber_id=?1",nativeQuery = true)
    Set<Reservation> findbyBarberId(Long id);

}
