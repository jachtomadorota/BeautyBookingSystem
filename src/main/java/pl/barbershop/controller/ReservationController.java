package pl.barbershop.controller;


import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.*;
import pl.barbershop.repository.BarbershopRepository;
import pl.barbershop.repository.ReservationRepository;
import pl.barbershop.repository.ServiceRepository;

@Controller
@RequestMapping("/user/login/panel/barbershop/reservation")
public class ReservationController {

    private final ReservationRepository reservationRepository;
    private final BarbershopRepository barbershopRepository;
    private final ServiceRepository serviceRepository;


    public ReservationController(ReservationRepository reservationRepository, BarbershopRepository barbershopRepository, ServiceRepository serviceRepository) {
        this.reservationRepository = reservationRepository;
        this.barbershopRepository = barbershopRepository;
        this.serviceRepository = serviceRepository;
    }
}
