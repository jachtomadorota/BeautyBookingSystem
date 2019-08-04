package pl.barbershop.controller;



import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.barbershop.model.Barbershop;
import pl.barbershop.model.UserRole;
import pl.barbershop.repository.*;
import pl.barbershop.service.BarbershopServiceImpl;

import javax.validation.Valid;


@Controller
@RequestMapping("/barbershop")
public class BarbershopController {

    private final BarbershopRepository barbershopRepository;
    private final UserRoleRepository userRoleRepository;
    private final BarberRepository barberRepository;
    private final BarbershopServiceImpl barbershopService;
    private final ServiceRepository serviceRepository;
    private final ReservationRepository reservationRepository;


    public BarbershopController(BarbershopRepository barbershopRepository, UserRoleRepository userRoleRepository, BarberRepository barberRepository, BarbershopServiceImpl barbershopService, ServiceRepository serviceRepository, ReservationRepository reservationRepository) {
        this.barbershopRepository = barbershopRepository;
        this.userRoleRepository = userRoleRepository;
        this.barberRepository = barberRepository;
        this.barbershopService = barbershopService;
        this.serviceRepository = serviceRepository;
        this.reservationRepository = reservationRepository;
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

    @GetMapping("/login/panel/details")
    public String getBarbershopDetails(Model model){
    Barbershop barbershop = barbershopService.checkIsLoged();
        if( barbershop != null){
            model.addAttribute("barbershop",barbershop);
            return "barbershop-details";
        }else{
            return "redirect:/login";
        }
    }

    @GetMapping("/login/panel/barbers")
    public String getBarbers(Model model){
        Barbershop barbershop = barbershopService.checkIsLoged();
        if(barbershop != null){
            model.addAttribute("barber",barberRepository.findByBarbershopId(barbershop.getId()));
            return "barber-list";
        }else{
            return "redirect:/login";
        }
    }

    @GetMapping("/login/panel/services")
    public String getServices (Model model){
        Barbershop barbershop = barbershopService.checkIsLoged();
        if(barbershop != null){
            model.addAttribute("service",serviceRepository.findServicesByBarbershopsId(barbershop.getId()));
            return  "service-list";
        }else{
            return "redirect:/login";
        }
    }

    @GetMapping("/login/panel/reservations")
    public String getReservations(Model model){
        Barbershop barbershop = barbershopService.checkIsLoged();
        if(barbershop != null){
            model.addAttribute("reservations", reservationRepository.findbyBarbershopId(barbershop.getId()));
            return  "reservation-list";
        }else{
            return "redirect:/login";
        }
    }





}
