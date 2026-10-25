
package com.lenasyhumos.backend.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.lenasyhumos.backend.entity.Pedido;

public interface PedidoRepository extends JpaRepository<Pedido, Long> {

    Optional<Pedido> findByClaveIdempotencia(String claveIdempotencia);

    boolean existsByNumeroPedido(String numeroPedido);
}

