package com.example.demo.service;

import com.example.demo.model.Product;
import com.example.demo.repository.ProductRepository;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service // Đánh dấu đây là Service Component
public class ProductService {

    // Dependency Injection: Tự động kết nối với ProductRepository
    @Autowired
    private ProductRepository productRepository;

    /**
     * Lấy tất cả sản phẩm CHƯA BỊ XÓA (Active Products)
     * @return Danh sách các Product đang hoạt động
     */
    public List<Product> getAllActiveProducts() {
        // Sử dụng phương thức Soft Delete đã định nghĩa trong Repository
        return productRepository.findByDeletedFalse(); 
    }

    /**
     * Lấy thông tin chi tiết một sản phẩm theo ID (chỉ khi chưa bị xóa)
     * @param id ID của sản phẩm
     * @return Optional<Product> (chứa sản phẩm hoặc rỗng nếu không tìm thấy)
     */
    public Optional<Product> getProductById(Long id) {
        // Sử dụng phương thức Soft Delete đã định nghĩa trong Repository
        return productRepository.findByIdAndDeletedFalse(id); 
    }

    /**
     * Tạo mới hoặc cập nhật một sản phẩm
     * (Cần thiết cho Admin/Khởi tạo dữ liệu)
     * @param product Đối tượng Product cần lưu
     * @return Product đã được lưu vào DB
     */
    public Product saveProduct(Product product) {
        return productRepository.save(product);
    }
    
    /**
     * Xóa mềm (Soft Delete) một sản phẩm
     * @param id ID của sản phẩm cần xóa
     */
    public void softDeleteProduct(Long id) {
        // 1. Tìm sản phẩm
        Optional<Product> productOpt = productRepository.findById(id);
        
        // 2. Nếu tìm thấy, cập nhật trường 'deleted' thành true
        productOpt.ifPresent(product -> {
            product.setDeleted(true);
            productRepository.save(product);
        });
        
        // (Nếu không tìm thấy, có thể throw exception, nhưng ở đây ta bỏ qua đơn giản)
    }
}