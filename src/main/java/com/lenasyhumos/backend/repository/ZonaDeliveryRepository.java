package com.lenasyhumos.backend.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.lenasyhumos.backend.entity.ZonaDelivery;

public interface ZonaDeliveryRepository
        extends JpaRepository<ZonaDelivery, Long> {

    List<ZonaDelivery> findByHabilitadaTrue();
}