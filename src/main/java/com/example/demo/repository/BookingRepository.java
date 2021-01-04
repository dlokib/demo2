package com.example.demo.repository;

import com.example.demo.domain.Booking;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.scheduling.annotation.Async;
import org.springframework.transaction.annotation.Transactional;

import java.util.Optional;


@Repository
public interface BookingRepository extends JpaRepository<Booking, Long> {
  @Query("SELECT booking FROM Booking AS booking WHERE booking.id = :id")
  Optional<Booking> getBookingById(@Param("id") Long id);

  @Query(value = "SELECT nextval('booking_id_seq')", nativeQuery = true)
  Long getNextId();

  @Async
  @Override
  <S extends Booking> S save(S booking);
}
