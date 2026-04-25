// (Giả sử bạn đã nhúng config.inc.php và có thể truy cập biến API_BASE_URL)
// Trong môi trường PHP/HTML, bạn thường phải in biến này ra JS.
// Tuy nhiên, để đơn giản, ta sẽ khai báo trực tiếp URL ở đây.
const PRODUCT_API_URL = 'http://localhost:8080/api/products';
const API_BASE_URL = 'http://localhost:8080';
const CONTAINER = document.getElementById('product-list-container');

/**
 * Hàm tạo HTML cho một sản phẩm
 * @param {object} product - Đối tượng sản phẩm từ API
 * @returns {string} Chuỗi HTML cho thẻ sản phẩm
 */
function createProductCard(product) {
    // Sử dụng CSS/HTML bạn đã học để tạo kiểu cho thẻ (giống như GearVN)
    return `
        <div class="product-card">
            <a href="product-detail.php?id=${product.id}">
                <div class="homepage-product-image">
                    <img src="${API_BASE_URL+product.imageUrl}" alt="${product.name}" class="homepage-product-image">
                </div>
                
                <h3 class="homepage-product-name">${product.name}</h3>
            </a>
            
            <p class="product-price">${product.price.toLocaleString('vi-VN')} VNĐ</p>
            
            <button 
                class="homepage-add-cart" 
                data-product-id="${product.id}"
                onclick="addToCartFromHomepage(${product.id}, 1)">
                Thêm vào Giỏ
            </button>
        </div>
    `;
}

/**
 * Hàm gọi API và hiển thị danh sách sản phẩm
 */
async function loadProducts() {
    try {
        CONTAINER.innerHTML = '<p>Đang tải dữ liệu...</p>';
        
        // 1. Gọi API GET từ Spring Boot
        const response = await fetch(PRODUCT_API_URL);
        
        if (!response.ok) {
            throw new Error(`Lỗi HTTP: ${response.status}`);
        }
        
        // 2. Chuyển đổi JSON thành đối tượng JavaScript
        const products = await response.json();
        
        // 3. Xây dựng HTML và hiển thị
        let htmlContent = products.map(product => createProductCard(product)).join('');
        
        CONTAINER.innerHTML = htmlContent;

    } catch (error) {
        console.error("Lỗi khi tải sản phẩm:", error);
        CONTAINER.innerHTML = '<p class="text-danger">Không thể tải dữ liệu sản phẩm từ Server.</p>';
    }
}

/**
 * Hàm xử lý sự kiện "Thêm vào Giỏ"
 * (Tạm thời là hàm đơn giản, bạn sẽ cần làm nó phức tạp hơn sau)
 */
async function addToCartFromHomepage(productId, quantity) {
    const CART_ADD_URL = 'http://localhost:8080/api/cart/add';
    
    try {
        const response = await fetch(CART_ADD_URL, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                productId: productId,
                quantity: quantity
            })
        });

        if (response.ok) {
            alert(`Đã thêm thành công sản phẩm ID: ${productId} vào giỏ hàng!`);
            // Cập nhật số lượng giỏ hàng trên Header (logic sau này)
            window.dispatchEvent(new Event('cartUpdated'));
        } else {
            alert("Lỗi khi thêm sản phẩm vào giỏ hàng.");
        }
    } catch (error) {
        console.error("Lỗi POST API:", error);
        alert("Lỗi kết nối Server khi thêm giỏ hàng.");
    }
}

function moveSlide(direction) {
    const container = document.getElementById('product-list-container');
    
    // Lấy chiều rộng của 1 thẻ sản phẩm (bao gồm cả gap)
    const card = container.querySelector('.product-card');
    if (!card) return; // Nếu chưa có sản phẩm thì không làm gì
    
    const cardWidth = card.offsetWidth + 7; // Chiều rộng thẻ + gap
    
    const maxScroll = container.scrollWidth - container.clientWidth;

    if (direction === 1) {
        // Nếu đang ở sát nút cuối cùng (hoặc vượt quá), quay về 0
        if (container.scrollLeft >= maxScroll - 5) { 
            container.scrollLeft = 0;
        } else {
            container.scrollLeft += cardWidth;
        }
    } else {
        // Nếu đang ở đầu trang, nhảy đến cuối trang
        if (container.scrollLeft <= 5) {
            container.scrollLeft = maxScroll;
        } else {
            container.scrollLeft -= cardWidth;
        }
    }
}

// Chạy hàm khi DOM đã sẵn sàng
document.addEventListener('DOMContentLoaded', loadProducts);