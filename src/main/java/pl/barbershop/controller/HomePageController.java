package pl.barbershop.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import pl.barbershop.repository.BarbershopRepository;


@Controller
public class HomePageController {

    private final BarbershopRepository barbershopRepository;


    public HomePageController(BarbershopRepository barbershopRepository) {
        this.barbershopRepository = barbershopRepository;
    }

    @GetMapping("/")
    public String homepage(Model model){
        model.addAttribute("barbershops",barbershopRepository.findAll());
        return "homepage";
    }

    @GetMapping("/search")
    public String search(){
        return "search";
    }

    @PostMapping("/search")
    public String searchPost(Model model, @RequestParam("city") String city){
        model.addAttribute("barbershop",barbershopRepository.findByCity(city));
        return "barbershop-list";
    }

}
