package com.example.demo.controller;

import com.example.demo.model.Product;
import com.example.demo.service.ProductService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/products") // Đường dẫn gốc cho tất cả API liên quan đến sản phẩm
@CrossOrigin(origins = "*") // Cho phép Front-end truy cập từ mọi nguồn
public class ProductController {

    @Autowired
    private ProductService productService;

    /**
     * API 1: Lấy tất cả sản phẩm đang hoạt động (Hiển thị trang chủ)
     * GET http://localhost:8080/api/products
     * @return Danh sách Product
     */
    @GetMapping
    public List<Product> getAllProducts() {
        // Gọi Service để lấy dữ liệu (chỉ lấy các sản phẩm chưa bị xóa)
        return productService.getAllActiveProducts();
    }

    /**
     * API 2: Lấy chi tiết một sản phẩm theo ID
     * GET http://localhost:8080/api/products/{id}
     * @param id ID của sản phẩm
     * @return Product hoặc lỗi 404 nếu không tìm thấy
     */
    @GetMapping("/{id}")
    public ResponseEntity<Product> getProductById(@PathVariable Long id) {
        // Gọi Service và sử dụng Optional để kiểm tra sự tồn tại
        return productService.getProductById(id)
                .map(product -> ResponseEntity.ok(product)) // Nếu có, trả về 200 OK và dữ liệu
                .orElseGet(() -> ResponseEntity.notFound().build()); // Nếu không, trả về 404 Not Found
    }

    // (Bạn có thể thêm API POST/PUT/DELETE ở đây cho mục đích quản trị sau này)
}