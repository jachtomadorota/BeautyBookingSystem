package pl.barbershop.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import pl.barbershop.model.Date;
import javax.transaction.Transactional;
import java.util.List;

@Transactional
public interface DateRepository extends JpaRepository<Date,Long> {

        @Query(value = "select * from dates where day=?1",nativeQuery = true)
        Date checkDate(String date);

        @Modifying
        @Query(value = "insert into barbershops_dates values (?1,?1)",nativeQuery = true)
        void setBarbershopsDates( Long barbershopId, Long dateId);

}
