
package com.lenasyhumos.backend.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.lenasyhumos.backend.entity.ZonaDelivery;
import com.lenasyhumos.backend.repository.ZonaDeliveryRepository;

@Service
public class ZonaDeliveryService {

    private final ZonaDeliveryRepository zonaDeliveryRepository;

    public ZonaDeliveryService(
            ZonaDeliveryRepository zonaDeliveryRepository) {
        this.zonaDeliveryRepository = zonaDeliveryRepository;
    }

    public List<ZonaDelivery> listarZonasHabilitadas() {
        return zonaDeliveryRepository.findByHabilitadaTrue();
    }
}
