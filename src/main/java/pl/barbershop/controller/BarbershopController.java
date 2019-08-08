package pl.barbershop.controller;



import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.barbershop.model.Barbershop;
import pl.barbershop.model.UserRole;
import pl.barbershop.repository.*;
import javax.validation.Valid;
import java.util.ArrayList;
import java.util.List;


@Controller
@RequestMapping("/barbershop")
public class BarbershopController {

    private final BarbershopRepository barbershopRepository;
    private final UserRoleRepository userRoleRepository;
    private final ServiceRepository serviceRepository;
    private final ReservationRepository reservationRepository;


    public BarbershopController(BarbershopRepository barbershopRepository, UserRoleRepository userRoleRepository,ServiceRepository serviceRepository, ReservationRepository reservationRepository) {
        this.barbershopRepository = barbershopRepository;
        this.userRoleRepository = userRoleRepository;
        this.serviceRepository = serviceRepository;
        this.reservationRepository = reservationRepository;
    }

    @GetMapping("/registration")
    public String registrationBarbershopGet(Model model){
        model.addAttribute("barbershop",new Barbershop());
        return "registration-barbershop";
    }

    @PostMapping("/registration")
    public String registrationBarbershopPost(Model model, @Valid Barbershop barbershop, BindingResult bindingResult){
        if(bindingResult.hasErrors()){
            return "registration-barbershop";
        }
        barbershop.setPassword(BCrypt.hashpw(barbershop.getPassword(),BCrypt.gensalt()));
        UserRole userRole = new UserRole();
        userRole.setUsername(barbershop.getEmail());
        userRole.setRole("ROLE_BARBERSHOP");
        userRoleRepository.save(userRole);
        barbershopRepository.save(barbershop);
        return "redirect:/";
    }



    @GetMapping("/login/panel")
    public String getPanel(){
        return "barbershop-panel";
    }

    @GetMapping("/login/panel/details")
    public String getBarbershopDetails(Model model){
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if (principal instanceof UserDetails) {
                String username = ((UserDetails) principal).getUsername();
                List<Barbershop> barbershopList = new ArrayList<>();
                barbershopList.add(barbershopRepository.findByEmail(username));
                model.addAttribute("barbershops", barbershopList);
                return "barbershop-details";
            } else {
                return "redirect:/login";
            }
    }

    @GetMapping("/login/panel/services")
    public String getServices (Model model){
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if (principal instanceof UserDetails) {
            String username = ((UserDetails) principal).getUsername();
            Barbershop barbershop = barbershopRepository.findByEmail(username);
            if (barbershop != null) {
                model.addAttribute("service", serviceRepository.findServicesByBarbershopsId(barbershop.getId()));
                return "service-list";
            } else {
                return "redirect:/login";
            }
        }
        return null;
    }

    @GetMapping("/login/panel/reservations")
    public String getReservations(Model model){
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if (principal instanceof UserDetails) {
            String username = ((UserDetails) principal).getUsername();
            Barbershop barbershop = barbershopRepository.findByEmail(username);
            if (barbershop != null) {
                model.addAttribute("reservations", reservationRepository.findbyBarbershopId(barbershop.getId()));
                return "reservation-list";
            } else {
                return "redirect:/login";
            }
        }
        return null;
    }





}
