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
    private String date;
    @Value("${date.avaible=false}")
    private boolean avaible;
    @ManyToOne
    private Barbershop barbershop;
    @OneToMany
    private List<Slot> slots;





    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public Barbershop getBarbershop() {
        return barbershop;
    }

    public void setBarbershop(Barbershop barbershop) {
        this.barbershop = barbershop;
    }


    public boolean isAvaible() {
        return avaible;
    }

    public void setAvaible(boolean avaible) {
        this.avaible = avaible;
    }

    public List<Slot> getSlots() {
        return slots;
    }

    public void setSlots(List<Slot> slots) {
        this.slots = slots;
    }
}
