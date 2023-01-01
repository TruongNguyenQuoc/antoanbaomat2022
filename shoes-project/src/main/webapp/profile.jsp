<%@ page import="com.example.shoesproject.model.Account" %>
<%@ page import="com.example.shoesproject.util.NumberUtil" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zxx">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Profile</title>
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
        String address_err = "";
        String success = "";
        if (session.getAttribute("address_err") != null) {
            address_err = session.getAttribute("address_err").toString();
        }
        if (session.getAttribute("success") != null) {
            success = session.getAttribute("success").toString();
        }
    %>
    <!-- Header -->
    <jsp:include page="fragment/header.jsp" />
    <!--// Header -->

    <!-- Breadcrumb Area -->
    <div class="tm-breadcrumb-area tm-padding-section bg-grey" data-bgimage="resources/assets/images/breadcrumb-bg.jpg">
        <div class="container">
            <div class="tm-breadcrumb">
                <h2>My Account</h2>
                <ul>
                    <li><a href="/home">Home</a></li>
                    <li>My Account</li>
                </ul>
            </div>
        </div>
    </div>
    <!--// Breadcrumb Area -->

    <!-- Page Content -->
    <main class="page-content">

        <!-- My Account Area -->
        <div class="tm-section tm-my-account-area bg-white tm-padding-section">
            <div class="container">
                <div class="tm-myaccount">
                    <ul class="nav tm-tabgroup" id="account" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active" id="account-dashboard-tab" data-toggle="tab"
                               href="#account-dashboard" role="tab" aria-controls="account-dashboard"
                               aria-selected="true">Dashboard</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="account-orders-tab" data-toggle="tab" href="#account-orders"
                               role="tab" aria-controls="account-orders" aria-selected="false">Orders</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="account-address-tab" data-toggle="tab" href="#account-address"
                               role="tab" aria-controls="account-address" aria-selected="false">Change Password</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="account-change-key-tab" data-toggle="tab"
                               href="#account-change-key" role="tab" aria-controls="account-change-key"
                               aria-selected="false">Change Key</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="account-acdetails-tab" data-toggle="tab"
                               href="#account-acdetails" role="tab" aria-controls="account-acdetails"
                               aria-selected="false">Account Details</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="account-logout-tab" href="login?command=logout" role="tab"
                               aria-controls="account-address" aria-selected="false">Logout</a>
                        </li>
                    </ul>

                    <div class="tab-content" id="account-ontent">
                        <div class="tab-pane fade show active" id="account-dashboard" role="tabpanel"
                             aria-labelledby="account-dashboard-tab">
                            <div class="tm-myaccount-dashboard">
                                <%
                                    if (!address_err.equals("")) {
                                %>
                                <div class="alert alert-danger" role="alert">
                                    <%=address_err%>
                                </div>
                                <%
                                    }
                                %>
                                <%
                                    if (!success.equals("")) {
                                %>
                                <div class="alert alert-success" role="alert">
                                    <%=success%>
                                </div>
                                <%
                                    }
                                %>
                                <p>Hello <b><%=account.getFullName()%></b> (not <b><%=account.getFullName()%></b>? <a
                                        href="login?command=logout">Log
                                    out</a>)</p>
                                <p>From your account dashboard you can view your recent orders, manage your
                                    shipping and billing addresses, and edit your password and account details.</p>
                                <%
                                    if (account.getPublicKey().equals("")) {
                                %>
                                <a href="/profile?fileName=privateKey.txt">Download Public Key</a>
                                <%
                                    }
                                %>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="account-orders" role="tabpanel"
                             aria-labelledby="account-orders-tab">
                            <div class="tm-myaccount-orders">
                                <div class="table-responsive">
                                    <table class="table table-bordered mb-0">
                                        <thead>
                                        <tr>
                                            <th class="tm-myaccount-orders-col-id">ORDER ID</th>
                                            <th class="tm-myaccount-orders-col-date">DATE</th>
                                            <th class="tm-myaccount-orders-col-status">STATUS</th>
                                            <th class="tm-myaccount-orders-col-total">TOTAL</th>
                                            <th class="tm-myaccount-orders-col-view">VIEW</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="item" items="${order}">
                                                <tr>
                                                    <td>${item.id}</td>
                                                    <td>${item.createAt}</td>
                                                    <td>${item.progress}</td>
                                                    <td>${NumberUtil.formatNumber(item.totalCost)} VND</td>
                                                    <td><a href="/order-detail?orderId=${item.id}" class="tm-button tm-button-small">View</a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="account-address" role="tabpanel"
                             aria-labelledby="account-address-tab">
                            <div class="tm-myaccount-address">
                                <div class="row">
                                    <form action="changePassword" class="tm-form tm-form-bordered" method="POST">
                                        <h4>Change Password</h4>
                                        <div class="tm-form-inner">
                                            <div class="tm-form-field">
                                                <label for="acdetails-password">Old password</label>
                                                <input type="password" id="acdetails-password">
                                            </div>
                                            <div class="tm-form-field">
                                                <label for="acdetails-newpassword">New password</label>
                                                <input type="password" id="acdetails-newpassword">
                                            </div>
                                            <div class="tm-form-field">
                                                <label for="acdetails-confirmpass">Confirm password</label>
                                                <input type="password" id="acdetails-confirmpass">
                                            </div>
                                            <div class="tm-form-field">
                                                <button type="submit" class="tm-button">Save Changes</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="account-change-key" role="tabpanel"
                             aria-labelledby="account-address-tab">
                            <div class="tm-myaccount-address">
                                <div class="row">
                                    <form class="tm-form tm-form-bordered was-validated" enctype="multipart/form-data" action="changePrivateKey" method="post" >
                                        <div class="tm-form-inner">
                                            <div class="tm-form-field">
                                                <label for="billingform-key">Private Key</label>
                                                <div class="custom-file">
                                                    <input type="file" class="custom-file-input" name="fileKey" id="billingform-key" required>
                                                    <label class="custom-file-label" for="billingform-key">Choose Private Key...</label>
                                                    <p class="invalid-feedback">${key_err}</p>
                                                </div>
                                            </div>
                                            <div class="tm-form-field">
                                                <button type="submit" class="tm-button">Save Changes</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="account-acdetails" role="tabpanel"
                             aria-labelledby="account-acdetails-tab">
                            <div class="tm-myaccount-acdetails">
                                <form action="changeProfile" class="tm-form tm-form-bordered" method="POST">
                                    <h4>Account Details</h4>
                                    <div class="tm-form-inner">
                                        <div class="tm-form-field tm-form-fieldhalf">
                                            <label for="acdetails-firstname">Full Name</label>
                                            <input type="text" id="acdetails-firstname" readonly value="<%=account.getFullName()%>">
                                        </div>
                                        <div class="tm-form-field tm-form-fieldhalf">
                                            <label for="acdetails-email">Email</label>
                                            <input type="email" id="acdetails-email" readonly value="<%=account.getEmail()%>">
                                        </div>
                                        <div class="tm-form-field tm-form-fieldhalf">
                                            <label for="acdetails-phone">Phone</label>
                                            <%
                                                if (account.getPhone() == null) {
                                            %>
                                            <input type="text" id="acdetails-phone" value="">
                                            <%
                                                }
                                            %>
                                            <%
                                                if (account.getPhone() != null) {
                                            %>
                                            <input type="text" id="acdetails-phone" value="<%=account.getPhone()%>">
                                            <%
                                                }
                                            %>
                                        </div>
                                        <div class="tm-form-field tm-form-fieldhalf">
                                            <label for="acdetails-address">Address</label>
                                            <%
                                                if (account.getAddress() == null) {
                                            %>
                                            <input type="text" id="acdetails-address" value="">
                                            <%
                                                }
                                            %>
                                            <%
                                                if (account.getAddress() != null) {
                                            %>
                                            <input type="text" id="acdetails-address" value="<%=account.getPhone()%>">
                                            <%
                                                }
                                            %>
                                        </div>
                                        <div class="tm-form-field">
                                            <button type="submit" class="tm-button">Save Changes</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--// My Account Area -->

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