package pl.barbershop.controller;

import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
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
    private final PasswordEncoder passwordEncoder;

    public UserController(UserRepository userRepository, UserRoleRepository userRoleRepository, PasswordEncoder passwordEncoder) {
        this.userRepository = userRepository;
        this.userRoleRepository = userRoleRepository;
        this.passwordEncoder = passwordEncoder;
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
        userRole.setRole("ROLE_USER");
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        userRepository.save(user);
        userRoleRepository.save(userRole);
        return "redirect:/";
    }

    @GetMapping("/login/panel")
    public String login() {
        return "redirect:/";
    }

    @ResponseBody
    @GetMapping("/login/panel/hello")
    public String hello (){
        return "Hello user!!!";
    }



}
