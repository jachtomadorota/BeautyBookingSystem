package pl.barbershop.repository;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import pl.barbershop.model.Service;

import javax.transaction.Transactional;
import java.util.List;

@Transactional
public interface ServiceRepository extends JpaRepository<Service,Long> {

    @Query(value = "select * from services where barbershop_id=?1",nativeQuery = true)
    List<Service> findServicesByBarbershopsId(Long id);
}
