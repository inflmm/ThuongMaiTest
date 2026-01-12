const DEMO_USER_ID = 'guest_001'; 

const cartItemsContainer = document.getElementById('cart-items');
const subTotalElement = document.getElementById('sub-total');
const finalTotalElement = document.getElementById('final-total');
const checkoutButton = document.getElementById('checkout-button');

let currentCartItems = []; // Lưu trữ dữ liệu giỏ hàng

/**
 * Định dạng số thành tiền tệ VNĐ
 */
function formatCurrency(amount) {
    return new Intl.NumberFormat('vi-VN', { 
        style: 'currency', 
        currency: 'VND' 
    }).format(amount);
}

/**
 * Hiển thị giỏ hàng lên giao diện
 */
function renderCart() {    
    cartItemsContainer.innerHTML = '';
    let totalAllProducts = 0;

    if (currentCartItems.length === 0) {
        cartItemsContainer.innerHTML = '<p>Giỏ hàng của bạn đang trống.</p>';
        checkoutButton.disabled = true;
        subTotalElement.textContent = formatCurrency(0);
        finalTotalElement.textContent = formatCurrency(0);
        return;
    }

    currentCartItems.forEach(item => {
        
        // --- Đảm bảo các trường này đã được lấy từ DTO ---
        const unitPrice = item.unitPrice || 0; 
        const productName = item.productName || "Sản phẩm không rõ";
        const imageUrl = item.imageUrl || "";
        const itemPrice = unitPrice * item.quantity;
        totalAllProducts += itemPrice;
        // --------------------------------------------------

        const cartItemHtml = `
            <div class="cart-item">
                <div class="cart-item-image">
                    <img src="${API_BASE_URL}${imageUrl}" alt="${productName}" class="cart-item-image">
                </div>
                
                <div class="cart-item-details">
                    <a href="product-detail.php?id=${item.id}">
                        <h3 class="cart-item-name">${productName}</h3>
                    </a>
                    
                    <p class="cart-item-unit-price">Giá đơn vị: 
                        <strong>${formatCurrency(unitPrice)}</strong>
                    </p>
                    
                    <div class="cart-item-actions">
                        
                        <div class="quantity-control">
                            <label>Số lượng:</label>
                            
                            <button 
                                class="btn-qty-control btn-decrease" 
                                onclick="updateQuantity(${item.quantity - 1}, ${item.id})">
                                -
                            </button>
                            
                            <input 
                                type="number" 
                                class="cart-item-quantity-input" 
                                value="${item.quantity}" 
                                min="1" 
                                onchange="updateQuantity(this.value, ${item.id})">
                            
                            <button 
                                class="btn-qty-control btn-increase" 
                                onclick="updateQuantity(${item.quantity + 1}, ${item.id})">
                                +
                            </button>
                        </div>

                        <div class="cart-item-subtotal">
                            <p>Thành tiền: <strong class="price-total">${formatCurrency(itemPrice)}</strong></p>
                        </div>
                    </div>
                    
                    <button class="cart-item-remove" onclick="removeCartItem(${item.id})">
                            <i class="fa-solid fa-x"></i> Xóa khỏi giỏ
                        </button>
                </div>
            </div>
        `;
        cartItemsContainer.innerHTML += cartItemHtml;
    });

    // Cập nhật tổng tiền
    // 1. Tính toán các chi phí phụ
    const shippingFee = (totalAllProducts > 500000 || totalAllProducts === 0) ? 0 : 30000;
    const finalTotal = totalAllProducts + shippingFee;

    // 2. Lấy các phần tử HTML (Hãy chắc chắn ID này khớp với file .php)
    const subTotalElem = document.getElementById('sub-total');
    const shippingElem = document.getElementById('shipping-fee');
    const finalTotalElem = document.getElementById('final-total');

    // 3. Ghi giá trị vào HTML
    if (subTotalElem) {
        subTotalElem.textContent = formatCurrency(totalAllProducts);
    }

    if (shippingElem) {
        shippingElem.textContent = shippingFee === 0 ? "Miễn phí" : formatCurrency(shippingFee);
    }

    if (finalTotalElem) {
        finalTotalElem.textContent = formatCurrency(finalTotal);
    }
    checkoutButton.disabled = false;
}

