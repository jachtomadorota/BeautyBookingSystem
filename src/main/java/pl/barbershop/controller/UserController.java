package pl.barbershop.controller;

import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.barbershop.model.User;
import pl.barbershop.model.UserRole;
import pl.barbershop.repository.UserRepository;
import pl.barbershop.repository.UserRoleRepository;

import javax.validation.Valid;

@Controller
@RequestMapping("/user")
public class UserController {

    private final UserRepository userRepository;
    private final UserRoleRepository userRoleRepository;

    public UserController(UserRepository userRepository, UserRoleRepository userRoleRepository) {
        this.userRepository = userRepository;
        this.userRoleRepository = userRoleRepository;
    }

    @GetMapping("/registration")
    public String registrationUserGet(Model model){
        model.addAttribute("user",new User());
        return "registration-user";
    }

    @PostMapping("/registration")
    public String registrationUserPost(@Valid User user, BindingResult bindingResult){
        if(bindingResult.hasErrors()){
            return "registration-user";
        }
        UserRole userRole = new UserRole();
        userRole.setUsername(user.getEmail());
        userRole.setRole("USER");
        userRepository.save(user);
        userRoleRepository.save(userRole);
        user.setPassword(BCrypt.hashpw(user.getPassword(),BCrypt.gensalt()));
        return "redirect:/homepage";
    }

    @GetMapping("/login")
    public String loginUserGet(Model model){
        return "login-user";
    }

    @PostMapping("/login")
    public String loginUserPost(){
        return "redirect:/homepage";
    }
}
