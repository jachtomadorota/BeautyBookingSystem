package pl.barbershop.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import pl.barbershop.repository.UserRepository;

@Controller
public class HomePageController {

    private final UserRepository userRepository;


    public HomePageController(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @GetMapping("/homepage")
    public String homepage(){
        return "homepage";
    }


}
