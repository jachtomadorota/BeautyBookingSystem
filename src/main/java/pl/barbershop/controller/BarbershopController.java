package pl.barbershop.controller;


import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.barbershop.model.Barber;
import pl.barbershop.model.Barbershop;
import pl.barbershop.model.UserRole;
import pl.barbershop.repository.BarberRepository;
import pl.barbershop.repository.BarbershopRepository;
import pl.barbershop.repository.UserRoleRepository;
import javax.validation.Valid;


@Controller
@RequestMapping("/barbershop")
public class BarbershopController {

    private final BarbershopRepository barbershopRepository;
    private final UserRoleRepository userRoleRepository;
    private final BarberRepository barberRepository;


    public BarbershopController(BarbershopRepository barbershopRepository, UserRoleRepository userRoleRepository, BarberRepository barberRepository) {
        this.barbershopRepository = barbershopRepository;
        this.userRoleRepository = userRoleRepository;
        this.barberRepository = barberRepository;
    }

    @GetMapping("/registration")
    public String registrationBarbershopGet(Model model){
        model.addAttribute("barbershop",new Barbershop());
        return "registration-barbershop";
    }

    @PostMapping("/registration")
    public String registrationBarbershopPost(@Valid Barbershop barbershop, BindingResult bindingResult){
        if(bindingResult.hasErrors()){
            return "registration-barbershop";
        }
        barbershop.setPassword(BCrypt.hashpw(barbershop.getPassword(),BCrypt.gensalt()));
        UserRole userRole = new UserRole();
        userRole.setUsername(barbershop.getEmail());
        userRole.setRole("ROLE_BARBERSHOP");
        userRoleRepository.save(userRole);
        barbershopRepository.save(barbershop);
        return "barbershop-panel";
    }


    @ResponseBody
    @GetMapping("/login/panel/barber/details")
    public String getBarbers(){

        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        return
                " " +
                auth.getName() +
                " " +
                auth.getAuthorities().toString() + " " +
                auth.getPrincipal().toString() + " " +
                auth.getDetails().toString();

    }



}
