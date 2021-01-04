package com.example.demo.domain;

import org.hibernate.annotations.GenericGenerator;
import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import lombok.Data;


@Data
@Entity
@Table(name = "PARKING")
@SequenceGenerator(name = "parking_id_seq",
  sequenceName = "parking_id_seq", allocationSize = 1)
public class Parking {
  @Id
  @GeneratedValue(strategy = GenerationType.SEQUENCE,
    generator = "parking_id_seq")
  private Long id;

  @NotNull
  @Column(name = "number")
  private Integer number;

  @NotNull
  @Column(name = "total")
  private Integer total;

  @NotNull
  @Column(name = "cost")
  private Double cost;

  @Column(name = "latitude")
  private Double latitude;

  @Column(name = "longtitude")
  private Double longtitude;

  @NotNull
  @Size(max = 255)
  @Column(name = "address")
  private String address;
}
