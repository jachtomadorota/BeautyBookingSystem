package pl.barbershop.service;

import org.springframework.stereotype.Service;
import pl.barbershop.model.Barbershop;
import pl.barbershop.model.Date;
import pl.barbershop.model.Slot;
import pl.barbershop.repository.DateRepository;
import pl.barbershop.repository.SlotRepository;

import javax.swing.text.DateFormatter;
import javax.transaction.Transactional;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

@Service
public class DateServiceImpl implements DateService{

    private final DateRepository dateRepository;

    public DateServiceImpl(DateRepository dateRepository) {
        this.dateRepository = dateRepository;
    }


    @Override
    public List<Date> setDays() {
        List<Date> dates = new ArrayList<>();
        LocalDate localDate = LocalDate.now();

       for(int i = localDate.getDayOfYear(); i < 355; i++) {
           Date date = new Date();
           DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("MM/d/uuuu");
           date.setDay(LocalDate.ofYearDay(2019,i).format(dateTimeFormatter).toString());
           dates.add(date);
       }
       return dates;
    }
}
