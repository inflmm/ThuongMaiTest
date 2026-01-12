<?php
// (Tái sử dụng header, footer, v.v. từ các file khác) 
?>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <title>Giỏ hàng của bạn</title>
    <link rel="stylesheet" href="../assets/css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css"
        integrity="sha512-2SwdPD6INVrV/lHTZbO2nodKhrnDdJK9/kg2XD1r9uGqPo1cUbujc+IYdlYdEErWNu69gVcYgdxlmVmzTWnetw=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>

<body>
    <?php include 'partials/header.php'; ?>

    <main class="cart-container">
        <h1>Giỏ hàng của bạn</h1>

        <div class="horizontal">
            <section id="cart-items" class="cart-details-container">
            </section>

            <div id="cart-summary" class="summary">
                <h2>Tóm tắt đơn hàng</h2>
                <div class="summary-line">
                    <span>Tổng phụ:</span>
                    <span id="sub-total">0.00 VNĐ</span>
                </div>
                <div class="summary-line">
                    <span>Phí vận chuyển:</span>
                    <span>Miễn phí</span>
                </div>
                <div class="summary-line total">
                    <strong>Tổng thanh toán:</strong>
                    <strong id="final-total">0.00 VNĐ</strong>
                </div>

                <button id="checkout-button" class="cart-item-checkout" disabled>
                    Tiến hành Thanh toán
                </button>
            </div>
        </div>
    </main>

    <?php include 'partials/footer.php'; ?>

    <script src="../assets/js/pages/cart.js"></script>
</body>

</html>