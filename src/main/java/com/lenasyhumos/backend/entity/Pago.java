package com.lenasyhumos.backend.entity;

import java.time.LocalDateTime;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "pagos")
public class Pago {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "pedido_id", nullable = false, unique = true)
    private Long pedidoId;

    @Column(name = "metodo", nullable = false, length = 20)
    private String metodo;

    @Column(name = "estado", length = 20)
    private String estado;

    @Column(name = "referencia_operacion", length = 150)
    private String referenciaOperacion;

    @Column(name = "verificado_por")
    private Long verificadoPor;

    /*@Column(name = "verificado_en", insertable = false, updatable = false)
    private LocalDateTime verificadoEn;*/
    @Column(name = "verificado_en")
    private LocalDateTime verificadoEn;
    
    @Column(name = "observacion_verificacion", length = 500)
    private String observacionVerificacion;

    @Column(name = "creado_en", insertable = false, updatable = false)
    private LocalDateTime creadoEn;

    @Column(name = "actualizado_en", insertable = false, updatable = false)
    private LocalDateTime actualizadoEn;

    public Pago() {
    }

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public Long getPedidoId() { return pedidoId; }
    public void setPedidoId(Long pedidoId) { this.pedidoId = pedidoId; }

    public String getMetodo() { return metodo; }
    public void setMetodo(String metodo) { this.metodo = metodo; }

    public String getEstado() { return estado; }
    public void setEstado(String estado) { this.estado = estado; }

    public String getReferenciaOperacion() { return referenciaOperacion; }
    public void setReferenciaOperacion(String referenciaOperacion) { this.referenciaOperacion = referenciaOperacion; }

    public Long getVerificadoPor() { return verificadoPor; }
    public void setVerificadoPor(Long verificadoPor) { this.verificadoPor = verificadoPor; }

    public LocalDateTime getVerificadoEn() { return verificadoEn; }
    public void setVerificadoEn(LocalDateTime verificadoEn) { this.verificadoEn = verificadoEn; }

    public String getObservacionVerificacion() { return observacionVerificacion; }
    public void setObservacionVerificacion(String observacionVerificacion) { this.observacionVerificacion = observacionVerificacion; }

    public LocalDateTime getCreadoEn() { return creadoEn; }
    public void setCreadoEn(LocalDateTime creadoEn) { this.creadoEn = creadoEn; }

    public LocalDateTime getActualizadoEn() { return actualizadoEn; }
    public void setActualizadoEn(LocalDateTime actualizadoEn) { this.actualizadoEn = actualizadoEn; }
}