// assets/js/pages/product-detail.js

// Lấy ID sản phẩm từ biến toàn cục do PHP truyền vào
// const CURRENT_PRODUCT_ID = 1; // Giá trị mặc định nếu PHP không truyền

const PRODUCT_DETAIL_API_URL = `http://localhost:8080/api/products/${CURRENT_PRODUCT_ID}`;
const API_BASE_URL = 'http://localhost:8080';

// Lấy các phần tử DOM cần thiết
const loadingMessage = document.getElementById('loading-message');
const errorMessage = document.getElementById('error-message');
const productDetailContent = document.getElementById('product-detail-content');

const detailImage = document.getElementById('detail-image');
const detailName = document.getElementById('detail-name');
const detailPrice = document.getElementById('detail-price');
const detailDescription = document.getElementById('detail-description');
const detailQuantityInput = document.getElementById('detail-quantity');
const btnDecreaseQty = document.getElementById('btn-decrease-qty');
const btnIncreaseQty = document.getElementById('btn-increase-qty');
const addToCartBtn = document.getElementById('add-to-cart-btn');

let currentProduct = null; // Biến để lưu trữ thông tin sản phẩm hiện tại

/**
 * Hàm tải chi tiết sản phẩm từ API
 */
async function loadProductDetail() {
    if (!CURRENT_PRODUCT_ID || CURRENT_PRODUCT_ID === 0) {
        loadingMessage.style.display = 'none';
        errorMessage.style.display = 'block';
        errorMessage.textContent = 'Lỗi: Không tìm thấy ID sản phẩm.';
        return;
    }

    try {
        loadingMessage.style.display = 'block';
        productDetailContent.style.display = 'none';
        errorMessage.style.display = 'none';

        const response = await fetch(PRODUCT_DETAIL_API_URL);

        if (response.status === 404) {
            throw new Error("Không tìm thấy sản phẩm này.");
        }
        if (!response.ok) {
            throw new Error(`Lỗi HTTP: ${response.status}`);
        }

        const product = await response.json();

        currentProduct = product; // Lưu sản phẩm vào biến toàn cục

        // Cập nhật DOM với dữ liệu sản phẩm
        detailImage.src = API_BASE_URL + product.imageUrl;
        detailImage.alt = product.name;
        detailName.textContent = product.name;
        detailPrice.textContent = product.price.toLocaleString('vi-VN') + ' VNĐ';
        detailDescription.textContent = product.description;

        loadingMessage.style.display = 'none';
        productDetailContent.style.display = 'flex'; // Hiển thị nội dung chi tiết

    } catch (error) {
        console.error("Lỗi khi tải chi tiết sản phẩm:", error);
        loadingMessage.style.display = 'none';
        errorMessage.style.display = 'block';
        errorMessage.textContent = `Lỗi: ${error.message || "Không thể tải chi tiết sản phẩm từ Server."}`;
    }
}

/**
 * Hàm xử lý nút giảm số lượng
 */
btnDecreaseQty.addEventListener('click', () => {
    let currentQty = parseInt(detailQuantityInput.value);
    if (currentQty > 1) {
        detailQuantityInput.value = currentQty - 1;
    }
});

/**
 * Hàm xử lý nút tăng số lượng
 */
btnIncreaseQty.addEventListener('click', () => {
    let currentQty = parseInt(detailQuantityInput.value);
    detailQuantityInput.value = currentQty + 1;
});

/**
 * Hàm xử lý sự kiện "Thêm vào Giỏ" từ trang chi tiết
 */
addToCartBtn.addEventListener('click', async () => {
    if (!currentProduct) {
        alert("Không có sản phẩm để thêm vào giỏ!");
        return;
    }

    const quantity = parseInt(detailQuantityInput.value);
    
    try {
        const response = await fetch(CART_ADD_URL, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                productId: currentProduct.id,
                quantity: quantity
            })
        });

        if (response.ok) {
            alert(`Đã thêm thành công ${quantity} sản phẩm '${currentProduct.name}' vào giỏ hàng!`);
            // Cập nhật số lượng giỏ hàng trên Header (logic sau này)
            window.dispatchEvent(new Event('cartUpdated'));
        } else {
            const errorData = await response.json(); // Cố gắng đọc lỗi từ server
            alert(`Lỗi khi thêm sản phẩm vào giỏ hàng: ${errorData.message || 'Lỗi không xác định.'}`);
        }
    } catch (error) {
        console.error("Lỗi POST API:", error);
        alert("Lỗi kết nối Server khi thêm giỏ hàng.");
    }
});


// Chạy hàm khi DOM đã sẵn sàng
document.addEventListener('DOMContentLoaded', loadProductDetail);