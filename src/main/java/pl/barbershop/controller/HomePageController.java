package pl.barbershop.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import pl.barbershop.repository.BarbershopRepository;


@Controller
public class HomePageController {

    private final BarbershopRepository barbershopRepository;


    public HomePageController(BarbershopRepository barbershopRepository) {
        this.barbershopRepository = barbershopRepository;
    }

    @GetMapping("/")
    public String homepage(Model model){
        model.addAttribute("barbershop",barbershopRepository.findAll());
        return "homepage";
    }


}
