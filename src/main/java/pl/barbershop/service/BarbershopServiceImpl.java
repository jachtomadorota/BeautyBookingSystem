package pl.barbershop.service;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;
import pl.barbershop.model.Barbershop;
import pl.barbershop.repository.BarbershopRepository;

@Service
public class BarbershopServiceImpl implements BarbershopService {

    private  final BarbershopRepository barbershopRepository;

    public BarbershopServiceImpl(BarbershopRepository barbershopRepository) {
        this.barbershopRepository = barbershopRepository;
    }

    @Override
    public Barbershop checkIsLoged() {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if (principal instanceof UserDetails) {
            String username = ((UserDetails) principal).getUsername();
            Barbershop barbershop = barbershopRepository.findByEmail(username);
            return barbershop;
        }
        return null;
    }
}
