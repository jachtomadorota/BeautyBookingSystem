package pl.barbershop.service;


import pl.barbershop.model.Slot;
import java.util.List;

public interface SlotService {

    List<Slot>setSlot(String open, String close, String duration);
}