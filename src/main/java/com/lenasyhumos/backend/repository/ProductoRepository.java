
package com.lenasyhumos.backend.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.lenasyhumos.backend.entity.Producto;

public interface ProductoRepository
        extends JpaRepository<Producto, Long> {
}
