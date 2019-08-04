package pl.barbershop.repository;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import pl.barbershop.model.Service;

import java.util.List;

public interface ServiceRepository extends JpaRepository<Service,Long> {

    @Query(value = "select * from services left join services_barbershops on services.id = services_barbershops.services_id where services.id = ?1;",nativeQuery = true)
    List<Service> findServicesByBarbershopsId(Long id);
}
