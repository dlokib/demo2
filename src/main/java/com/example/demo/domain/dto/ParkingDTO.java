package com.example.demo.domain.dto;

import org.hibernate.annotations.GenericGenerator;
import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;


@Data
@NoArgsConstructor
@AllArgsConstructor
public class ParkingDTO {
  private Long id;

  private Integer number;

  private Integer total;

  private Double cost;

  private Double latitude;

  private Double longtitude;

  private String address;

  private Long busy;
}
