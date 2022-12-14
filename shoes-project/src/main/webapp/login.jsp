<jsp:include page="fragment/taglib.jsp" />
<!DOCTYPE html>
<html lang="zxx">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Login & Register</title>
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
        String username_err = ""; String password_err = "";
        String username = ""; String password = "";
        if (request.getParameter("username") == null && request.getAttribute("username") == null) {
            username = "";
        } else {
            username = request.getParameter("username");
        }

        if (request.getParameter("password") == null && request.getAttribute("password") == null) {
            password = "";
        } else {
            password = request.getParameter("password");
        }


        if (request.getAttribute("username") != null) {
            username_err = request.getAttribute("username").toString();
        }

        if (request.getAttribute("password") != null) {
            password_err = request.getAttribute("password").toString();
        }
    %>

    <!-- Header -->
    <jsp:include page="fragment/header.jsp" />
    <!--// Header -->

    <!-- Breadcrumb Area -->
    <div class="tm-breadcrumb-area tm-padding-section bg-grey" data-bgimage="resources/assets/images/breadcrumb-bg.jpg">
        <div class="container">
            <div class="tm-breadcrumb">
                <h2>Login / Register</h2>
                <ul>
                    <li><a href="home.jsp">Home</a></li>
                    <li>Login / Register</li>
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
                        <form action="login" class="tm-form tm-login-form" method="POST">
                            <h2>Login</h2>
                            <p>Become a part of our community!</p>
                            <div class="tm-form-inner">
                                <div class="tm-form-field">
                                    <label for="username">Username*</label>
                                    <input type="text" id="username" name="username" value="<%=username%>" required="required">
                                </div>
                                <div class="tm-form-field">
                                    <label for="password">Password*</label>
                                    <input type="password" id="password" name="password" value="<%=password%>" required="required">
                                </div>
                                <div class="tm-form-field">
                                    <input type="checkbox" name="login-remember" id="login-remember">
                                    <p class="mb-0"><a href="#">Forgot your password?</a></p>
                                </div>
                                <div class="tm-form-field">
                                    <button type="submit" class="tm-button">Login</button>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="col-lg-6">
                        <form action="register" class="tm-form tm-login-form" method="POST" >
                            <h2>Register</h2>
                            <p>Welcome! Register for an account</p>
                            <div class="tm-form-inner">
                                <div class="tm-form-field">
                                    <label for="register-fullName">Full Name</label>
                                    <input type="text" id="register-fullName" name="fullName" required="required">
                                </div>
                                <div class="tm-form-field" style="margin-top: 10px">
                                    <label for="register-username">Username</label>
                                    <input type="text" id="register-username" name="username" required="required">
                                    <p class="text-danger" style="margin: 0;"><%=username_err%></p>
                                </div>
                                <div class="tm-form-field" style="margin-top: 10px">
                                    <label for="register-password">Password</label>
                                    <input type="password" id="register-password" name="password"
                                           required="required">
                                    <p class="text-danger" style="margin: 0;"><%=password_err%></p>
                                </div>
                                <div class="tm-form-field" style="margin-top: 10px">
                                    <label for="register-confirm-password">Confirm Password</label>
                                    <input type="password" id="register-confirm-password" name="confirm-password"
                                           required="required">
                                </div>
                                <div class="tm-form-field" style="margin-top: 10px">
                                    <label for="register-email">Email</label>
                                    <input type="email" id="register-email" name="email" required="required">
                                </div>
                                <div class="tm-form-field">
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