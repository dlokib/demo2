package com.example.demo.domain.dto;

import org.hibernate.annotations.GenericGenerator;
import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;

import java.util.Date;


@Data
@NoArgsConstructor
@AllArgsConstructor
public class BookStatusDTO {
  private Long parkingId;

  private Long vehicleId;

  private Date ts_from;

  private Date ts_till;

  private Long cost;

  private Boolean payment;
}
