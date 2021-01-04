package com.example.demo.web.rest.controller;

import org.springframework.core.annotation.Order;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;;

import com.example.demo.domain.dto.ParkingDTO;
import com.example.demo.repository.ParkingRepository;

import java.util.Optional;


@RestController
@RequestMapping("/api/parking")
public class ParkingResource {
  @Autowired
  private ParkingRepository parkingRepository;

  @Order
  @RequestMapping(value = "/{id}", method = RequestMethod.GET,
                  produces = MediaType.APPLICATION_JSON_VALUE)
  @Transactional(readOnly = true)
  public ResponseEntity<ParkingDTO> getParkingStatus(@PathVariable Long id) {
    Optional<ParkingDTO> result = parkingRepository.getParkingStatus(id);

    if(result.isPresent()) {
      return new ResponseEntity<>(result.get(), HttpStatus.OK);
    }

    return new ResponseEntity<>(HttpStatus.NOT_FOUND);
  }
}
