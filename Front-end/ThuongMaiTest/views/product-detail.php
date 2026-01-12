<?php
// views/product-detail.php

// Giả định bạn có một controller hoặc router để xử lý URL và nhúng header/footer
// Để đơn giản, ta sẽ lấy ID trực tiếp từ URL ở đây.
$productId = isset($_GET['id']) ? (int)$_GET['id'] : 0; // Lấy ID từ tham số 'id' trên URL

// Bạn có thể thêm logic kiểm tra $productId ở đây (ví dụ: chuyển hướng nếu ID không hợp lệ)

// Nhúng header (chứa CSS và các thẻ mở)
// include 'partials/header.php'; // Nếu bạn có file index.php làm router thì không cần include ở đây

// --- Phần HTML hiển thị ---
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chi Tiết Sản Phẩm</title>
    <link rel="stylesheet" href="../assets/css/style.css"> <style>
        /* CSS riêng cho trang chi tiết sản phẩm */
        .product-detail-container {
            display: flex;
            gap: 30px;
            margin: 50px auto;
            max-width: 900px;
            padding: 20px;
            border: 1px solid #eee;
            box-shadow: 0 0 10px rgba(0,0,0,0.05);
            background-color: #fff;
        }
        .product-detail-image {
            flex: 1;
            max-width: 400px;
        }
        .product-detail-image img {
            width: 100%;
            height: auto;
            border: 1px solid #ddd;
        }
        .product-detail-info {
            flex: 1;
            padding-left: 20px;
        }
        .product-detail-info h2 {
            color: #333;
            margin-top: 0;
            font-size: 2em;
        }
        .product-detail-info .price {
            font-size: 1.8em;
            color: #e44d26;
            font-weight: bold;
            margin: 15px 0;
        }
        .product-detail-info .description {
            line-height: 1.6;
            color: #555;
            margin-bottom: 20px;
        }
        .quantity-selector {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
        }
        .quantity-selector button {
            background-color: #f0f0f0;
            border: 1px solid #ccc;
            padding: 5px 10px;
            cursor: pointer;
            font-size: 1.2em;
            width: 40px;
            height: 40px;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .quantity-selector input {
            width: 50px;
            text-align: center;
            border: 1px solid #ccc;
            padding: 5px;
            margin: 0 5px;
            font-size: 1.2em;
            height: 40px;
        }
        .btn-add-to-cart {
            background-color: #007bff;
            color: white;
            padding: 12px 25px;
            border: none;
            cursor: pointer;
            font-size: 1.1em;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }
        .btn-add-to-cart:hover {
            background-color: #0056b3;
        }
        .loading-message {
            text-align: center;
            padding: 50px;
            font-size: 1.2em;
            color: #666;
        }
        .error-message {
            text-align: center;
            padding: 50px;
            font-size: 1.2em;
            color: #d9534f;
        }
    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css"
        integrity="sha512-2SwdPD6INVrV/lHTZbO2nodKhrnDdJK9/kg2XD1r9uGqPo1cUbujc+IYdlYdEErWNu69gVcYgdxlmVmzTWnetw=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
    
    <?php include 'partials/header.php'; ?>

    <div id="product-detail-wrapper">
        <div id="loading-message" class="loading-message">Đang tải chi tiết sản phẩm...</div>
        <div id="error-message" class="error-message" style="display: none;"></div>
        <div id="product-detail-content" class="product-detail-container" style="display: none;">
            <div class="product-detail-image">
                <img id="detail-image" src="" alt="Product Image">
            </div>
            <div class="product-detail-info">
                <h2 id="detail-name"></h2>
                <p class="price" id="detail-price"></p>
                <p class="description" id="detail-description"></p>
                
                <div class="quantity-selector">
                    <button id="btn-decrease-qty">-</button>
                    <input type="number" id="detail-quantity" value="1" min="1" readonly>
                    <button id="btn-increase-qty">+</button>
                </div>
                
                <button id="add-to-cart-btn" class="btn-add-to-cart">Thêm vào Giỏ hàng</button>
            </div>
        </div>
    </div>

    <script>
        // In ID sản phẩm từ PHP vào biến JavaScript
        const CURRENT_PRODUCT_ID = <?php echo $productId; ?>;
        const CART_ADD_URL = 'http://localhost:8080/api/cart/add'; // Định nghĩa lại để tiện sử dụng
    </script>
    <script src="../assets/js/pages/product-detail.js"></script>

    <?php include 'partials/footer.php'; ?>
</body>
</html>