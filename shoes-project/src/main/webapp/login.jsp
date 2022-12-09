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

    <!-- Header -->
    <jsp:include page="fragment/header.jsp" />
    <!--// Header -->

    <!-- Breadcrumb Area -->
    <div class="tm-breadcrumb-area tm-padding-section bg-grey" data-bgimage="resources/assets/images/breadcrumb-bg.jpg">
        <div class="container">
            <div class="tm-breadcrumb">
                <h2>Login & Register</h2>
                <ul>
                    <li><a href="index.html">Home</a></li>
                    <li>Login & Register</li>
                </ul>
            </div>
        </div>
    </div>
    <!--// Breadcrumb Area -->

    <!-- Page Content -->
    <main class="page-content">

        <!-- Login Register Area -->
        <div class="tm-section tm-login-register-area bg-white tm-padding-section">
            <div class="container">
                <div class="row">

                    <div class="col-lg-6">
                        <form action="login.jsp" class="tm-form tm-login-form">
                            <h4>Login</h4>
                            <p>Become a part of our community!</p>
                            <div class="tm-form-inner">
                                <div class="tm-form-field">
                                    <label for="login-email">Username or email address*</label>
                                    <input type="email" id="login-email" required="required">
                                </div>
                                <div class="tm-form-field">
                                    <label for="login-password">Password*</label>
                                    <input type="password" id="login-password" required="required">
                                </div>
                                <div class="tm-form-field">
                                    <input type="checkbox" name="login-remember" id="login-remember">
                                    <label for="login-remember">Remember Me</label>
                                    <p class="mb-0"><a href="#">Forgot your password?</a></p>
                                </div>
                                <div class="tm-form-field">
                                    <button type="submit" class="tm-button">Login</button>
                                </div>
                                <div class="tm-form-field">
                                    <div class="tm-form-sociallogin">
                                        <h6>Or, Login with :</h6>
                                        <ul>
                                            <li><a href="#" class="facebook-btn"><i class="ion-social-facebook"></i></a></li>
                                            <li><a href="#" class="google-btn"><i class="ion-social-google"></i></a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>

                    <div class="col-lg-6">
                        <form action="#" class="tm-form tm-register-form">
                            <h4>Create an account</h4>
                            <p>Welcome! Register for an account</p>
                            <div class="tm-form-inner">
                                <div class="tm-form-field">
                                    <label for="register-username">Username</label>
                                    <input type="text" id="register-username" required="required">
                                </div>
                                <div class="tm-form-field">
                                    <label for="register-email">Email address</label>
                                    <input type="email" id="register-email" required="required">
                                </div>
                                <div class="tm-form-field">
                                    <label for="register-password">Password</label>
                                    <input type="password" id="register-password" name="register-pass"
                                           required="required">
                                </div>
                                <div class="tm-form-field">
                                    <div>
                                        <input type="checkbox" id="register-pass-show" name="register-pass-show">
                                        <label for="register-pass-show">Show Password</label>
                                    </div>
                                    <div>
                                        <input type="checkbox" id="register-terms" name="register-terms">
                                        <label for="register-terms">I have read and agree to the website <a
                                                href="#">terms and
                                            conditions</a></label>
                                    </div>
                                </div>
                                <div class="tm-form-field">
                                    <button type="submit" class="tm-button">Register</button>
                                </div>
                            </div>
                        </form>
                    </div>

                </div>
            </div>
        </div>
        <!--// Login Register Area -->

    </main>
    <!--// Page Content -->


    <jsp:include page="fragment/footer.jsp" />
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