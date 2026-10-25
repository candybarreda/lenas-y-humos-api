
package com.lenasyhumos.backend.controller;

import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.lenasyhumos.backend.entity.Pago;
import com.lenasyhumos.backend.service.PagoService;

@RestController
@RequestMapping("/api/pagos")
@CrossOrigin(origins = "http://localhost:5173")
public class PagoController {

    private final PagoService pagoService;

    public PagoController(PagoService pagoService) {
        this.pagoService = pagoService;
    }

    @PostMapping
    public ResponseEntity<?> registrarPago(
            @RequestBody RegistrarPagoRequest request) {
        try {
            Pago pago = pagoService.registrarPago(
                    request.getPedidoId(),
                    request.getMetodo(),
                    request.getReferenciaOperacion());

            return ResponseEntity.status(HttpStatus.CREATED).body(pago);

        } catch (IllegalArgumentException e) {
            return ResponseEntity.badRequest()
                    .body(Map.of("error", e.getMessage()));
        }
    }

    @PostMapping("/{pagoId}/verificar")
    public ResponseEntity<?> verificarPago(
            @PathVariable Long pagoId,
            @RequestBody VerificarPagoRequest request) {
        try {
            Pago pago = pagoService.verificarPago(
                    pagoId,
                    request.getAdministradorId(),
                    request.getObservacion());

            return ResponseEntity.ok(pago);

        } catch (IllegalArgumentException e) {
            return ResponseEntity.badRequest()
                    .body(Map.of("error", e.getMessage()));
        }
    }

    @GetMapping("/{pagoId}")
    public ResponseEntity<?> obtenerPago(@PathVariable Long pagoId) {
        try {
            Pago pago = pagoService.buscarPago(pagoId);
            return ResponseEntity.ok(pago);

        } catch (IllegalArgumentException e) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND)
                    .body(Map.of("error", e.getMessage()));
        }
    }

    public static class RegistrarPagoRequest {
        private Long pedidoId;
        private String metodo;
        private String referenciaOperacion;

        public RegistrarPagoRequest() {}

        public Long getPedidoId() { return pedidoId; }
        public void setPedidoId(Long pedidoId) { this.pedidoId = pedidoId; }

        public String getMetodo() { return metodo; }
        public void setMetodo(String metodo) { this.metodo = metodo; }

        public String getReferenciaOperacion() {
            return referenciaOperacion;
        }
        public void setReferenciaOperacion(String referenciaOperacion) {
            this.referenciaOperacion = referenciaOperacion;
        }
    }

    public static class VerificarPagoRequest {
        private Long administradorId;
        private String observacion;

        public VerificarPagoRequest() {}

        public Long getAdministradorId() { return administradorId; }
        public void setAdministradorId(Long administradorId) {
            this.administradorId = administradorId;
        }

        public String getObservacion() { return observacion; }
        public void setObservacion(String observacion) {
            this.observacion = observacion;
        }
    }
}
