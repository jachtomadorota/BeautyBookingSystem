package pl.barbershop.service;


import org.springframework.stereotype.Service;
import pl.barbershop.model.Barbershop;
import pl.barbershop.model.Date;
import pl.barbershop.model.Slot;
import pl.barbershop.repository.BarbershopRepository;
import pl.barbershop.repository.ServiceRepository;
import pl.barbershop.repository.SlotRepository;

import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.List;

@Service
public class SlotServiceImpl implements SlotService {


    @Override
    public List<Slot> setSlot(String open, String close, String duration) {
        int openParsed = Integer.parseInt(open);
        int closeParsed = Integer.parseInt(close);
        int durationParsed = Integer.parseInt(duration);
        List<Slot> slots = new ArrayList<>();
        for(int i = openParsed; i < closeParsed; i = i + (durationParsed/60)){
            Slot slot = new Slot();
            slot.setTime(String.valueOf(i));
            slot.setAvaible(true);
            slots.add(slot);
        }
        return slots;
    }
}
