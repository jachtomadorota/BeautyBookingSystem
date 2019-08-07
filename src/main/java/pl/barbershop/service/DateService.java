package pl.barbershop.service;

import pl.barbershop.model.Barbershop;

import java.time.LocalDateTime;
import java.time.LocalTime;

public interface DateService {

    void setCalendar(LocalDateTime now);

}
