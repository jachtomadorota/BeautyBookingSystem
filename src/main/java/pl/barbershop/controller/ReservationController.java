package pl.barbershop.controller;


import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import pl.barbershop.model.Barbershop;
import pl.barbershop.model.Reservation;
import pl.barbershop.repository.BarbershopRepository;
import pl.barbershop.repository.ReservationRepository;

import java.util.Optional;

@Controller
public class ReservationController {

    private final ReservationRepository reservationRepository;
    private final BarbershopRepository barbershopRepository;


    public ReservationController(ReservationRepository reservationRepository, BarbershopRepository barbershopRepository) {
        this.reservationRepository = reservationRepository;
        this.barbershopRepository = barbershopRepository;
    }

    @GetMapping("user/login/panel/barbershop/reservation/{id}")
    public String getRegestration(@PathVariable Long id, Model model){
        Reservation reservation = new Reservation();
        Optional<Barbershop> optional = barbershopRepository.findById(id);
        reservation.setBarbershop(optional.get());
        model.addAttribute("reservation",reservation);
        return "add-reservation";
    }

}
