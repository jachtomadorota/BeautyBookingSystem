package pl.barbershop.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.barbershop.model.Barbershop;
import pl.barbershop.model.Service;
import pl.barbershop.repository.ServiceRepository;
import pl.barbershop.service.BarbershopServiceImpl;
import javax.validation.Valid;

@Controller
@RequestMapping("/barbershop/login/panel/service")
public class ServiceController {

    private final ServiceRepository serviceRepository;
    private final BarbershopServiceImpl barbershopService;

    public ServiceController(ServiceRepository serviceRepository, BarbershopServiceImpl barbershopService) {
        this.serviceRepository = serviceRepository;
        this.barbershopService = barbershopService;
    }

    @GetMapping("/add")
    public String addServiceGet(Model model){
        Service service = new Service();
        Barbershop barbershop = barbershopService.checkIsLoged();
        service.setBarbershop(barbershop);
        model.addAttribute("service",service);
        return "add-service";
    }

    @PostMapping("/add")
    public String addServicePost(@Valid Service service, BindingResult bindingResult){
        if(bindingResult.hasErrors()){
            return "add-service";
        }
        serviceRepository.save(service);
        return "barbershop-panel";
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
        serviceRepository.save(service);
        return "barbershop-panel";
    }






}
