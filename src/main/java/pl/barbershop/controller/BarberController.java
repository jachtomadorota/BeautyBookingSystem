package pl.barbershop.controller;


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
import pl.barbershop.repository.ReservationRepository;
import pl.barbershop.service.BarbershopServiceImpl;

import javax.validation.Valid;

@Controller
@RequestMapping("/barbershop/login/panel/barber")
public class BarberController {

    private final BarberRepository barberRepository;
    private final BarbershopServiceImpl barbershopService;
    private final ReservationRepository reservationRepository;

    public BarberController(BarberRepository barberRepository, BarbershopServiceImpl barbershopService, ReservationRepository reservationRepository) {
        this.barberRepository = barberRepository;
        this.barbershopService = barbershopService;
        this.reservationRepository = reservationRepository;
    }


    @GetMapping("/add")
    public String addBarberGet(Model model){
        model.addAttribute("barber",new Barber());
        return "add-barber";
    }

    @PostMapping("/add")
    public String addBarberPost(@Valid Barber barber, BindingResult bindingResult){
        if(bindingResult.hasErrors()){
            return "add-barber";
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
        barberRepository.save(barber);
        return "barbershop-panel";
    }

    @GetMapping("/{id}/reservations")
    public String getReservations(@PathVariable Long id, Model model) {
        Barbershop barbershop = barbershopService.checkIsLoged();
        if (barbershop != null) {
            model.addAttribute("reservations", reservationRepository.findbyBarberId(id));
            return "reservation-list";
        } else {
            return "redirect:/login";
        }

    }

}