/**
 * Tải giỏ hàng từ Back-end
 */
async function loadCart() {
    try {
        const response = await fetch(`${API_BASE_URL}/api/cart/items`);
        if (!response.ok) {
            throw new Error('Lỗi khi tải giỏ hàng.');
        }
        currentCartItems = await response.json();
        renderCart();
    } catch (error) {
        console.error("Lỗi:", error);
        alert('Không thể kết nối đến server hoặc lỗi tải giỏ hàng.');
    }
}

/**
 * Cập nhật số lượng sản phẩm trong giỏ hàng
 */
async function updateQuantity(newQuantity, cartItemId) {
    const quantity = parseInt(newQuantity);
    if (quantity < 1) {
        alert("Số lượng phải lớn hơn hoặc bằng 1.");
        return;
    }
    
    // Gửi yêu cầu cập nhật lên Back-end
    try {
        const response = await fetch(`${API_BASE_URL}/api/cart/update/${cartItemId}`, {
            method: 'PUT',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ quantity: parseInt(newQuantity) })
        });

        if (response.ok) {
            // Tải lại giỏ hàng để cập nhật hiển thị và tổng tiền
            window.dispatchEvent(new Event('cartUpdated'));
            await loadCart();
        } else {
            alert("Cập nhật số lượng thất bại.");
        }
    } catch (error) {
        console.error("Lỗi cập nhật:", error);
    }
}

/**
 * Xóa một sản phẩm khỏi giỏ hàng
 */
async function removeCartItem(cartItemId) {
    if (!confirm("Bạn có chắc chắn muốn xóa sản phẩm này?")) {
        return;
    }
    
    try {
        const response = await fetch(`${API_BASE_URL}/api/cart/remove/${cartItemId}`, {
            method: 'DELETE'
        });

        if (response.ok) {
            alert("Sản phẩm đã được xóa khỏi giỏ hàng.");
            window.dispatchEvent(new Event('cartUpdated'));
            await loadCart();
        } else {
            alert("Xóa sản phẩm thất bại.");
        }
    } catch (error) {
        console.error("Lỗi xóa:", error);
    }
}

/**
 * Xử lý sự kiện nút THANH TOÁN
 */
async function handleCheckout() {
    if (currentCartItems.length === 0) {
        alert("Giỏ hàng trống!");
        return;
    }

    checkoutButton.disabled = true; // Vô hiệu hóa nút để tránh double click

    try {
        const response = await fetch(`${API_BASE_URL}/api/checkout`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            // Giả định gửi một số thông tin thanh toán (có thể bỏ trống nếu Back-end không yêu cầu)
            body: JSON.stringify({ /* paymentMethod: "CASH_ON_DELIVERY" */ }) 
        });

        if (response.ok) {
            const orderResult = await response.json();
            alert(`Đặt hàng thành công! Mã đơn hàng: ${orderResult.id}. Tổng tiền: ${formatCurrency(orderResult.totalAmount)}`);
            
            // Chuyển hướng đến trang thông báo thành công
            window.location.href = 'success.php?orderId=' + orderResult.id; 
            
        } else {
            const errorData = await response.json();
            alert(`Thanh toán thất bại: ${errorData.message || 'Lỗi không xác định'}`);
            checkoutButton.disabled = false;
        }

    } catch (error) {
        console.error("Lỗi thanh toán:", error);
        alert('Lỗi kết nối Server khi thanh toán.');
        checkoutButton.disabled = false;
    }
}


// Khởi tạo
document.addEventListener('DOMContentLoaded', () => {
    loadCart();
    checkoutButton.addEventListener('click', handleCheckout);
});