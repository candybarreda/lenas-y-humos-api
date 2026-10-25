
package com.lenasyhumos.backend.controller;

import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.lenasyhumos.backend.entity.ZonaDelivery;
import com.lenasyhumos.backend.service.ZonaDeliveryService;


@RestController
@RequestMapping("/api/zonas-delivery")
@CrossOrigin(origins = "*")
public class ZonaDeliveryController {

    private final ZonaDeliveryService zonaDeliveryService;

    public ZonaDeliveryController(
            ZonaDeliveryService zonaDeliveryService) {
        this.zonaDeliveryService = zonaDeliveryService;
    }

    @GetMapping
    public ResponseEntity<List<ZonaDelivery>> listarZonasHabilitadas() {
        return ResponseEntity.ok(
                zonaDeliveryService.listarZonasHabilitadas()
        );
    }
}
