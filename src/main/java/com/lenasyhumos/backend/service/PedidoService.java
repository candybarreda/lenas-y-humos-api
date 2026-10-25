
package com.lenasyhumos.backend.service;

import java.math.BigDecimal;
import java.util.UUID;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lenasyhumos.backend.dto.CrearPedidoRequest;
import com.lenasyhumos.backend.dto.CrearPedidoRequest.ItemPedidoRequest;
import com.lenasyhumos.backend.entity.DetallePedido;
import com.lenasyhumos.backend.entity.Pedido;
import com.lenasyhumos.backend.entity.Producto;
import com.lenasyhumos.backend.entity.ZonaDelivery;
import com.lenasyhumos.backend.repository.DetallePedidoRepository;
import com.lenasyhumos.backend.repository.PedidoRepository;
import com.lenasyhumos.backend.repository.ProductoRepository;
import com.lenasyhumos.backend.repository.ZonaDeliveryRepository;

@Service
public class PedidoService {

    private final PedidoRepository pedidoRepository;
    private final DetallePedidoRepository detallePedidoRepository;
    private final ProductoRepository productoRepository;
    private final ZonaDeliveryRepository zonaDeliveryRepository;

    public PedidoService(
            PedidoRepository pedidoRepository,
            DetallePedidoRepository detallePedidoRepository,
            ProductoRepository productoRepository,
            ZonaDeliveryRepository zonaDeliveryRepository) {
        this.pedidoRepository = pedidoRepository;
        this.detallePedidoRepository = detallePedidoRepository;
        this.productoRepository = productoRepository;
        this.zonaDeliveryRepository = zonaDeliveryRepository;
    }

    @Transactional
    public Pedido crearPedido(CrearPedidoRequest request) {

        if (request == null) {
            throw new IllegalArgumentException(
                    "La solicitud del pedido es obligatoria.");
        }

        validarTexto(request.getNombreCliente(), "El nombre del cliente");
        validarTexto(request.getTelefonoCliente(), "El teléfono del cliente");

        if (request.getProductos() == null
                || request.getProductos().isEmpty()) {
            throw new IllegalArgumentException(
                    "El pedido debe contener al menos un producto.");
        }

        String clave = request.getClaveIdempotencia();

        if (clave == null || clave.isBlank() || clave.length() > 100) {
            throw new IllegalArgumentException(
                    "La clave de idempotencia es obligatoria y debe tener máximo 100 caracteres.");
        }

        // Si ya se procesó esta clave, no volvemos a crear el pedido.
        var pedidoExistente =
                pedidoRepository.findByClaveIdempotencia(clave);

        if (pedidoExistente.isPresent()) {
            return pedidoExistente.get();
        }

        String tipoEntrega = request.getTipoEntrega();

        if (tipoEntrega == null) {
            throw new IllegalArgumentException(
                    "Debes seleccionar un tipo de entrega.");
        }

        tipoEntrega = tipoEntrega.trim().toUpperCase();

        BigDecimal tarifaDelivery = BigDecimal.ZERO;
        Long zonaId = null;
        String nombreZona = null;

        if ("DELIVERY".equals(tipoEntrega)) {

            if (request.getZonaDeliveryId() == null) {
                throw new IllegalArgumentException(
                        "Debes seleccionar una zona de delivery.");
            }

            ZonaDelivery zona = zonaDeliveryRepository
                    .findById(request.getZonaDeliveryId())
                    .orElseThrow(() -> new IllegalArgumentException(
                            "La zona de delivery no existe."));

            if (!zona.isHabilitada()) {
                throw new IllegalArgumentException(
                        "La zona seleccionada no está habilitada.");
            }

            validarTexto(request.getDireccion(), "La dirección");

            zonaId = zona.getId();
            nombreZona = zona.getNombre();
            tarifaDelivery = zona.getTarifa();

        } else if (!"RECOJO".equals(tipoEntrega)) {

            throw new IllegalArgumentException(
                    "El tipo de entrega debe ser DELIVERY o RECOJO.");
        }

        BigDecimal subtotal = BigDecimal.ZERO;

        Pedido pedido = new Pedido();

        pedido.setNumeroPedido(
                "LH-" + UUID.randomUUID().toString()
                        .replace("-", "").substring(0, 20).toUpperCase());

        pedido.setClaveIdempotencia(clave);
        pedido.setNombreCliente(request.getNombreCliente().trim());
        pedido.setTelefonoCliente(request.getTelefonoCliente().trim());
        pedido.setTipoEntrega(tipoEntrega);
        pedido.setZonaDeliveryId(zonaId);
        pedido.setNombreZona(nombreZona);

        pedido.setDireccion(
                "DELIVERY".equals(tipoEntrega)
                        ? request.getDireccion().trim()
                        : null);

        pedido.setReferenciaDireccion(
                "DELIVERY".equals(tipoEntrega)
                        ? request.getReferenciaDireccion()
                        : null);

        pedido.setObservaciones(request.getObservaciones());
        pedido.setTarifaDelivery(tarifaDelivery);
        pedido.setDescuento(BigDecimal.ZERO);
        pedido.setEstado("PENDIENTE");

        // Validar productos y calcular los importes usando MySQL.
        for (ItemPedidoRequest item : request.getProductos()) {

            if (item == null || item.getProductoId() == null) {
                throw new IllegalArgumentException(
                        "Cada artículo debe tener un ID de producto.");
            }

            if (item.getCantidad() == null
                    || item.getCantidad() <= 0) {
                throw new IllegalArgumentException(
                        "La cantidad de cada producto debe ser mayor que cero.");
            }

            Producto producto = productoRepository
                    .findById(item.getProductoId())
                    .orElseThrow(() -> new IllegalArgumentException(
                            "No existe el producto con ID "
                                    + item.getProductoId() + "."));

            if (!producto.isDisponible()) {
                throw new IllegalArgumentException(
                        "El producto " + producto.getNombre()
                                + " no está disponible.");
            }

            BigDecimal precio = producto.getPrecio();

            BigDecimal subtotalLinea = precio.multiply(
                    BigDecimal.valueOf(item.getCantidad()));

            subtotal = subtotal.add(subtotalLinea);
        }

        pedido.setSubtotal(subtotal);

        BigDecimal total = subtotal
                .add(tarifaDelivery)
                .subtract(BigDecimal.ZERO);

        pedido.setTotal(total);

        // Primero guardamos el pedido para obtener su ID.
        Pedido pedidoGuardado = pedidoRepository.saveAndFlush(pedido);

        // Después guardamos cada detalle con el precio actual de MySQL.
        for (ItemPedidoRequest item : request.getProductos()) {

            Producto producto = productoRepository
                    .findById(item.getProductoId())
                    .orElseThrow(() -> new IllegalArgumentException(
                            "El producto ya no existe."));

            DetallePedido detalle = new DetallePedido();

            detalle.setPedidoId(pedidoGuardado.getId());
            detalle.setProductoFirebaseId(
                    String.valueOf(producto.getId()));
            detalle.setNombreProducto(producto.getNombre());
            detalle.setPrecioUnitario(producto.getPrecio());
            detalle.setCantidad(item.getCantidad());

            detallePedidoRepository.save(detalle);
        }

        return pedidoGuardado;
    }

    private void validarTexto(String valor, String campo) {
        if (valor == null || valor.isBlank()) {
            throw new IllegalArgumentException(
                    campo + " es obligatorio.");
        }
    }
}

