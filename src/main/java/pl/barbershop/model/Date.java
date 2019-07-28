package pl.barbershop.model;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.Set;

@Entity
@Table(name="dates")
public class Date {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private LocalDateTime date;
    @ManyToMany
    Set<Barbershop> barbershops;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public LocalDateTime getDate() {
        return date;
    }

    public void setDate(LocalDateTime date) {
        this.date = date;
    }

    public Set<Barbershop> getBarbershops() {
        return barbershops;
    }

    public void setBarbershops(Set<Barbershop> barbershops) {
        this.barbershops = barbershops;
    }
}
