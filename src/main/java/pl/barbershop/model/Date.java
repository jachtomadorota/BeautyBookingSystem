package pl.barbershop.model;

import org.hibernate.annotations.Proxy;
import org.springframework.beans.factory.annotation.Value;

import javax.persistence.*;

import java.util.List;
import java.util.Set;

@Entity
@Table(name="dates")
@Proxy(lazy=false)
public class Date {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String day;
    @OneToMany(cascade = CascadeType.ALL)
    private List<Slot> slots;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getDay() {
        return day;
    }

    public void setDay(String day) {
        this.day = day;
    }

    public List<Slot> getSlots() {
        return slots;
    }

    public void setSlots(List<Slot> slots) {
        this.slots = slots;
    }

    @Override
    public String toString() {
        return "Date{" +
                "id=" + id +
                ", day='" + day;
    }
}
