package pl.barbershop.converter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import pl.barbershop.model.Date;
import pl.barbershop.repository.DateRepository;


public class DateConverter implements Converter<String, Date> {

    @Autowired
    DateRepository dateRepository;

    @Override
    public Date convert(String s) {
        return dateRepository.getOne(Long.parseLong(s));
    }
}
