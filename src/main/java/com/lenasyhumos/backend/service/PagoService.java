
package com.lenasyhumos.backend.service;

import java.time.LocalDateTime;
import java.util.Locale;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lenasyhumos.backend.entity.Pago;
import com.lenasyhumos.backend.entity.Pedido;
import com.lenasyhumos.backend.repository.PagoRepository;
import com.lenasyhumos.backend.repository.PedidoRepository;

@Service
public class PagoService {

    private final PagoRepository pagoRepository;
    private final PedidoRepository pedidoRepository;

    public PagoService(
            PagoRepository pagoRepository,
            PedidoRepository pedidoRepository) {
        this.pagoRepository = pagoRepository;
        this.pedidoRepository = pedidoRepository;
    }

    @Transactional
    public Pago registrarPago(
            Long pedidoId,
            String metodo,
            String referenciaOperacion) {

        if (pedidoId == null) {
            throw new IllegalArgumentException(
                    "El ID del pedido es obligatorio.");
        }

        Pedido pedido = pedidoRepository.findById(pedidoId)
                .orElseThrow(() -> new IllegalArgumentException(
                        "El pedido no existe."));

        if (pagoRepository.findByPedidoId(pedidoId).isPresent()) {
            throw new IllegalArgumentException(
                    "Este pedido ya tiene un pago registrado.");
        }

        if (!"PENDIENTE".equalsIgnoreCase(pedido.getEstado())) {
            throw new IllegalArgumentException(
                    "Solo se pueden registrar pagos para pedidos pendientes.");
        }

        if (metodo == null || metodo.isBlank()) {
            throw new IllegalArgumentException(
                    "El método de pago es obligatorio.");
        }

        String metodoNormalizado =
                metodo.trim().toUpperCase(Locale.ROOT);

        if (!metodoNormalizado.equals("YAPE")
                && !metodoNormalizado.equals("PLIN")
                && !metodoNormalizado.equals("EFECTIVO")
                && !metodoNormalizado.equals("TRANSFERENCIA")) {
            throw new IllegalArgumentException(
                    "Método no válido. Usa YAPE, PLIN, EFECTIVO o TRANSFERENCIA.");
        }

        Pago pago = new Pago();
        pago.setPedidoId(pedidoId);
        pago.setMetodo(metodoNormalizado);
        pago.setEstado("PENDIENTE");

        if (referenciaOperacion != null
                && !referenciaOperacion.isBlank()) {

            String referencia = referenciaOperacion.trim();

            if (referencia.length() > 150) {
                throw new IllegalArgumentException(
                        "La referencia no puede superar 150 caracteres.");
            }

            pago.setReferenciaOperacion(referencia);
        }

        return pagoRepository.save(pago);
    }

    @Transactional
    public Pago verificarPago(
            Long pagoId,
            Long administradorId,
            String observacion) {

        if (pagoId == null) {
            throw new IllegalArgumentException(
                    "El ID del pago es obligatorio.");
        }

        if (administradorId == null) {
            throw new IllegalArgumentException(
                    "El ID del administrador es obligatorio.");
        }

        Pago pago = pagoRepository.findById(pagoId)
                .orElseThrow(() -> new IllegalArgumentException(
                        "El pago no existe."));

        if (!"PENDIENTE".equalsIgnoreCase(pago.getEstado())) {
            throw new IllegalArgumentException(
                    "El pago ya fue procesado.");
        }

        if (observacion != null && observacion.length() > 500) {
            throw new IllegalArgumentException(
                    "La observación no puede superar 500 caracteres.");
        }

        Pedido pedido = pedidoRepository.findById(pago.getPedidoId())
                .orElseThrow(() -> new IllegalArgumentException(
                        "El pedido asociado no existe."));

        if (!"PENDIENTE".equalsIgnoreCase(pedido.getEstado())) {
            throw new IllegalArgumentException(
                    "El pedido ya no está pendiente.");
        }

        pago.setEstado("VERIFICADO");
        pago.setVerificadoPor(administradorId);
        pago.setVerificadoEn(LocalDateTime.now());
        pago.setObservacionVerificacion(observacion);

        pedido.setEstado("CONFIRMADO");

        pagoRepository.save(pago);
        pedidoRepository.save(pedido);

        return pago;
    }
    @Transactional(readOnly = true)
    public Pago buscarPago(Long pagoId) {
        if (pagoId == null) {
            throw new IllegalArgumentException(
                    "El ID del pago es obligatorio.");
        }

        return pagoRepository.findById(pagoId)
                .orElseThrow(() -> new IllegalArgumentException(
                        "El pago no existe."));
    }
}
