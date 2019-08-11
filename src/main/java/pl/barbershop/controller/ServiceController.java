package pl.barbershop.controller;


import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.barbershop.model.Barbershop;
import pl.barbershop.model.Date;
import pl.barbershop.model.Service;
import pl.barbershop.repository.BarbershopRepository;
import pl.barbershop.repository.DateRepository;
import pl.barbershop.repository.ServiceRepository;
import pl.barbershop.service.DateServiceImpl;

import javax.validation.Valid;

@Controller
@RequestMapping("/barbershop/login/panel/service")
public class ServiceController {

    private final ServiceRepository serviceRepository;
    private final BarbershopRepository barbershopRepository;

    public ServiceController(ServiceRepository serviceRepository, BarbershopRepository barbershopRepository) {
        this.serviceRepository = serviceRepository;
        this.barbershopRepository = barbershopRepository;
    }

    @GetMapping("/add")
    public String addServiceGet(Model model){
        model.addAttribute("service", new Service());
        return "add-service";

    }

    @PostMapping("/add")
    public String addServicePost(@Valid Service service, BindingResult bindingResult){
        if(bindingResult.hasErrors()){
            return "add-service";
        }
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if (principal instanceof UserDetails) {
            String username = ((UserDetails) principal).getUsername();
            Barbershop barbershop = barbershopRepository.findByEmail(username);
            serviceRepository.save(service);
            barbershop.getServices().add(service);
            service.setBarbershop(barbershop);
            barbershopRepository.save(barbershop);
            serviceRepository.save(service);
        }

        return "redirect:/barbershop/login/panel/services";
    }

    @GetMapping("/delete/{id}")
    public String deleteService(@PathVariable Long id){
        serviceRepository.deleteById(id);
        return "barbershop-panel";
    }

    @GetMapping("/update/{id}")
    public String updateServiceGet(@PathVariable Long id, Model model){
        model.addAttribute("service",serviceRepository.findById(id));
        return "add-service";
    }

    @PostMapping("/update/{id}")
    public String updateServicePost(@PathVariable Long id, @Valid Service service, BindingResult bindingResult){
        if(bindingResult.hasErrors()){
            return "add-service";
        }
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if (principal instanceof UserDetails) {
            String username = ((UserDetails) principal).getUsername();
            Barbershop barbershop = barbershopRepository.findByEmail(username);
            service.setBarbershop(barbershop);
            serviceRepository.save(service);
        }
        return "barbershop-panel";
    }






}
