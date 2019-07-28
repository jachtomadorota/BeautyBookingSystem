package pl.barbershop.controller;


import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.barbershop.model.Barbershop;
import pl.barbershop.model.UserRole;
import pl.barbershop.repository.BarbershopRepository;
import pl.barbershop.repository.UserRoleRepository;

import javax.validation.Valid;
import java.time.LocalTime;

@Controller
@RequestMapping("/barbershop")
public class BarbershopController {

    private final BarbershopRepository barbershopRepository;
    private final UserRoleRepository userRoleRepository;


    public BarbershopController(BarbershopRepository barbershopRepository, UserRoleRepository userRoleRepository) {
        this.barbershopRepository = barbershopRepository;
        this.userRoleRepository = userRoleRepository;
    }

    @GetMapping("/registration")
    public String registrationBarbershopGet(Model model){
        model.addAttribute("barbershop",new Barbershop());
        return "registration-barbershop";
    }

    @PostMapping("/registration")
    public String registrationBarbershopPost(@Valid Barbershop barbershop, BindingResult bindingResult){
        if(bindingResult.hasErrors()){
            return "registration-barbershop";
        }
        barbershop.setPassword(BCrypt.hashpw(barbershop.getPassword(),BCrypt.gensalt()));
        UserRole userRole = new UserRole();
        userRole.setUsername(barbershop.getNip());
        userRole.setRole("ROLE_BARBERSHOP");
        userRoleRepository.save(userRole);
        barbershopRepository.save(barbershop);
        return "redirect:/homepage";
    }

    @PostMapping("/login")
    public String login(@ModelAttribute @Valid Barbershop barbershop, BindingResult result) {
        if (result.hasErrors()) {
            return "login-barbershop";
        }
        Barbershop barbershopDb = barbershopRepository.findByNip(barbershop.getNip());
        boolean logged = barbershopDb != null && BCrypt.checkpw(barbershop.getPassword(), barbershopDb.getPassword());
        if (!logged) {
            return "login-barbershop";
        }
        return "redirect:/homepage";
    }



}
