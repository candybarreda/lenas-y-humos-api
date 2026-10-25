
package com.lenasyhumos.backend.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.lenasyhumos.backend.dto.CrearPedidoRequest;
import com.lenasyhumos.backend.entity.Pedido;
import com.lenasyhumos.backend.service.PedidoService;

@RestController
@RequestMapping("/api/pedidos")
@CrossOrigin(origins = "http://localhost:5173")
public class PedidoController {

    private final PedidoService pedidoService;

    public PedidoController(PedidoService pedidoService) {
        this.pedidoService = pedidoService;
    }

    @PostMapping
    public ResponseEntity<?> crearPedido(
            @RequestBody CrearPedidoRequest request) {

        try {
            Pedido pedido = pedidoService.crearPedido(request);

            return ResponseEntity
                    .status(HttpStatus.CREATED)
                    .body(pedido);

        } catch (IllegalArgumentException e) {

            return ResponseEntity
                    .badRequest()
                    .body(java.util.Map.of(
                            "error", e.getMessage()));
        }
    }
}

