window.API_BASE_URL = window.API_BASE_URL || "http://localhost:8080";
window.addEventListener('scroll', function() {
    // 1. Lấy tất cả các Side Banner
    const banners = document.querySelectorAll('.side-banner');
    
    // 2. Kiểm tra vị trí cuộn của người dùng (tính bằng pixel)
    const scrollPos = window.scrollY;

    // 3. Nếu cuộn xuống quá 50px (chiều cao banner xanh chẳng hạn)
    if (scrollPos > 50) {
        banners.forEach(banner => {
            banner.classList.add('scrolled'); // Thêm class để đổi 'top' thành 100px
        });
    } else {
        banners.forEach(banner => {
            banner.classList.remove('scrolled'); // Xóa class để về lại 195px
        });
    }
});

async function updateCartCount() {
    try{
        const response = await fetch(`${API_BASE_URL}/api/cart/count`);
        if (!response.ok) {
            throw new Error(`HTTP error! status: ${response.status}`)
        }

        const count = await response.json();

        const cartCount = document.getElementById('cart-count');
        if(cartCount){
            cartCount.textContent = count;
        }
    } catch(error) {
        console.error("Lỗi cập nhật số lượng giỏ hàng:", error);
    }
}
//Cập nhật 1 lần
document.addEventListener('DOMContentLoaded', updateCartCount);
// Lắng nghe tín hiệu "cartUpdated" để cập nhật số lượng
window.addEventListener('cartUpdated', updateCartCount);