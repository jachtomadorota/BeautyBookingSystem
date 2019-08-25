package pl.barbershop.model;


import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;
import org.hibernate.annotations.Proxy;

import javax.persistence.*;
import java.util.Set;

@Proxy(lazy=false)
@Entity
@Table(name = "reservations")
public class Reservation {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @OnDelete(action = OnDeleteAction.CASCADE)
    @OneToOne(cascade={CascadeType.MERGE,CascadeType.REFRESH, CascadeType.REMOVE})
    private User user;

    @OnDelete(action = OnDeleteAction.CASCADE)
    @OneToOne(cascade={CascadeType.MERGE,CascadeType.REFRESH,CascadeType.REMOVE})
    private Barbershop barbershop;

    @OnDelete(action = OnDeleteAction.CASCADE)
    @OneToOne(cascade={CascadeType.MERGE,CascadeType.REFRESH,CascadeType.REMOVE})
    private Date date;

    @OnDelete(action = OnDeleteAction.CASCADE)
    @OneToOne(cascade={CascadeType.MERGE,CascadeType.REFRESH,CascadeType.REMOVE})
    private Service service;

    @OneToOne(cascade={CascadeType.MERGE,CascadeType.REFRESH,CascadeType.REMOVE})
    @OnDelete(action = OnDeleteAction.CASCADE)
    private Slot slot;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Barbershop getBarbershop() {
        return barbershop;
    }

    public void setBarbershop(Barbershop barbershop) {
        this.barbershop = barbershop;
    }


    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Service getService() {
        return service;
    }

    public void setService(Service service) {
        this.service = service;
    }

    public Slot getSlot() {
        return slot;
    }

    public void setSlot(Slot slot) {
        this.slot = slot;
    }
}
