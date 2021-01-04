package com.example.demo.domain;

import com.example.demo.domain.Parking;
import com.example.demo.domain.Vehicle;

import org.hibernate.annotations.GenericGenerator;
import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import lombok.Data;

import java.util.Date;


@Data
@Entity
@Table(name = "BOOKING")
@SequenceGenerator(name = "booking_id_seq", sequenceName = "booking_id_seq", allocationSize = 1)
public class Booking {
  @Id
  private Long id;

  @ManyToOne
  private Parking parking;

  @ManyToOne
  private Vehicle vehicle;

  @NotNull
  @Column(name = "ts_from")
  private Date ts_from;

  @NotNull
  @Column(name = "ts_till")
  private Date ts_till;

  @NotNull
  @Column(name = "payment")
  private Boolean payment;
}
