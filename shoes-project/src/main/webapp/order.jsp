<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Surose - Jewelry eCommerce HTML Template</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="apple-touch-icon" href="resources/assets/images/favicon.png">
    <link rel="shortcut icon" href="resources/assets/images/favicon.ico">

    <!-- CSS FILES HERE -->
    <!-- inject:css -->
    <link rel="stylesheet" href="resources/assets/css/vendors/bootstrap.min.css">
    <link rel="stylesheet" href="resources/assets/css/vendors/meanmenu.min.css">
    <link rel="stylesheet" href="resources/assets/css/vendors/slick.css">
    <link rel="stylesheet" href="resources/assets/css/vendors/slick-theme.css">
    <link rel="stylesheet" href="resources/assets/css/vendors/ionicons.min.css">
    <link rel="stylesheet" href="resources/assets/css/vendors/nice-select.css">
    <link rel="stylesheet" href="resources/assets/css/vendors/jquery.fancybox.min.css">
    <link rel="stylesheet" href="resources/assets/css/vendors/jquery.nstSlider.min.css">
    <link rel="stylesheet" href="resources/assets/css/style.css">
    <!-- endinject -->
</head>

<body>

<!-- Preloader -->
<div class="tm-preloader">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-6">
                <div class="tm-preloader-logo">
                    <img src="resources/assets/images/logo.png" alt="logo">
                </div>
                <span class="tm-preloader-progress"></span>
            </div>
        </div>
    </div>
    <button class="tm-button tm-button-small">Cancel Preloader</button>
</div>
<!--// Preloader -->

<!-- Wrapper -->
<div id="wrapper" class="wrapper">

    <!-- Header -->
    <jsp:include page="fragment/header.jsp" />
    <!--// Header -->

    <!-- Breadcrumb Area -->
    <div class="tm-breadcrumb-area tm-padding-section bg-grey" data-bgimage="resources/assets/images/breadcrumb-bg.jpg">
        <div class="container">
            <div class="tm-breadcrumb">
                <h2>Shopping Cart</h2>
                <ul>
                    <li><a href="index.html">Home</a></li>
                    <li><a href="products.html">Shop</a></li>
                    <li>Shopping Cart</li>
                </ul>
            </div>
        </div>
    </div>
    <!--// Breadcrumb Area -->

    <!-- Page Content -->
    <main class="page-content">

        <!-- Shopping Cart Area -->
        <div class="tm-section shopping-cart-area bg-white tm-padding-section">
            <div class="container">

                <!-- Shopping Cart Table -->
                <div class="tm-cart-table table-responsive">
                    <table class="table table-bordered mb-0">
                        <thead>
                        <tr>
                            <th class="tm-cart-col-image" scope="col">Image</th>
                            <th class="tm-cart-col-productname" scope="col">Product</th>
                            <th class="tm-cart-col-price" scope="col">Price</th>
                            <th class="tm-cart-col-quantity" scope="col">Quantity</th>
                            <th class="tm-cart-col-total" scope="col">Total</th>
                            <th class="tm-cart-col-remove" scope="col">Remove</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>
                                <a href="product-details.html" class="tm-cart-productimage">
                                    <img src="resources/assets/images/products/product-image-1-thumb.jpg"
                                         alt="product image">
                                </a>
                            </td>
                            <td>
                                <a href="product-details.html" class="tm-cart-productname">Stylist
                                    daimond
                                    earring</a>
                            </td>
                            <td class="tm-cart-price">$75.00</td>
                            <td>
                                <div class="tm-quantitybox">
                                    <input type="text" value="1">
                                </div>
                            </td>
                            <td>
                                <span class="tm-cart-totalprice">$75.00</span>
                            </td>
                            <td>
                                <button class="tm-cart-removeproduct"><i class="ion-close"></i></button>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <a href="product-details.html" class="tm-cart-productimage">
                                    <img src="resources/assets/images/products/product-image-2-thumb.jpg"
                                         alt="product image">
                                </a>
                            </td>
                            <td>
                                <a href="product-details.html" class="tm-cart-productname">Stylist
                                    daimond
                                    earring</a>
                            </td>
                            <td class="tm-cart-price">$75.00</td>
                            <td>
                                <div class="tm-quantitybox">
                                    <input type="text" value="1">
                                </div>
                            </td>
                            <td>
                                <span class="tm-cart-totalprice">$75.00</span>
                            </td>
                            <td>
                                <button class="tm-cart-removeproduct"><i class="ion-close"></i></button>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <!--// Shopping Cart Table -->

                <!-- Shopping Cart Content -->
                <div class="tm-cart-bottomarea">
                    <div class="row">
                        <div class="col-lg-8 col-md-6">
                            <div class="tm-buttongroup">
                                <a href="#" class="tm-button">Continue Shopping</a>
                                <a href="#" class="tm-button">Update Cart</a>
                            </div>
                            <form action="#" class="tm-cart-coupon">
                                <label for="coupon-field">Have a coupon code?</label>
                                <input type="text" id="coupon-field" placeholder="Enter coupon code"
                                       required="required">
                                <button type="submit" class="tm-button">Submit</button>
                            </form>
                        </div>
                        <div class="col-lg-4 col-md-6">
                            <div class="tm-cart-pricebox">
                                <h2>Cart Totals</h2>
                                <div class="table-responsive">
                                    <table class="table table-borderless">
                                        <tbody>
                                        <tr class="tm-cart-pricebox-subtotal">
                                            <td>Cart Subtotal</td>
                                            <td>$175.00</td>
                                        </tr>
                                        <tr class="tm-cart-pricebox-shipping">
                                            <td>(+) Shipping Charge</td>
                                            <td>$15.00</td>
                                        </tr>
                                        <tr class="tm-cart-pricebox-total">
                                            <td>Total</td>
                                            <td>$190.00</td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <a href="#" class="tm-button">Proceed To Checkout</a>
                            </div>
                        </div>
                    </div>
                </div>
                <!--// Shopping Cart Content -->

            </div>
        </div>
        <!--// Shopping Cart Area -->

    </main>
    <!--// Page Content -->

    <!-- Footer -->
    <jsp:include page="fragment/footer.jsp" />
    <!--// Footer -->

    <button id="back-top-top"><i class="ion-arrow-up-c"></i></button>

</div>
<!--// Wrapper -->

<!-- JS FILES HERE -->
<!-- inject:js -->
<script src="resources/assets/js/vendors/modernizr-3.7.1.min.js"></script>
<script src="resources/assets/js/vendors/jquery-3.3.1.min.js"></script>
<script src="resources/assets/js/vendors/bootstrap.bundle.min.js"></script>
<script src="resources/assets/js/vendors/jquery.meanmenu.min.js"></script>
<script src="resources/assets/js/vendors/slick.min.js"></script>
<script src="resources/assets/js/vendors/jquery.nice-select.js"></script>
<script src="resources/assets/js/vendors/jquery.countdown.min.js"></script>
<script src="resources/assets/js/vendors/jquery.ajaxchimp.min.js"></script>
<script src="resources/assets/js/vendors/jquery.fancybox.min.js"></script>
<script src="resources/assets/js/vendors/imagesloaded.pkgd.min.js"></script>
<script src="resources/assets/js/vendors/isotope.pkgd.min.js"></script>
<script src="resources/assets/js/vendors/instafeed.min.js"></script>
<script src="resources/assets/js/vendors/jquery.nstslider.min.js"></script>
<script src="resources/assets/js/vendors/ScrollMagic.min.js"></script>
<script src="resources/assets/js/main.js"></script>
<!-- endinject -->
</body>

</html>