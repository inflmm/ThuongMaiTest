package com.example.demo.service;

import com.example.demo.model.*;
import com.example.demo.repository.*;
import com.example.demo.model.OrderStatus;
import jakarta.transaction.Transactional; // Quan trọng để đảm bảo tính toàn vẹn dữ liệu
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CheckoutService {

    @Autowired
    private CartRepository cartRepository;
    
    @Autowired
    private ProductService productService; // Dùng để lấy thông tin giá sản phẩm
    
    @Autowired
    private OrderRepository orderRepository;
    
    @Autowired
    private OrderItemRepository orderItemRepository;

    /**
     * Xử lý thanh toán: Chuyển Cart Items thành Order và xóa Cart.
     * @param userId ID người dùng đang thanh toán (DEMO_USER_ID)
     * @return Order đã tạo thành công
     * @throws RuntimeException nếu giỏ hàng trống hoặc sản phẩm không tồn tại
     */
    @Transactional // Đảm bảo tất cả các thao tác DB đều thành công hoặc thất bại cùng nhau
    public Order processCheckout(String userId) {
        
        // 1. Lấy tất cả Cart Items của người dùng
        List<CartItem> cartItems = cartRepository.findByUserIdAndDeletedFalse(userId);

        if (cartItems.isEmpty()) {
            throw new RuntimeException("Giỏ hàng trống, không thể thanh toán.");
        }

        double totalAmount = 0.0;
        
        // 2. Tạo đối tượng Order mới
        Order newOrder = new Order();
        newOrder.setUserId(userId);
        // newOrder.setTotalAmount(0.0); // Tính toán sau
        newOrder.setStatus(OrderStatus.SUCCESS); // Giả định thanh toán thành công ngay lập tức
        
        // Lưu Order trước để có ID
        Order savedOrder = orderRepository.save(newOrder); 
        
        // 3. Duyệt Cart Items để tạo Order Items và tính Tổng tiền
        for (CartItem cartItem : cartItems) {
            
            // Lấy thông tin sản phẩm (để lấy giá và tên hiện tại)
            Product product = productService.getProductById(cartItem.getProductId())
                                .orElseThrow(() -> new RuntimeException("Sản phẩm không tồn tại: " + cartItem.getProductId()));
            
            // Tạo OrderItem
            OrderItem orderItem = new OrderItem();
            orderItem.setOrderId(savedOrder.getId());
            orderItem.setProductId(product.getId());
            orderItem.setProductName(product.getName());
            orderItem.setQuantity(cartItem.getQuantity());
            orderItem.setUnitPrice(product.getPrice()); // Ghi lại giá tại thời điểm đặt hàng
            
            // Tính tổng
            totalAmount += product.getPrice() * cartItem.getQuantity();
            
            // Lưu Order Item
            orderItemRepository.save(orderItem);

            // 4. Xóa mềm (Soft Delete) mục giỏ hàng sau khi đã chuyển sang Order
            cartItem.setDeleted(true);
            cartRepository.save(cartItem);
        }

        // 5. Cập nhật lại tổng tiền cho Order chính
        savedOrder.setTotalAmount(totalAmount);
        return orderRepository.save(savedOrder);
    }
}