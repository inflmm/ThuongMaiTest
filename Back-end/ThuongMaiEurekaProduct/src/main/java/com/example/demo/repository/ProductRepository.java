package com.example.demo.repository;

import com.example.demo.model.Product;
import java.util.List;
import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {
    
    // Spring Data JPA sẽ tự động tạo câu lệnh SQL cho phương thức này:
    // SELECT * FROM product WHERE deleted = false
    List<Product> findByDeletedFalse();

    // Tương tự, tìm theo ID nhưng chỉ khi chưa bị xóa:
    // SELECT * FROM product WHERE id = ? AND deleted = false
    Optional<Product> findByIdAndDeletedFalse(Long id);

}