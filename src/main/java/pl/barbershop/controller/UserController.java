package pl.barbershop.controller;

import org.springframework.context.ApplicationEventPublisher;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.barbershop.model.Slot;
import pl.barbershop.model.User;
import pl.barbershop.model.UserRole;
import pl.barbershop.repository.ReservationRepository;
import pl.barbershop.repository.SlotRepository;
import pl.barbershop.repository.UserRepository;
import pl.barbershop.repository.UserRoleRepository;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {

    private final UserRepository userRepository;
    private final UserRoleRepository userRoleRepository;
    private final PasswordEncoder passwordEncoder;
    private final ReservationRepository reservationRepository;
    private final SlotRepository slotRepository;


    public UserController(UserRepository userRepository, UserRoleRepository userRoleRepository, PasswordEncoder passwordEncoder, ReservationRepository reservationRepository, SlotRepository slotRepository) {
        this.userRepository = userRepository;
        this.userRoleRepository = userRoleRepository;
        this.passwordEncoder = passwordEncoder;
        this.reservationRepository = reservationRepository;
        this.slotRepository = slotRepository;
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
    public String showPanel(){
        return "user-panel";
    }

    @GetMapping("/login/panel/details")
    public String showDetails(Model model){
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if (principal instanceof UserDetails) {
            String username = ((UserDetails) principal).getUsername();
            List<User> users = new ArrayList<>();
            users.add(userRepository.findByEmail(username));
            model.addAttribute("user",users);
            return "user-details";
        }
        return "redirect:/login";
    }

    @GetMapping("/login/panel/details/delete/{id}")
    public String deleteUser(@PathVariable Long id){
        userRepository.deleteById(id);
        return "redirect:/";
    }

    @GetMapping("/login/panel/details/update/{id}")
    public String updateUserGet(Model model,@PathVariable Long id){
        model.addAttribute("user",userRepository.getOne(id));
        return "registration-user";
    }

    @PostMapping("/login/panel/details/update/{id}")
    public String updateUserPost(@PathVariable Long id, @Valid User user,BindingResult bindingResult){
        if(bindingResult.hasErrors()){
            return "registration-user";
        }
        userRepository.save(user);
        return "redirect:/user/login/panel/details";
    }

    @GetMapping("/login/panel/reservation")
    public String showReservations(Model model) {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if (principal instanceof UserDetails) {
            String username = ((UserDetails) principal).getUsername();
            User user = userRepository.findByEmail(username);
            model.addAttribute("reservation", reservationRepository.findByUserId(user.getId()));
            return "reservation-list";
        }
        return "redirect:/login";
    }




}
