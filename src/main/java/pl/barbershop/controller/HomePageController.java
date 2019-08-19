package pl.barbershop.controller;


import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pl.barbershop.model.Date;
import pl.barbershop.repository.BarbershopRepository;
import pl.barbershop.repository.DateRepository;
import pl.barbershop.service.DateService;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class HomePageController {

    private final BarbershopRepository barbershopRepository;
    private final DateRepository dateRepository;
    private final DateService dateService;


    public HomePageController(BarbershopRepository barbershopRepository, DateRepository dateRepository, DateService dateService) {
        this.barbershopRepository = barbershopRepository;
        this.dateRepository = dateRepository;
        this.dateService = dateService;
    }

    @GetMapping("/")
    public String homepage(Model model){
        if(dateRepository.findAll().isEmpty()) {
            for(Date date : dateService.setDays()) {
                dateRepository.save(date);
            }
        }

        model.addAttribute("barbershops",barbershopRepository.findAll());
        return "homepage";
    }

    @GetMapping("/access-denied")
    public String accessDenied(){
        return "access-denied";
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

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String loginPage() {
        return "login";
    }

    @RequestMapping(value="/logout", method = RequestMethod.GET)
    public String logoutPage (HttpServletRequest request, HttpServletResponse response) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null){
            new SecurityContextLogoutHandler().logout(request, response, auth);
        }
        return "redirect:/login?logout";
    }



}
