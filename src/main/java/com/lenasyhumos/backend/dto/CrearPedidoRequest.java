
package com.lenasyhumos.backend.dto;

import java.util.List;

public class CrearPedidoRequest {

    private String claveIdempotencia;
    private String nombreCliente;
    private String telefonoCliente;
    private String tipoEntrega;
    private Long zonaDeliveryId;
    private String direccion;
    private String referenciaDireccion;
    private String observaciones;
    private List<ItemPedidoRequest> productos;

    public CrearPedidoRequest() {
    }

    public String getClaveIdempotencia() {
        return claveIdempotencia;
    }

    public void setClaveIdempotencia(String claveIdempotencia) {
        this.claveIdempotencia = claveIdempotencia;
    }

    public String getNombreCliente() {
        return nombreCliente;
    }

    public void setNombreCliente(String nombreCliente) {
        this.nombreCliente = nombreCliente;
    }

    public String getTelefonoCliente() {
        return telefonoCliente;
    }

    public void setTelefonoCliente(String telefonoCliente) {
        this.telefonoCliente = telefonoCliente;
    }

    public String getTipoEntrega() {
        return tipoEntrega;
    }

    public void setTipoEntrega(String tipoEntrega) {
        this.tipoEntrega = tipoEntrega;
    }

    public Long getZonaDeliveryId() {
        return zonaDeliveryId;
    }

    public void setZonaDeliveryId(Long zonaDeliveryId) {
        this.zonaDeliveryId = zonaDeliveryId;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getReferenciaDireccion() {
        return referenciaDireccion;
    }

    public void setReferenciaDireccion(String referenciaDireccion) {
        this.referenciaDireccion = referenciaDireccion;
    }

    public String getObservaciones() {
        return observaciones;
    }

    public void setObservaciones(String observaciones) {
        this.observaciones = observaciones;
    }

    public List<ItemPedidoRequest> getProductos() {
        return productos;
    }

    public void setProductos(List<ItemPedidoRequest> productos) {
        this.productos = productos;
    }

    public static class ItemPedidoRequest {

        private Long productoId;
        private Integer cantidad;

        public ItemPedidoRequest() {
        }

        public Long getProductoId() {
            return productoId;
        }

        public void setProductoId(Long productoId) {
            this.productoId = productoId;
        }

        public Integer getCantidad() {
            return cantidad;
        }

        public void setCantidad(Integer cantidad) {
            this.cantidad = cantidad;
        }
    }
}

