package pl.barbershop.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import pl.barbershop.model.Date;
import javax.transaction.Transactional;

@Transactional
public interface DateRepository extends JpaRepository<Date,Long> {

        @Query(value = "select * from dates where day=?1",nativeQuery = true)
        Date checkDate(String date);
}
