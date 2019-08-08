package pl.barbershop.service;

import org.springframework.stereotype.Service;
import pl.barbershop.model.Barbershop;
import pl.barbershop.model.Date;
import pl.barbershop.model.Slot;
import pl.barbershop.repository.SlotRepository;
import java.time.LocalTime;
import java.util.List;

@Service
public class DateServiceImpl implements DateService{

    private final SlotRepository slotRepository;




    public DateServiceImpl(SlotRepository slotRepository) {
        this.slotRepository = slotRepository;
    }

    @Override
    public List<Slot> setSlotsInDate(Date date,pl.barbershop.model.Service service, Barbershop barbershop) {
        List<Slot> slotList = date.getSlots();
        String duration = service.getTime();
        String open = barbershop.getOpen();
        String close = barbershop.getClose();
        for(int i = Integer.parseInt(open); i < Integer.parseInt(close); LocalTime.parse(open).plusMinutes(Long.parseLong(duration))){
            Slot slot = new Slot();
            slot.setTime(String.valueOf(i));
            slot.setDate(date);
            slot.setAvaible(true);
            slotList.add(slot);
            slotRepository.save(slot);
        }
        return  slotList;
    }
}
