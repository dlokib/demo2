package com.example.demo.domain;

import org.hibernate.annotations.GenericGenerator;
import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import lombok.Data;


@Data
@Entity
@Table(name = "VEHICLE")
@SequenceGenerator(name = "vehicle_id_seq", sequenceName = "vehicle_id_seq", allocationSize = 1)
public class Vehicle {
  @Id
  @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "vehicle_id_seq")
  private Long id;

  @NotNull
  @Size(max = 32)
  @Column(name = "number")
  private String number;
}
