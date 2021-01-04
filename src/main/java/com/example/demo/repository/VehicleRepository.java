package com.example.demo.repository;

import com.example.demo.domain.Vehicle;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.Optional;


@Repository
public interface VehicleRepository extends JpaRepository<Vehicle, Long> {
  @Query("SELECT vehicle FROM Vehicle AS vehicle WHERE vehicle.id = :id")
  Optional<Vehicle> getVehicleById(@Param("id") Long id);
}
