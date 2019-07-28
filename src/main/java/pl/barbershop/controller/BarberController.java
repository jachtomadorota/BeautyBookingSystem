package pl.barbershop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.barbershop.model.Barber;
import pl.barbershop.repository.BarberRepository;

@Controller
@RequestMapping("/barbershop/loged")
public class BarberController {

    private final BarberRepository barberRepository;


    public BarberController(BarberRepository barberRepository) {
        this.barberRepository = barberRepository;
    }

    @GetMapping("/add/barber")
    public String addBarberGet(Model model){
        model.addAttribute("barber",new Barber());
        return "add-barber";
    }


}
