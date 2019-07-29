package pl.barbershop.model;

import net.bytebuddy.asm.Advice;
import org.hibernate.annotations.ColumnDefault;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.pl.NIP;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.time.LocalTime;
import java.util.Set;

@Entity
@Table(name = "barbershops")
public class Barbershop {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @NotBlank
    private String address;
    
    @NotBlank
    private String city;
    
    @Size(min = 9,max = 9)
    private String phoneNumber;
    
    @OneToMany
    Set<Barber> barbers;
    
    @ManyToMany(mappedBy = "barbershops")
    Set<Service> services;

    @Email
    @NotBlank
    @Column(unique = true)
    private String email;

    @NotBlank
    private String open;
    
    @NotBlank
    private String close;
    
    @ManyToMany
    Set<Date> dates;
    
    @NotBlank
    @Size(min = 100,max = 450)
    private String description;
    
    @OneToOne
    private Reservation reservation;
    
    @NotBlank
    private String password;
    
    @NIP
    @NotBlank
    @Column(unique = true)
    private String nip;

    @NotNull
    private boolean enabled = true;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public Set<Barber> getBarbers() {
        return barbers;
    }

    public void setBarbers(Set<Barber> barbers) {
        this.barbers = barbers;
    }

    public Set<Service> getServices() {
        return services;
    }

    public void setServices(Set<Service> services) {
        this.services = services;
    }

    public String getOpen() {
        return open;
    }

    public void setOpen(String open) {
        this.open = open;
    }

    public String getClose() {
        return close;
    }

    public void setClose(String close) {
        this.close = close;
    }

    public Set<Date> getDates() {
        return dates;
    }

    public void setDates(Set<Date> dates) {
        this.dates = dates;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Reservation getReservation() {
        return reservation;
    }

    public void setReservation(Reservation reservation) {
        this.reservation = reservation;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getNip() {
        return nip;
    }

    public void setNip(String nip) {
        this.nip = nip;
    }

    public boolean isEnabled() {
        return enabled;
    }

    public void setEnabled(boolean enabled) {
        this.enabled = enabled;
    }


}
