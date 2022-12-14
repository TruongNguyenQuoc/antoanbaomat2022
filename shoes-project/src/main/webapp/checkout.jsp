<<<<<<< Updated upstream
=======
<%@ page import="com.example.shoesproject.model.Account" %>
<%@ page import="com.example.shoesproject.model.Cart" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.example.shoesproject.model.Product" %>
<%@ page import="java.util.TreeMap" %>
<jsp:include page="fragment/taglib.jsp" />
>>>>>>> Stashed changes
<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Checkout</title>
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
        Account account = (Account) session.getAttribute("account");
        Cart cart = (Cart) session.getAttribute("cart");
        String key_err = "";

        if (session.getAttribute("key_err") != null) key_err = session.getAttribute("key_err").toString();

        TreeMap<Product, Integer> list = cart.getList();
    %>

    <!-- Header -->
    <jsp:include page="fragment/header.jsp" />
    <!--// Header -->

    <!-- Breadcrumb Area -->
    <div class="tm-breadcrumb-area tm-padding-section bg-grey" data-bgimage="resources/assets/images/breadcrumb-bg.jpg">
        <div class="container">
            <div class="tm-breadcrumb">
                <h2>Checkout</h2>
                <ul>
                    <li><a href="/home">Home</a></li>
                    <li><a href="/shop">Shop</a></li>
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
                <form action="checkout" method="POST" enctype="multipart/form-data" class="tm-form tm-checkout-form">
                    <div class="row">
                        <div class="col-lg-6">
                            <h4 class="small-title">BILLING INFORMATION</h4>

                            <!-- Billing Form -->
                            <div class="tm-checkout-billingform">
                                <div class="tm-form-inner">
                                    <div class="tm-form-field tm-form-fieldhalf">
                                        <label for="billingform-firstname">Full Name*</label>
                                        <input type="text" id="billingform-firstname" name="fullName" value="<%=account.getFullName()%>">
                                    </div>
                                    <div class="tm-form-field">
                                        <label for="billingform-email">Email</label>
                                        <input type="email" id="billingform-email" name="email" value="<%=account.getEmail()%>">
                                    </div>
                                    <div class="tm-form-field">
                                        <label for="billingform-phone">Phone</label>
                                        <input type="text" id="billingform-phone" name="phone" value="<%=account.getPhone()%>">
                                    </div>
                                    <div class="tm-form-field">
                                        <label for="billingform-address">Address</label>
                                        <input type="text" id="billingform-address" name="address" value="<%=account.getAddress()%>">
                                    </div>
                                    <div class="tm-form-field">
                                        <label for="billingform-shipping">Shipping</label>
                                        <select name="shipping" id="billingform-shipping">
                                            <option value="Payment on delivery">Payment on delivery</option>
                                            <option value="Direct Bank Transfer">Direct Bank Transfer</option>
                                        </select>
                                    </div>
                                    <div class="tm-form-field">
                                        <label for="billingform-key">Private Key</label>
                                        <input type="file" id="billingform-key" name="fileKey">
                                        <p class="text-danger"><%=key_err%></p>
                                    </div>
                                </div>
                            </div>
                            <!--// Billing Form -->
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
                                            <%
                                                for (Map.Entry<Product, Integer> item : list.entrySet()) {
                                            %>
                                                <tr>
                                                    <td><%=item.getKey().getName() + " * " + item.getValue()%></td>
                                                    <td><%=item.getKey().getPrice() * item.getValue()%></td>
                                                </tr>
                                            <%
                                                }
                                            %>
                                        </tbody>
                                        <tfoot>
                                             <td><%=session.getAttribute("totalCost")%></td>
                                        </tfoot>
                                    </table>
                                </div>

                                <div class="tm-checkout-submit">
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