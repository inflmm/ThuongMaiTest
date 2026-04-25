package com.example.demo.controller;

import com.example.demo.model.CartItem;
import com.example.demo.service.CartService;
import com.example.demo.dto.CartItemDto;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/cart") // Đường dẫn gốc cho giỏ hàng
@CrossOrigin(origins = "*")
public class CartController {

    @Autowired
    private CartService cartService;
    
    // Giả định User ID tĩnh cho mục đích demo/khách vãng lai
    private final String DEMO_USER_ID = "guest_001"; 

    /**
     * API 3: Thêm sản phẩm vào giỏ hàng (hoặc cập nhật số lượng)
     * POST http://localhost:8080/api/cart/add
     * Body: { "productId": 1, "quantity": 1 }
     */
    @PostMapping("/add")
    public ResponseEntity<CartItem> addToCart(@RequestBody Map<String, Object> payload) {
        
        // Trích xuất dữ liệu từ JSON gửi lên (Front-end)
        // Chú ý: Phải đảm bảo kiểu dữ liệu gửi lên khớp với kiểu dữ liệu nhận được
        Long productId = ((Number) payload.get("productId")).longValue();
        Integer quantity = ((Number) payload.get("quantity")).intValue();
        
        // Kiểm tra điều kiện đơn giản
        if (productId == null || quantity == null || quantity <= 0) {
            return new ResponseEntity("Thiếu thông tin sản phẩm hoặc số lượng không hợp lệ.", HttpStatus.BAD_REQUEST);
        }

        // Gọi Service để xử lý logic thêm/cập nhật
        CartItem updatedCartItem = cartService.addToCart(productId, quantity, DEMO_USER_ID);
        
        if (updatedCartItem != null) {
            return ResponseEntity.ok(updatedCartItem);
        } else {
            return new ResponseEntity("Không thể thêm vào giỏ hàng.", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    /**
     * API 4: Lấy giỏ hàng hiện tại của người dùng (Trả về DTO)
     * GET http://localhost:8080/api/cart/items
     */
    @GetMapping("/items")
    public List<CartItemDto> getCartItems() {
        return cartService.getCartItemsDto(DEMO_USER_ID);
    }
    
    @DeleteMapping("/remove/{cartItemId}")
    public ResponseEntity<String> removeItemFromCart(@PathVariable Long cartItemId) {
        
        boolean success = cartService.removeFromCart(cartItemId, DEMO_USER_ID);
        
        if (success) {
            return ResponseEntity.ok("Mục giỏ hàng có ID " + cartItemId + " đã được xóa thành công.");
        } else {
            return ResponseEntity.status(HttpStatus.NOT_FOUND)
                                 .body("Không tìm thấy mục giỏ hàng hoặc mục không thuộc về người dùng.");
        }
    }
    
    // Trong CartController.java (API 2: Update Quantity)

    @PutMapping("/update/{cartItemId}") 
    public ResponseEntity<?> updateQuantity(@PathVariable Long cartItemId, @RequestBody Map<String, Integer> payload) {
        try {
            // payload là Map<String, Integer>, giá trị trả về sẽ là Integer (là một Number)
            Integer newQuantity = payload.get("quantity");
            
            // KIỂM TRA ĐIỀU KIỆN NULL RẤT QUAN TRỌNG
            if (newQuantity == null) {
                return ResponseEntity.badRequest().body(Map.of("message", "Thiếu trường 'quantity' trong yêu cầu."));
            }
            
            // Gọi Service cập nhật
            CartItem updatedItem = cartService.updateQuantity(cartItemId, newQuantity, DEMO_USER_ID);
            
            return ResponseEntity.ok(updatedItem); 
            
        } catch (RuntimeException e) {
            e.printStackTrace(); 
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(Map.of("message", e.getMessage()));
        }
    }
    
    /**
     * API 6: Lấy số lượng sản phẩm trong giỏ hàng của người dùng
     * GET http://localhost:8080/api/cart/count
     */
    @GetMapping("/count")
    public ResponseEntity<Integer> getCartCount() {
    	// Giả sử bạn lấy userId từ Session hoặc Spring Security
        String userId = DEMO_USER_ID; 
        
        Integer count = cartService.getTotalItemCount(userId);
        return ResponseEntity.ok(count);
    }
}