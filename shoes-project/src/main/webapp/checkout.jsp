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
                <h2>Checkout</h2>
                <ul>
                    <li><a href="index.html">Home</a></li>
                    <li><a href="products.html">Shop</a></li>
                    <li>Checkout</li>
                </ul>
            </div>
        </div>
    </div>
    <!--// Breadcrumb Area -->

    <!-- Page Content -->
    <main class="page-content">

        <!-- Checkout Area -->
        <div class="tm-section tm-checkout-area bg-white tm-padding-section">
            <div class="container">
                <div class="tm-checkout-coupon">
                    <a href="#checkout-couponform" data-toggle="collapse"><span>Have a coupon code?</span> Click
                        here and enter your code.</a>
                    <div id="checkout-couponform" class="collapse">
                        <form action="#" class="tm-checkout-couponform">
                            <input type="text" id="coupon-field" placeholder="Enter coupon code"
                                   required="required">
                            <button type="submit" class="tm-button">Submit</button>
                        </form>
                    </div>
                </div>
                <form action="#" class="tm-form tm-checkout-form">
                    <div class="row">
                        <div class="col-lg-6">
                            <h4 class="small-title">BILLING INFORMATION</h4>

                            <!-- Billing Form -->
                            <div class="tm-checkout-billingform">
                                <div class="tm-form-inner">
                                    <div class="tm-form-field tm-form-fieldhalf">
                                        <label for="billingform-firstname">First name*</label>
                                        <input type="text" id="billingform-firstname">
                                    </div>
                                    <div class="tm-form-field tm-form-fieldhalf">
                                        <label for="billingform-lastname">Last name*</label>
                                        <input type="text" id="billingform-lastname">
                                    </div>
                                    <div class="tm-form-field">
                                        <label for="billingform-companyname">Company name</label>
                                        <input type="text" id="billingform-companyname">
                                    </div>
                                    <div class="tm-form-field">
                                        <label for="billingform-email">Email address</label>
                                        <input type="email" id="billingform-email">
                                    </div>
                                    <div class="tm-form-field">
                                        <label for="billingform-phone">Phone (Optional)</label>
                                        <input type="text" id="billingform-phone">
                                    </div>
                                    <div class="tm-form-field">
                                        <label for="billingform-country">Country</label>
                                        <select name="billingform-country" id="billingform-country">
                                            <option value="bangladesh">United States</option>
                                            <option value="bangladesh">Mexico</option>
                                            <option value="bangladesh">Australia</option>
                                            <option value="bangladesh">Germany</option>
                                            <option value="bangladesh">Sweden</option>
                                            <option value="bangladesh">France</option>
                                        </select>
                                    </div>
                                    <div class="tm-form-field">
                                        <label for="billingform-address">Address</label>
                                        <input type="text" id="billingform-address"
                                               placeholder="Apartment, Street Address">
                                    </div>
                                    <div class="tm-form-field tm-form-fieldhalf">
                                        <label for="billingform-streetaddress">State</label>
                                        <input type="text" id="billingform-streetaddress">
                                    </div>
                                    <div class="tm-form-field tm-form-fieldhalf">
                                        <label for="billingform-zipcode">Zip / Postcode</label>
                                        <input type="text" id="billingform-zipcode">
                                    </div>
                                    <div class="tm-form-field">
                                        <input type="checkbox" name="billform-dirrentswitch"
                                               id="billform-dirrentswitch">
                                        <label for="billform-dirrentswitch"><b>Ship to another address</b></label>
                                    </div>
                                </div>
                            </div>
                            <!--// Billing Form -->

                            <!-- Different Address Form -->
                            <div class="tm-checkout-differentform">
                                <div class="tm-form-inner">
                                    <div class="tm-form-field tm-form-fieldhalf">
                                        <label for="differentform-firstname">First name*</label>
                                        <input type="text" id="differentform-firstname">
                                    </div>
                                    <div class="tm-form-field tm-form-fieldhalf">
                                        <label for="differentform-lastname">Last name*</label>
                                        <input type="text" id="differentform-lastname">
                                    </div>
                                    <div class="tm-form-field">
                                        <label for="differentform-companyname">Company name</label>
                                        <input type="text" id="differentform-companyname">
                                    </div>
                                    <div class="tm-form-field">
                                        <label for="differentform-email">Email address</label>
                                        <input type="email" id="differentform-email">
                                    </div>
                                    <div class="tm-form-field">
                                        <label for="differentform-phone">Phone (Optional)</label>
                                        <input type="text" id="differentform-phone">
                                    </div>
                                    <div class="tm-form-field">
                                        <label for="differentform-country">Country</label>
                                        <select name="differentform-country" id="differentform-country">
                                            <option value="bangladesh">United States</option>
                                            <option value="bangladesh">Mexico</option>
                                            <option value="bangladesh">Australia</option>
                                            <option value="bangladesh">Germany</option>
                                            <option value="bangladesh">Sweden</option>
                                            <option value="bangladesh">France</option>
                                        </select>
                                    </div>
                                    <div class="tm-form-field">
                                        <label for="differentform-address">Address</label>
                                        <input type="text" id="differentform-address"
                                               placeholder="Apartment, Street Address">
                                    </div>
                                    <div class="tm-form-field tm-form-fieldhalf">
                                        <label for="differentform-streetaddress">State</label>
                                        <input type="text" id="differentform-streetaddress">
                                    </div>
                                    <div class="tm-form-field tm-form-fieldhalf">
                                        <label for="differentform-zipcode">Zip / Postcode</label>
                                        <input type="text" id="differentform-zipcode">
                                    </div>
                                </div>
                            </div>
                            <!--// Different Address Form -->

                        </div>
                        <div class="col-lg-6">
                            <div class="tm-checkout-orderinfo">
                                <div class="table-responsive">
                                    <table class="table table-borderless tm-checkout-ordertable">
                                        <thead>
                                        <tr>
                                            <th>Product</th>
                                            <th>Total</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <td>Cosmetic plastic compact powder * 1</td>
                                            <td>$75.00</td>
                                        </tr>
                                        <tr>
                                            <td>Cosmetics and makeup brushes * 1</td>
                                            <td>$70.50</td>
                                        </tr>
                                        </tbody>
                                        <tfoot>
                                        <tr class="tm-checkout-subtotal">
                                            <td>Cart Subtotal</td>
                                            <td>$175.00</td>
                                        </tr>
                                        <tr class="tm-checkout-shipping">
                                            <td>(+) Shipping Charge</td>
                                            <td>$15.00</td>
                                        </tr>
                                        <tr class="tm-checkout-total">
                                            <td>Total</td>
                                            <td>$190.00</td>
                                        </tr>
                                        </tfoot>
                                    </table>
                                </div>

                                <div class="tm-checkout-payment">
                                    <h4>Select Payment Method</h4>
                                    <div class="tm-form-inner">
                                        <div class="tm-form-field">
                                            <input type="radio" name="checkout-payment-method"
                                                   id="checkout-payment-banktransfer">
                                            <label for="checkout-payment-banktransfer">Direct Bank Transfer</label>
                                            <div class="tm-checkout-payment-content">
                                                <p>Make your payment directly into our bank account.</p>
                                            </div>
                                        </div>
                                        <div class="tm-form-field">
                                            <input type="radio" name="checkout-payment-method"
                                                   id="checkout-payment-checkpayment" checked="checked">
                                            <label for="checkout-payment-checkpayment">Check Payments</label>
                                            <div class="tm-checkout-payment-content">
                                                <p>Please send a check to Store Name, Store Street, Store Town,
                                                    Store State / County, Store Postcode.</p>
                                            </div>
                                        </div>
                                        <div class="tm-form-field">
                                            <input type="radio" name="checkout-payment-method"
                                                   id="checkout-payment-cashondelivery">
                                            <label for="checkout-payment-cashondelivery">Cash On Delivery</label>
                                            <div class="tm-checkout-payment-content">
                                                <p>Pay with cash upon delivery.</p>
                                            </div>
                                        </div>
                                        <div class="tm-form-field">
                                            <input type="radio" name="checkout-payment-method"
                                                   id="checkout-payment-paypal">
                                            <label for="checkout-payment-paypal">PayPal</label>
                                            <div class="tm-checkout-payment-content">
                                                <p>Pay via PayPal.</p>
                                            </div>
                                        </div>
                                        <div class="tm-form-field">
                                            <input type="radio" name="checkout-payment-method"
                                                   id="checkout-payment-creditcard">
                                            <label for="checkout-payment-creditcard">Credit Card</label>
                                            <div class="tm-checkout-payment-content">
                                                <p>Pay with your credit card via Stripe.</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="tm-checkout-submit">
                                    <p>Your personal data will be used to process your order, support your
                                        experience throughout this website, and for other purposes described in our
                                        privacy policy.</p>
                                    <div class="tm-form-inner">
                                        <div class="tm-form-field">
                                            <input type="checkbox" name="checkout-read-terms"
                                                   id="checkout-read-terms">
                                            <label for="checkout-read-terms">I have read and agree to the website
                                                terms and conditions</label>
                                        </div>
                                        <div class="tm-form-field">
                                            <button type="submit" class="tm-button ml-auto">Place Order</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <!--// Checkout Area -->

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