package pl.barbershop.service;


import org.springframework.stereotype.Service;
import pl.barbershop.model.Slot;
import java.time.Duration;
import java.util.ArrayList;
import java.util.List;

@Service
public class SlotServiceImpl implements SlotService {


    @Override
    public List<Slot> setSlot(String open, String close, String duration) {
        double openParsed = Double.parseDouble(open);
        double closeParsed = Double.parseDouble(close);
        double durationParsed = Double.parseDouble(duration);
        List<Slot> slots = new ArrayList<>();
        for (double i = openParsed; i < closeParsed; i = i + (durationParsed / 60)) {
            Slot slot = new Slot();
            double minutes = i * 60;
            Duration result = Duration.ofMinutes((long) minutes);
            String parsedResult = result.toString().replace("PT", "").replace("H", ":").replace("M", "");

            if (Double.parseDouble(parsedResult.replace(":",".")) +  (durationParsed / 60) < closeParsed) {
                slot.setTime(parsedResult);
                slot.setAvaible(true);
                slots.add(slot);
             }
        }

        return slots;
    }

    @Override
    public List<Slot> checkIsAvaible(List<Slot> slots) {
        for(Slot slot : slots){
            if(!slot.isAvaible()){
                slots.remove(slot);
                return slots;
            }
        }
        return slots;
    }
}
