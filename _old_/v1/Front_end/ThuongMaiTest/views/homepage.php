<!DOCTYPE html>
<html lang="vi">

<head>
    <title>Inspired Builders Inc - General Contractor Bay Area</title>
    <title>GEARVN - test</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../assets/css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css"
        integrity="sha512-2SwdPD6INVrV/lHTZbO2nodKhrnDdJK9/kg2XD1r9uGqPo1cUbujc+IYdlYdEErWNu69gVcYgdxlmVmzTWnetw=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>

<body>

    <?php include 'partials/header.php'; ?>

    <div class="main-container">
        <div class="container-fluid">
            <div class="index-slider--wrap">Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi, nisi voluptatum nostrum impedit, aliquam ducimus veniam nulla totam maxime necessitatibus neque. Excepturi assumenda modi unde voluptatibus dicta aspernatur officia pariatur.</div>
        </div>

        <div class="container-fluid">
            <div class="carousel-container">
                <button class="nav-btn prev" onclick="moveSlide(-1)"><i class="fa-solid fa-angle-left"></i></button>
                <button class="nav-btn next" onclick="moveSlide(1)"><i class="fa-solid fa-angle-right"></i></button>
                
                <div id="product-list-container" class="product-list-container"></div>
            </div>
        </div>
        
    </div>

    <?php include 'partials/footer.php'; ?>
    <script src="../assets/js/pages/homepage.js">
        loadProducts();
    </script>
</body>

</html>