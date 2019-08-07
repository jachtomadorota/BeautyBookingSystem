package pl.barbershop.service;


import org.springframework.stereotype.Service;
import java.time.LocalDateTime;
import java.time.Month;


@Service
public class DateServiceImpl implements DateService{


    @Override
    public void setCalendar(LocalDateTime now) {
        now = LocalDateTime.now();
        Month month = now.getMonth();

        }

}
