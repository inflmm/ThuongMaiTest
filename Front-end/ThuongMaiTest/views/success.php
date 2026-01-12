<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Đặt hàng thành công</title>
    <link rel="stylesheet" href="../assets/css/style.css">
    <style>
        .success-message {
            text-align: center;
            padding: 50px 0;
            background: #f9f9f9;
            border: 1px solid #e0e0e0;
            margin-top: 50px;
        }
        .success-message h1 {
            color: #28a745;
        }
    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css"
        integrity="sha512-2SwdPD6INVrV/lHTZbO2nodKhrnDdJK9/kg2XD1r9uGqPo1cUbujc+IYdlYdEErWNu69gVcYgdxlmVmzTWnetw=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
    <?php include 'partials/header.php'; ?>

    <main class="container">
        <div class="success-message">
            <h1>✅ Đặt hàng thành công!</h1>
            <?php 
                $orderId = isset($_GET['orderId']) ? htmlspecialchars($_GET['orderId']) : '---';
            ?>
            <p>Cảm ơn bạn đã mua sắm tại cửa hàng của chúng tôi.</p>
            <p>Mã đơn hàng của bạn là: <strong>#<?php echo $orderId; ?></strong></p>
            <p>Chúng tôi sẽ sớm liên hệ để xác nhận đơn hàng.</p>
            <a href="index.php" class="btn btn-secondary">Tiếp tục mua sắm</a>
        </div>
    </main>

    <?php include 'partials/footer.php'; ?>
</body>
</html>