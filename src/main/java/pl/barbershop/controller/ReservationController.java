package pl.barbershop.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.barbershop.model.Date;
import pl.barbershop.repository.*;
import pl.barbershop.service.DateServiceImpl;



@Controller
@RequestMapping("/user/login/panel/barbershop/reservation")
public class ReservationController {


    private final ServiceRepository serviceRepository;
    private final BarbershopRepository barbershopRepository;
    private final DateRepository dateRepository;
    private final SlotRepository slotRepository;
    private final DateServiceImpl dateService;

    public ReservationController(ServiceRepository serviceRepository, BarbershopRepository barbershopRepository, DateRepository dateRepository, SlotRepository slotRepository, DateServiceImpl dateService) {
        this.serviceRepository = serviceRepository;
        this.barbershopRepository = barbershopRepository;
        this.dateRepository = dateRepository;
        this.slotRepository = slotRepository;
        this.dateService = dateService;
    }

    @GetMapping("/{barbershop_id}")
    public String chooseService(Model model, @PathVariable("barbershop_id") Long barbershopId) {
        model.addAttribute("barbershopId", barbershopId);
        model.addAttribute("service", serviceRepository.findServicesByBarbershopsId(barbershopId));
        return "service-user-list";
    }

    @GetMapping("/{barbershop_id}/{service_id}")
    public String chooseDate(Model model, @PathVariable("barbershop_id") Long barbershopId, @PathVariable("service_id") Long serviceId) {
        model.addAttribute("barbershopId", barbershopId);
        model.addAttribute("service", serviceId);
        return "calendar";
    }


    @PostMapping("/{barbershop_id}/{service_id}")
    public String chooseSlot(Model model, @PathVariable("barbershop_id") Long barbershopId, @PathVariable("service_id") Long serviceId, @RequestParam String date) {
        Date result = new Date();
        result.setDate(date);
        result.setAvaible(true);
        result.setBarbershop(barbershopRepository.getOne(barbershopId));
        model.addAttribute("slots",dateService.setSlotsInDate(result,serviceRepository.getOne(serviceId), barbershopRepository.getOne(barbershopId)));
        return "slots-list";
    }




}
