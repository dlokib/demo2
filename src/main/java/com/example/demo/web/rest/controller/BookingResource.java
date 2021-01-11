package com.example.demo.web.rest.controller;

import org.springframework.web.bind.annotation.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.core.Ordered;
import org.springframework.core.annotation.Order;

import org.apache.logging.log4j.Logger;
import org.apache.logging.log4j.LogManager;

import com.example.demo.domain.Parking;
import com.example.demo.domain.Vehicle;
import com.example.demo.domain.Booking;

import com.example.demo.domain.dto.ParkingDTO;
import com.example.demo.domain.dto.BookCloseDTO;
import com.example.demo.domain.dto.BookStatusDTO;
import com.example.demo.domain.dto.BookExtensionDTO;

import com.example.demo.web.dto.BookingNewDTO;
import com.example.demo.web.dto.BookingCloseDTO;
import com.example.demo.web.dto.BookingExtensionDTO;

import com.example.demo.repository.ParkingRepository;
import com.example.demo.repository.BookingRepository;
import com.example.demo.repository.VehicleRepository;

import java.util.Date;
import java.util.Optional;

import javax.validation.Valid;


@RestController
@RequestMapping("/api/booking")
public class BookingResource {
  private final Logger log = LogManager.getLogger(BookingResource.class);

  @Autowired
  private ParkingRepository parkingRepository;

  @Autowired
  private BookingRepository bookingRepository;

  @Autowired
  private VehicleRepository vehicleRepository;

  @RequestMapping(value = "new",
                  method = RequestMethod.POST,
                  produces = MediaType.APPLICATION_JSON_VALUE)
  @Order(Ordered.HIGHEST_PRECEDENCE)
  @Transactional
  public ResponseEntity<Long> toBook(@Valid @RequestBody BookingNewDTO body) {
    log.info("New booking");

    Optional<Parking> parking = parkingRepository.getParkingById(body.getParkingId());
    Optional<ParkingDTO> parkingDTO = parkingRepository.getParkingStatus(body.getParkingId());
    Optional<Vehicle> vehicle = vehicleRepository.getVehicleById(body.getVehicleId());

    if(!parking.isPresent()) {
      return new ResponseEntity<>(HttpStatus.NOT_FOUND);
    }

    if(!vehicle.isPresent()) {
      return new ResponseEntity<>(HttpStatus.NOT_FOUND);
    }

    if(parkingDTO.get().getBusy() >= parkingDTO.get().getTotal()) {
      return new ResponseEntity<>(HttpStatus.NOT_FOUND);
    }

    Date currentDate = new Date();

    Booking booking = new Booking();
    booking.setId(bookingRepository.getNextId());
    booking.setParking(parking.get());
    booking.setVehicle(vehicle.get());
    booking.setTs_from(currentDate);
    booking.setTs_till(new Date(currentDate.getTime() + (body.getDuration() * 60000)));
    booking.setPayment(false);

    bookingRepository.save(booking);

    return new ResponseEntity<>(booking.getId(), HttpStatus.OK);
  }

  @RequestMapping(value = "extension",
                  method = RequestMethod.PUT,
                  produces = MediaType.APPLICATION_JSON_VALUE)
  @Order(Ordered.HIGHEST_PRECEDENCE)
  @Transactional
  public ResponseEntity<BookExtensionDTO> toBookExtension(@Valid @RequestBody BookingExtensionDTO body) {
    Optional<Booking> booking = bookingRepository.getBookingById(body.getBookingId());

    if(!booking.isPresent()) {
      return new ResponseEntity<>(HttpStatus.NOT_FOUND);
    }

    return new ResponseEntity<>(bookingExtension(booking.get(), body.getDuration()), HttpStatus.OK);
  }

  @RequestMapping(value = "close",
                  method = RequestMethod.PUT,
                  produces = MediaType.APPLICATION_JSON_VALUE)
  @Order(Ordered.HIGHEST_PRECEDENCE)
  @Transactional
  public ResponseEntity<BookCloseDTO> toBookClose(@Valid @RequestBody BookingCloseDTO body) {
    Optional<Booking> booking = bookingRepository.getBookingById(body.getBookingId());

    if(!booking.isPresent()) {
      return new ResponseEntity<>(HttpStatus.NOT_FOUND);
    }

    return new ResponseEntity<>(bookingClose(booking.get()), HttpStatus.OK);
  }

  @RequestMapping(value = "status/{bookingId}",
                  method = RequestMethod.GET,
                  produces = MediaType.APPLICATION_JSON_VALUE)
  @Transactional
  @Order
  public ResponseEntity<BookStatusDTO> toBookStatus(@PathVariable Long bookingId) {
    Optional<Booking> booking = bookingRepository.getBookingById(bookingId);

    if(!booking.isPresent()) {
      return new ResponseEntity<>(HttpStatus.NOT_FOUND);
    }

    return new ResponseEntity<>(bookingStatus(booking.get()), HttpStatus.OK);
  }

  @Transactional
  public BookExtensionDTO bookingExtension(Booking booking, Long duration) {
    Date lastDate = booking.getTs_till();
    Long lastDuration = (lastDate.getTime() - booking.getTs_from().getTime()) / 60000;

    booking.setTs_till(new Date(lastDate.getTime() + (duration * 60000)));

    bookingRepository.save(booking);

    BookExtensionDTO result = new BookExtensionDTO();
    result.setId(booking.getId());
    result.setLastDuration(lastDuration);
    result.setNewDuration(lastDuration + duration);

    return result;
  }

  @Transactional
  public BookCloseDTO bookingClose(Booking booking) {
    booking.setPayment(true);
    booking.setTs_till(new Date());

    bookingRepository.save(booking);

    BookCloseDTO result = new BookCloseDTO();
    result.setId(booking.getId());
    result.setClose(true);
    result.setPayment(true);

    return result;
  }

  @Transactional
  public BookStatusDTO bookingStatus(Booking booking) {
    Long duration = (booking.getTs_till().getTime() -
                     booking.getTs_from().getTime()) / 60000;

    BookStatusDTO result = new BookStatusDTO();
    result.setParkingId(booking.getParking().getId());
    result.setVehicleId(booking.getVehicle().getId());
    result.setTs_from(booking.getTs_from());
    result.setTs_till(booking.getTs_till());
    result.setCost((long)(Math.ceil((
      duration / 60) + 0.5) * booking.getParking().getCost()));
    result.setPayment(booking.getPayment());

    return result;
  }
}
