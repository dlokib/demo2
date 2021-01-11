package com.example.demo.web.dto;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;


@Data
@NoArgsConstructor
@AllArgsConstructor
public class BookingNewDTO {
    private Long parkingId;

    private Long vehicleId;

    private Long duration;
}
