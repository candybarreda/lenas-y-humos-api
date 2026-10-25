
package com.lenasyhumos.backend.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.lenasyhumos.backend.entity.DetallePedido;

public interface DetallePedidoRepository
        extends JpaRepository<DetallePedido, Long> {

    List<DetallePedido> findByPedidoId(Long pedidoId);
}

