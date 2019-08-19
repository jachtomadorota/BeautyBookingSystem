package pl.barbershop.controller;


import org.hibernate.Hibernate;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pl.barbershop.model.*;
import pl.barbershop.repository.*;
import pl.barbershop.service.DateServiceImpl;
import pl.barbershop.service.EmailServiceImpl;
import pl.barbershop.service.SlotServiceImpl;

import java.text.ParseException;
import java.time.Duration;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import static java.util.stream.Collectors.toList;


@Controller
@RequestMapping("/user/login/panel/barbershop/reservation")
public class ReservationController {


    private final ServiceRepository serviceRepository;
    private final BarbershopRepository barbershopRepository;
    private final DateRepository dateRepository;
    private final SlotRepository slotRepository;
    private final DateServiceImpl dateService;
    private final SlotServiceImpl slotService;
    private final UserRepository userRepository;
    private final ReservationRepository reservationRepository;
    private final EmailServiceImpl emailService;


    public ReservationController(ServiceRepository serviceRepository, BarbershopRepository barbershopRepository, DateRepository dateRepository, SlotRepository slotRepository, DateServiceImpl dateService, SlotServiceImpl slotService, UserRepository userRepository, ReservationRepository reservationRepository, EmailServiceImpl emailService) {
        this.serviceRepository = serviceRepository;
        this.barbershopRepository = barbershopRepository;
        this.dateRepository = dateRepository;
        this.slotRepository = slotRepository;
        this.dateService = dateService;
        this.slotService = slotService;
        this.userRepository = userRepository;
        this.reservationRepository = reservationRepository;
        this.emailService = emailService;
    }

    @GetMapping("/{barbershop_id}")
    public String chooseService(Model model, @PathVariable("barbershop_id") Long barbershopId) {
        model.addAttribute("barbershopId", barbershopId);
        Optional<Barbershop> optionalBarbershop = barbershopRepository.findById(barbershopId);
        model.addAttribute("barbershop", optionalBarbershop.get());
        model.addAttribute("service", serviceRepository.findServicesByBarbershopsId(barbershopId));
        return "barbershop-details";
    }

    @GetMapping("/{barbershop_id}/{service_id}")
    public String chooseDateGet(Model model, @PathVariable("barbershop_id") Long barbershopId, @PathVariable("service_id") Long serviceId) {
        Optional<Barbershop> optionalBarbershop = barbershopRepository.findById(barbershopId);
        model.addAttribute("work", optionalBarbershop.get().isWorkInSaturdays());
        return "calendar";
    }

    @PostMapping("/{barbershop_id}/{service_id}")
    public String chooseSlot(Model model, @PathVariable("barbershop_id") Long barbershopId, @PathVariable("service_id") Long serviceId, @RequestParam("date") String date) throws ParseException {

        String parsed = date.replace("%2F", "/");
        Optional<Barbershop> optionalBarbershop = barbershopRepository.findById(barbershopId);
        Optional<Service> optionalService = serviceRepository.findById(serviceId);
        String open = optionalBarbershop.get().getOpen();
        String close = optionalBarbershop.get().getClose();
        String duration = optionalService.get().getTime();
        List<Slot> slots = new ArrayList<>();
        Date finalDate = dateRepository.checkDate(parsed);
        if (finalDate.getSlots().isEmpty()) {
            for (Slot slot : slotService.setSlot(open, close, duration)) {
                slotRepository.save(slot);
                slots.add(slot);
                finalDate.setSlots(slots);
                dateRepository.save(finalDate);
            }
        }else {
            List<Slot> slotList = finalDate.getSlots().stream()
                    .filter(Slot::isAvaible)
                    .collect(toList());
            List<Slot> slotListDisabled = finalDate.getSlots().stream()
                    .filter(s -> !s.isAvaible())
                    .collect(toList());
            String openReplaced = slotList.get(0).getTime();
            String closeReplaced = slotList.get(slotList.size() - 1).getTime();
                for (Slot slot : slotService.updateSlot(openReplaced, close, duration)) {
                    slotRepository.save(slot);
                    slots.add(slot);
                    finalDate.setSlots(slots);
                    dateRepository.save(finalDate);
                }
            }


        model.addAttribute("slots", slotService.checkIsAvaible(slots));


        model.addAttribute("barbershopId", barbershopId);
        model.addAttribute("serviceId", serviceId);
        model.addAttribute("dateId", finalDate.getId());

        return "slots-list";

    }

    @GetMapping("/{barbershop_id}/{service_id}/{dateId}/{slotId}")
    public String chooseSlot(Model model,@PathVariable("barbershop_id") Long barbershopId, @PathVariable("service_id") Long serviceId, @PathVariable("dateId") Long dateId, @PathVariable("slotId") Long slotId) {

        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if (principal instanceof UserDetails) {
            String username = ((UserDetails) principal).getUsername();
            User user = userRepository.findByEmail(username);
            Reservation reservation = new Reservation();

            Optional<Barbershop> optionalBarbershop = barbershopRepository.findById(barbershopId);
            Optional<Service> optionalService = serviceRepository.findById(serviceId);
            Optional<Date> optionalDate = dateRepository.findById(dateId);
            Optional<Slot> optionalSlot = slotRepository.findById(slotId);

            reservation.setSlot(optionalSlot.get());
            reservation.setBarbershop(optionalBarbershop.get());
            reservation.setService(optionalService.get());
            reservation.setDate(optionalDate.get());
            reservation.setUser(user);
            reservationRepository.save(reservation);

            optionalSlot.get().setAvaible(false);
            slotRepository.save(optionalSlot.get());


            List<Reservation> reservations = new ArrayList<>();
            reservations.add(reservation);
            emailService.sendSimpleMessage(user.getEmail(),"Reservation","You made reservation to " + " " + optionalBarbershop.get().getName()
            + " " + ". Barbershop is located on " + optionalBarbershop.get().getAddress() + " " + optionalBarbershop.get().getCity() +
                  " at " + optionalSlot.get().getTime() + " " + optionalDate.get().getDay());
            model.addAttribute("reservation",reservations);
            return "reservation-list";
        }
        model.addAttribute("loged",false);
        return "login";

    }
}