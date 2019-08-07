package pl.barbershop.controller;


import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.barbershop.model.Barber;
import pl.barbershop.model.Barbershop;
import pl.barbershop.repository.BarberRepository;
import pl.barbershop.repository.BarbershopRepository;
import pl.barbershop.repository.ReservationRepository;

import javax.validation.Valid;

@Controller
@RequestMapping("/barbershop/login/panel/barber")
public class BarberController {

    private final BarberRepository barberRepository;
    private final ReservationRepository reservationRepository;
    private final BarbershopRepository barbershopRepository;

    public BarberController(BarberRepository barberRepository, ReservationRepository reservationRepository, BarbershopRepository barbershopRepository) {
        this.barberRepository = barberRepository;
        this.reservationRepository = reservationRepository;
        this.barbershopRepository = barbershopRepository;
    }

    @GetMapping("/add")
    public String addBarberGet(Model model){
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

            model.addAttribute("barber",new Barber());
            return "add-barber";



    }

    @PostMapping("/add")
    public String addBarberPost(@Valid Barber barber, BindingResult bindingResult){
        if(bindingResult.hasErrors()){
            return "add-barber";
        }
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if (principal instanceof UserDetails) {
            String username = ((UserDetails) principal).getUsername();
            Barbershop barbershop = barbershopRepository.findByEmail(username);
            barber.setBarbershop(barbershop);
        }
        barberRepository.save(barber);
        return "barbershop-panel";
    }

    @GetMapping("/delete/{id}")
    public String deleteBarber(@PathVariable Long id){
        barberRepository.deleteById(id);
        return "barbershop-panel";
    }

    @GetMapping("/update/{id}")
    public String updateBarberGet(@PathVariable Long id, Model model){
        model.addAttribute("barber",barberRepository.findById(id));
        return "add-barber";
    }

    @PostMapping("/update/{id}")
    public String updateBarberPost(@PathVariable Long id, @Valid Barber barber, BindingResult bindingResult){
        if(bindingResult.hasErrors()){
            return "add-barber";
        }
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if (principal instanceof UserDetails) {
            String username = ((UserDetails) principal).getUsername();
            Barbershop barbershop = barbershopRepository.findByEmail(username);
            barber.setBarbershop(barbershop);
            barberRepository.save(barber);
        }
        return "barbershop-panel";
    }

    @GetMapping("/{id}/reservations")
    public String getReservations(@PathVariable Long id, Model model) {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if (principal instanceof UserDetails) {
            String username = ((UserDetails) principal).getUsername();
            Barbershop barbershop = barbershopRepository.findByEmail(username);
            if (barbershop != null) {
                model.addAttribute("reservations", reservationRepository.findbyBarberId(id));
                return "reservation-list";
            } else {
                return "redirect:/login";
            }
        }
        return null;
    }

}
