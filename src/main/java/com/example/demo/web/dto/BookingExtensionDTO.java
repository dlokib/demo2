package com.example.demo.web.dto;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;


@Data
@NoArgsConstructor
@AllArgsConstructor
public class BookingExtensionDTO {
    private Long bookingId;

    private Long duration;
}
