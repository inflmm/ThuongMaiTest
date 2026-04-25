package com.example.demo.controller;

import com.example.demo.model.Order;
import com.example.demo.service.CheckoutService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import java.util.Map;

@RestController
@RequestMapping("/api/checkout")
@CrossOrigin(origins = "*")
public class CheckoutController {

    @Autowired
    private CheckoutService checkoutService;
    
    private final String DEMO_USER_ID = "guest_001"; 

    /**
     * API Thanh toán (Chỉ cần POST để kích hoạt logic)
     * POST http://localhost:8080/api/checkout
     * Body: { "paymentMethod": "CASH", "shippingAddress": "..." } (Tạm thời bỏ qua)
     */
    @PostMapping
    public ResponseEntity<?> checkout(@RequestBody Map<String, Object> payload) {
        
        try {
            // Lấy các thông tin cần thiết từ payload (tạm thời không dùng)
            // String paymentMethod = (String) payload.get("paymentMethod");
            
            // Gọi Service để xử lý toàn bộ logic thanh toán
            Order order = checkoutService.processCheckout(DEMO_USER_ID);
            
            // Trả về thông tin Order đã tạo
            return ResponseEntity.ok(order);
            
        } catch (RuntimeException e) {
            // Trả về lỗi nếu giỏ hàng trống hoặc có vấn đề về dữ liệu
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(Map.of("message", e.getMessage()));
        }
    }
}