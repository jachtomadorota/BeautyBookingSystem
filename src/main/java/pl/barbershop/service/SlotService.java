package pl.barbershop.service;

import pl.barbershop.model.Slot;

import java.text.ParseException;
import java.util.List;

public interface SlotService {

    List<Slot>setSlot(String open, String close, String duration);

    List<Slot> checkIsAvaible(List<Slot> slots);

    List<Slot> updateSlot(String open, String close, String duration) throws ParseException;

}
