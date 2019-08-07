package pl.barbershop.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.barbershop.repository.BarbershopRepository;
import pl.barbershop.repository.DateRepository;
import pl.barbershop.service.DateServiceImpl;

import java.time.*;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/user/login/panel/barbershop/termins")

public class DateController {

    private final DateRepository dateRepository;
    private final DateServiceImpl dateService;
    private final BarbershopRepository barbershopRepository;

    public DateController(DateRepository dateRepository, DateServiceImpl dateService, BarbershopRepository barbershopRepository) {
        this.dateRepository = dateRepository;
        this.dateService = dateService;
        this.barbershopRepository = barbershopRepository;
    }

    @RequestMapping("/")
    public String setCalendar(Model model){

        return "calendar";
    }


}
