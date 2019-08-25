package pl.barbershop.controller;



import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.barbershop.model.Barbershop;
import pl.barbershop.model.Date;
import pl.barbershop.model.UserRole;
import pl.barbershop.repository.*;
import pl.barbershop.service.DateService;

import javax.validation.Valid;
import java.lang.reflect.Array;
import java.util.*;


@Controller
@RequestMapping("/barbershop")
public class BarbershopController {

    private final BarbershopRepository barbershopRepository;
    private final UserRoleRepository userRoleRepository;
    private final ServiceRepository serviceRepository;
    private final ReservationRepository reservationRepository;
    private final DateService dateService;
    private final DateRepository dateRepository;


    public BarbershopController(BarbershopRepository barbershopRepository, UserRoleRepository userRoleRepository, ServiceRepository serviceRepository, ReservationRepository reservationRepository, DateService dateService, DateRepository dateRepository) {
        this.barbershopRepository = barbershopRepository;
        this.userRoleRepository = userRoleRepository;
        this.serviceRepository = serviceRepository;
        this.reservationRepository = reservationRepository;
        this.dateService = dateService;
        this.dateRepository = dateRepository;
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
        barbershop.setDates(dateRepository.findAll());
        userRoleRepository.save(userRole);
        barbershopRepository.save(barbershop);
        return "redirect:/";
    }

    @GetMapping("/login/panel/details/update/{id}")
    public String updateUserGet(Model model,@PathVariable Long id){
        model.addAttribute("barbershop",barbershopRepository.getOne(id));
        return "registration-barbershop";
    }

    @PostMapping("/login/panel/details/update/{id}")
    public String updateUserPost(@PathVariable Long id, @Valid Barbershop barbershop,BindingResult bindingResult){
        if(bindingResult.hasErrors()){
            return "registration-barbershop";
        }
        barbershop.setPassword(BCrypt.hashpw(barbershop.getPassword(),BCrypt.gensalt()));
        barbershopRepository.save(barbershop);
        return "redirect:/barbershop/login/panel/details";
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
                return "reservation-barbershop";
            } else {
                return "redirect:/login";
            }
        }
        return null;
    }





}
