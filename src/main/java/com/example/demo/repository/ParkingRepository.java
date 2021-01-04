package com.example.demo.repository;

import com.example.demo.domain.Parking;
import com.example.demo.domain.dto.ParkingDTO;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.Optional;


@Repository
public interface ParkingRepository extends JpaRepository<Parking, Long> {
  @Query("SELECT parking FROM Parking AS parking WHERE parking.id = :id")
  Optional<Parking> getParkingById(@Param("id") Long id);

  @Query("SELECT NEW com.example.demo.domain.dto.ParkingDTO(" +
           "parking.id, parking.number, parking.total, parking.cost, " +
           "parking.latitude, parking.longtitude, parking.address, (" +
           "SELECT COUNT(*) " +
           "FROM Booking AS booking " +
           "WHERE booking.parking.id = parking.id AND " +
             "booking.payment IS FALSE)) " +
         "FROM Parking AS parking " +
         "WHERE parking.id = :id")
  Optional<ParkingDTO> getParkingStatus(@Param("id") Long id);
}
