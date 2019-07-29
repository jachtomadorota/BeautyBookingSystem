package pl.barbershop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.barbershop.model.Barber;
import pl.barbershop.repository.BarberRepository;

import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/barbershop/login")
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

    @PostMapping("/add/barber")
    public String addBarberPost(@Valid Barber barber, BindingResult bindingResult){
        if(bindingResult.hasErrors()){
            return "add-barber";
        }
        barberRepository.save(barber);
        return "redirect:/homepage";
    }

    @GetMapping("/delete/barber/{id}")
    public String deleteBarber(@PathVariable Long id){
        barberRepository.deleteById(id);
        return "redirect:/homepage";
    }

    @RequestMapping("/barber/all")
    public String userList(Model model){
        List<Barber> users = barberRepository.findAll();
        model.addAttribute("barber",barberRepository.findAll());
        return "barber-list";
    }

    @RequestMapping(value = "/update/barber/{id}", method = RequestMethod.GET)
    public String updateGet(@PathVariable Long id, Model model) {
        model.addAttribute("barber",barberRepository.getOne(id));
        return "add-barber";
    }

    @RequestMapping(value = "/update/{id}",method = RequestMethod.POST)
    public String updatePost(@PathVariable Long id, @Valid Barber barber, BindingResult bindingResult){
        if(bindingResult.hasErrors()){
            return "add-barber";
        }
        barberRepository.save(barber);
        return "redirect:/barbershop/login/barber/all";
    }


}
