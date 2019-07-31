package pl.barbershop.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.barbershop.model.Barber;
import pl.barbershop.repository.BarberRepository;

import javax.validation.Valid;

@Controller
@RequestMapping("/barbershop")
public class BarberController {

    private final BarberRepository barberRepository;

    public BarberController(BarberRepository barberRepository) {
        this.barberRepository = barberRepository;
    }

    @GetMapping("/login/panel/add/barber")
    public String addBarberGet(Model model){
        model.addAttribute("barber",new Barber());
        return "add-barber";
    }

    @PostMapping("/login/panel/barber/add")
    public String addBarberPost(@Valid Barber barber, BindingResult bindingResult){
        if(bindingResult.hasErrors()){
            return "add-barber";
        }
        barberRepository.save(barber);
        return "barbershop-panel";
    }

    @GetMapping("/login/panel/delete/barber/{id}")
    public String deleteBarber(@PathVariable Long id){
        barberRepository.deleteById(id);
        return "barbershop-panel";
    }

    @GetMapping("/login/panel/barber/update/{id}")
    public String updateBarberGet(@PathVariable Long id, Model model){
        model.addAttribute("barber",barberRepository.findById(id));
        return "add-barber";
    }

    @PostMapping("/login/barber/barber/update/{id}")
    public String updateBarberPost(@PathVariable Long id, @Valid Barber barber, BindingResult bindingResult){
        if(bindingResult.hasErrors()){
            return "add-barber";
        }
        barberRepository.save(barber);
        return "barbershop-panel";
    }



}
