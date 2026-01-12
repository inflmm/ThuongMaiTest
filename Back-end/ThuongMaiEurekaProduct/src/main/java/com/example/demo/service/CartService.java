package com.example.demo.service;

import com.example.demo.model.CartItem;
import com.example.demo.model.Product;
import com.example.demo.repository.CartRepository;
import com.example.demo.dto.CartItemDto;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CartService {

    @Autowired
    private CartRepository cartRepository;
    
    @Autowired
    private ProductService productService;

    // Giả định userId mặc định cho người dùng chưa đăng nhập/demo
    private final String DEFAULT_USER_ID = "guest_001"; 

    /**
     * Lấy toàn bộ giỏ hàng của một người dùng
     * @param userId ID người dùng
     * @return Danh sách các mục trong giỏ hàng
     */
    public List<CartItem> getCartItems(String userId) {
        // Sử dụng phương thức Soft Delete để chỉ lấy các mục chưa bị xóa
        return cartRepository.findByUserIdAndDeletedFalse(userId);
    }

    /**
     * Thêm một sản phẩm vào giỏ hàng (hoặc cập nhật số lượng)
     * @param productId ID sản phẩm
     * @param quantityToChange Số lượng muốn thêm (luôn là số dương)
     * @param userId ID người dùng
     * @return CartItem đã được cập nhật/tạo mới
     */
    public CartItem addToCart(Long productId, Integer quantityToChange, String userId) {
        
        // 1. Tìm xem sản phẩm đã có trong giỏ hàng chưa
        Optional<CartItem> existingItemOpt = 
                cartRepository.findByUserIdAndProductIdAndDeletedFalse(userId, productId);

        if (existingItemOpt.isPresent()) {
            // 2. Nếu đã có: Cập nhật số lượng
            CartItem existingItem = existingItemOpt.get();
            existingItem.setQuantity(existingItem.getQuantity() + quantityToChange);
            
            // Đảm bảo số lượng không âm
            if (existingItem.getQuantity() <= 0) {
                 // Nếu số lượng về 0, ta thực hiện xóa mềm mục này (hoặc xóa cứng, tùy logic)
                 existingItem.setDeleted(true); 
            }
            return cartRepository.save(existingItem);
            
        } else {
            // 3. Nếu chưa có: Tạo mục giỏ hàng mới
            if (quantityToChange > 0) {
                CartItem newItem = new CartItem();
                newItem.setUserId(userId);
                newItem.setProductId(productId);
                newItem.setQuantity(quantityToChange);
                newItem.setDeleted(false); 
                return cartRepository.save(newItem);
            }
            // Nếu cố gắng thêm số lượng 0 hoặc âm mà mục đó chưa tồn tại, ta bỏ qua
            return null; 
        }
    }
    
    // Lưu ý: Logic Thanh toán (Checkout) sẽ được tạo trong một Service riêng (CheckoutService)
    // ở Bước 4 để tách biệt logic.

    /**
     * Xóa mềm một mục (CartItem) khỏi giỏ hàng
     * @param cartItemId ID của mục giỏ hàng (Không phải productId)
     * @param userId ID người dùng
     * @return true nếu xóa thành công, false nếu không tìm thấy
     */
    public boolean removeFromCart(Long cartItemId, String userId) {
        
        // Tìm mục giỏ hàng theo ID và đảm bảo nó thuộc về userId này
        Optional<CartItem> itemOpt = cartRepository.findById(cartItemId);
        
        if (itemOpt.isPresent()) {
            CartItem item = itemOpt.get();
            
            // **Kiểm tra bảo mật cơ bản:** Đảm bảo người dùng chỉ xóa mục của chính mình
            if (!item.getUserId().equals(userId)) {
                // Có thể throw Security Exception ở đây
                return false; 
            }

            // Thực hiện Soft Delete
            item.setDeleted(true);
            cartRepository.save(item);
            return true;
        }
        return false;
    }
    
    /**
     * Cập nhật số lượng của một mục trong giỏ hàng
     * @param cartItemId ID của mục giỏ hàng
     * @param newQuantity Số lượng mới
     * @param userId ID người dùng
     * @return CartItem đã được cập nhật hoặc null
     */
    public CartItem updateQuantity(Long cartItemId, Integer newQuantity, String userId) {
        if (newQuantity <= 0) {
            // Nếu số lượng là 0 hoặc âm, ta coi như là xóa
            removeFromCart(cartItemId, userId);
            return null;
        }

        Optional<CartItem> itemOpt = cartRepository.findById(cartItemId);
        
        if (itemOpt.isPresent()) {
            CartItem item = itemOpt.get();
            
            // Kiểm tra bảo mật
            if (!item.getUserId().equals(userId)) {
                return null;
            }

            item.setQuantity(newQuantity);
            return cartRepository.save(item);
        }
        return null;
    }
    
    /**
     * Lấy danh sách giỏ hàng và chuyển đổi sang DTO để hiển thị thông tin sản phẩm
     * @param userId ID người dùng
     * @return List<CartItemDto>
     */
    public List<CartItemDto> getCartItemsDto(String userId) {
        // Lấy Cart Items cơ bản
        List<CartItem> cartItems = cartRepository.findByUserIdAndDeletedFalse(userId);

        // Chuyển đổi sang DTO
        return cartItems.stream()
                .map(item -> {
                    // Lấy chi tiết sản phẩm dựa trên productId
                    Product product = productService.getProductById(item.getProductId())
                        .orElse(null); // Trả về null nếu không tìm thấy SP
                    
                    // Nếu sản phẩm tồn tại, tạo DTO hoàn chỉnh
                    if (product != null) {
                        return new CartItemDto(
                            item.getId(),
                            item.getProductId(),
                            item.getQuantity(),
                            product.getName(),      // productName
                            product.getPrice(),     // unitPrice
                            product.getImageUrl()   // imageUrl
                        );
                    }
                    
                    // Nếu sản phẩm không tồn tại (SP đã bị xóa khỏi hệ thống)
                    return new CartItemDto(
                        item.getId(),
                        item.getProductId(),
                        item.getQuantity(),
                        "Sản phẩm đã bị xóa", 
                        0.0, 
                        "/images/default.jpg"
                    );
                })
                .collect(Collectors.toList());
    }
    /**
     * Lấy số lượng sản phẩm trong giỏ hàng người dùng
     * @param userId ID người dùng
     * @return Interger số lượng sản phẩm
     */
    public Integer getTotalItemCount(String userId) {
    	// Thêm kiểm tra userId
    	
    	return cartRepository.countTotalItemsByUserId(userId);    
    }
}