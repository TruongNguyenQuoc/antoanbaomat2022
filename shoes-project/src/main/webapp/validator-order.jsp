<%@ page import="com.example.shoesproject.model.Account" %>
<%@ page import="com.example.shoesproject.model.Cart" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
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
<!-- Wrapper -->
<div id="wrapper" class="wrapper">

    <%
        String key_err = "";
        if (session.getAttribute("key_err") != null) key_err = session.getAttribute("key_err").toString();
    %>

    <!-- Header -->
    <jsp:include page="fragment/header.jsp" />
    <!--// Header -->

    <!-- Page Content -->
    <main class="page-content">
        <!-- Checkout Area -->
        <div class="tm-section tm-checkout-area bg-white tm-padding-section" style="padding-bottom: 20px;padding-top: 120px;">
            <div class="container">
                <form action="validator-order" method="POST" enctype="multipart/form-data" class="tm-form tm-checkout-form was-validated">
                    <div class="row">
                        <div class="col-lg-6">
                            <h4 class="small-title">BILLING INFORMATION</h4>

                            <!-- Billing Form -->
                            <div class="tm-checkout-billingform">
                                <div class="tm-form-inner">
                                    <div class="tm-form-field">
                                        <div class="embed-responsive embed-responsive-4by3">
                                            <iframe class="embed-responsive-item" src="./file/bill.pdf"></iframe>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--// Billing Form -->
                        </div>
                        <div class="col-lg-6">
                            <h4 class="small-title" style="padding-bottom: 35px;"></h4>
                            <div class="tm-checkout-orderinfo">
                                <div class="tm-form-field" style="margin: 0">
                                    <label for="billingform-key">Private Key</label>
                                    <div class="custom-file">
                                        <input type="file" class="custom-file-input" name="fileKey" id="billingform-key" required>
                                        <label class="custom-file-label" for="billingform-key">Choose Private Key...</label>
                                        <p class="invalid-feedback"><%=key_err%></p>
                                    </div>
                                </div>
                                <div class="tm-checkout-submit">
                                    <div class="tm-form-inner">
                                        <div class="tm-form-field">
                                            <button type="submit" class="tm-button ml-auto">Confirm</button>
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