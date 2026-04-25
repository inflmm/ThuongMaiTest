package com.example.demo.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/admin/orders")
public class AdminOrderController {

    @GetMapping("/list")
    @PreAuthorize("hasRole('ADMIN')") // Chỉ ADMIN mới gọi được hàm này
    public ResponseEntity<?> getOrdersForStaff() {
        return ResponseEntity.ok("Danh sách đơn hàng dành cho nhân viên");
    }
}