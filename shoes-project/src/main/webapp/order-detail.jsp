<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zxx">

<head>
  <meta charset="utf-8">
  <meta http-equiv="x-ua-compatible" content="ie=edge">
  <title>Order Detail</title>
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
        <h2>Order Detail</h2>
        <ul>
          <li><a href="/home">Home</a></li>
          <li><a href="/profile">Profile</a></li>
          <li>Order Detail</li>
        </ul>
      </div>
    </div>
  </div>
  <!--// Breadcrumb Area -->

  <!-- Page Content -->
  <main class="page-content">

    <!-- Shopping Cart Area -->
    <div class="tm-section shopping-cart-area bg-white tm-padding-section" style="padding-bottom: 20px;padding-top: 20px;">
      <div class="container">
        <div class="tm-cart-bottomarea" style="margin-bottom: 10px">
          <div class="row">
            <div class="col-lg-6 col-md-6">
              <div class="tm-cart-pricebox">
                <h2>Order</h2>
                <div class="table-responsive">
                  <table class="table table-borderless" style="margin: 0;">
                    <tbody>
                    <tr class="tm-cart-pricebox-total">
                      <td>Full Name :</td>
                      <td>${account.getFullName()}</td>
                    </tr>
                    <tr class="tm-cart-pricebox-total">
                      <td>Phone :</td>
                      <td>${orders.getPhone()}</td>
                    </tr>
                    <tr class="tm-cart-pricebox-total">
                      <td>Address :</td>
                      <td>${orders.getAddress()}</td>
                    </tr>
                    <tr class="tm-cart-pricebox-total">
                      <td>Progress :</td>
                      <td>${orders.getProgress()}</td>
                    </tr>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
            <div class="col-lg-2"></div>
            <div class="col-lg-4 col-md-6">
              <div class="tm-cart-pricebox">
                <h2>Total Order</h2>
                <div class="table-responsive">
                  <table class="table table-borderless">
                    <tbody>
                    <tr class="tm-cart-pricebox-total">
                      <td>Total</td>
                      <td>${totalCost} VNĐ</td>
                    </tr>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>
        </div>
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
            </tr>
            </thead>
            <tbody>
            <c:forEach var="item" items="${list.entrySet()}">
              <tr>
                  <td>
                    <a href="detail?productId=?${item.getKey().getId()}" class="tm-cart-productimage">
                      <img src="resources/assets/images/products/product-image-1-thumb.jpg"
                           alt="product image">
                    </a>
                  </td>
                  <td>
                    <a href="detail?productId=?${item.getKey().getId()}" class="tm-cart-productname">${item.getKey().getName()}</a>
                  </td>
                  <td class="tm-cart-price">${item.getKey().formatNumber(item.getKey().getPrice())} VNĐ</td>
                  <td class="tm-cart-price">${item.getValue()}</td>
                  <td>
                    <span class="tm-cart-totalprice">${item.getKey().formatNumber(item.getValue() * item.getKey().getPrice())} VNĐ</span>
                  </td>
              </tr>
              </c:forEach>

            </tbody>
          </table>
        </div>
        <!--// Shopping Cart Table -->
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