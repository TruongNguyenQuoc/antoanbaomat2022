<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--favicon-->
    <link rel="icon" href="../resources/admin/assets/images/favicon-32x32.png" type="image/png"/>
    <!--plugins-->
    <link href="../resources/admin/assets/plugins/simplebar/css/simplebar.css" rel="stylesheet"/>
    <link href="../resources/admin/assets/plugins/perfect-scrollbar/css/perfect-scrollbar.css" rel="stylesheet"/>
    <link href="../resources/admin/assets/plugins/metismenu/css/metisMenu.min.css" rel="stylesheet"/>
    <!-- loader-->
    <link href="../resources/admin/assets/css/pace.min.css" rel="stylesheet"/>
    <script src="../resources/admin/assets/js/pace.min.js"></script>
    <!-- Bootstrap CSS -->
    <link href="../resources/admin/assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="../resources/admin/assets/css/bootstrap-extended.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap" rel="stylesheet">
    <link href="../resources/admin/assets/css/app.css" rel="stylesheet">
    <link href="../resources/admin/assets/css/icons.css" rel="stylesheet">
    <!-- Theme Style CSS -->
    <link rel="stylesheet" href="../resources/admin/assets/css/dark-theme.css"/>
    <link rel="stylesheet" href="../resources/admin/assets/css/semi-dark.css"/>
    <link rel="stylesheet" href="../resources/admin/assets/css/header-colors.css"/>
    <title>Admin</title>
</head>

<body>
<!--wrapper-->
<div class="wrapper">
    <!--sidebar wrapper -->
    <div class="sidebar-wrapper" data-simplebar="true">
        <div class="sidebar-header">
            <div>
                <img src="../resources/admin/assets/images/logo-icon.png" class="logo-icon" alt="logo icon">
            </div>
            <div>
                <h4 class="logo-text">Surose</h4>
            </div>
            <div class="toggle-icon ms-auto"><i class='bx bx-arrow-to-left'></i>
            </div>
        </div>
        <!--navigation-->
        <ul class="metismenu" id="menu">
            <li>
                <a href="javascript:;">
                    <div class="menu-title">Dashboard</div>
                </a>
            </li>
            <li class="menu-label">Component</li>
            <li>
                <a href="widgets.html">
                    <div class="menu-title">Account</div>
                </a>
            </li>
            <li>
                <a href="javascript:;">
                    <div class="menu-title">Product</div>
                </a>
            </li>
            <li>
                <a href="javascript:;">
                    <div class="menu-title">Order</div>
                </a>
            </li>
        </ul>
        <!--end navigation-->
    </div>
    <!--end sidebar wrapper -->
    <!--start header -->
    <header>
        <div class="topbar d-flex align-items-center">
            <nav class="navbar navbar-expand">
                <div class="mobile-toggle-menu"><i class='bx bx-menu'></i>
                </div>
                <div class="search-bar flex-grow-1">
                    <div class="position-relative search-bar-box">
                        <input type="text" class="form-control search-control" placeholder="Type to search..."> <span
                            class="position-absolute top-50 search-show translate-middle-y"><i class='bx bx-search'></i></span>
                        <span class="position-absolute top-50 search-close translate-middle-y"><i
                                class='bx bx-x'></i></span>
                    </div>
                </div>
                <div class="top-menu ms-auto">
                    <ul class="navbar-nav align-items-center">
                        <li class="nav-item mobile-search-icon">
                            <a class="nav-link" href="#"> <i class='bx bx-search'></i>
                            </a>
                        </li>
                    </ul>
                </div>
                <div class="user-box dropdown">
                    <a class="d-flex align-items-center nav-link dropdown-toggle dropdown-toggle-nocaret" href="#"
                       role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        <img src="../resources/admin/assets/images/avatars/avatar-2.png" class="user-img"
                             alt="user avatar">
                        <div class="user-info ps-3">
                            <p class="user-name mb-0">Pauline Seitz</p>
                        </div>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-end">
                        <li><a class="dropdown-item" href="javascript:;"><i class='bx bx-log-out-circle'></i><span>Logout</span></a>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>
    </header>
    <!--end header -->
    <!--start page wrapper -->
    <div class="page-wrapper">
        <div class="page-content">
            <!--breadcrumb-->
            <div class="page-breadcrumb d-none d-sm-flex align-items-center mb-3">
                <div class="ps-3">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb mb-0 p-0">
                            <li class="breadcrumb-item"><a href="javascript:;"><i class="bx bx-home-alt"></i></a>
                            </li>
                            <li class="breadcrumb-item active" aria-current="page">Orders</li>
                        </ol>
                    </nav>
                </div>
            </div>
            <!--end breadcrumb-->

            <div class="card">
                <div class="card-body">
                    <div class="d-lg-flex align-items-center mb-4 gap-3">
                        <div class="position-relative">
                            <input type="text" class="form-control ps-5 radius-30" placeholder="Search Order"> <span
                                class="position-absolute top-50 product-show translate-middle-y"><i
                                class="bx bx-search"></i></span>
                        </div>
                    </div>
                    <div class="table-responsive">
                        <table class="table mb-0">
                            <thead class="table-light">
                            <tr>
                                <th>Order#</th>
                                <th>Full Name</th>
                                <th>Status</th>
                                <th>Total</th>
                                <th>Date</th>
                                <th>View Details</th>
                                <th>Actions</th>
                            </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="item" items="${orders}">
                                    <tr>
                                        <td>
                                            <div class="d-flex align-items-center">
                                                <div>
                                                    <input class="form-check-input me-3" type="checkbox" value=""
                                                           aria-label="...">
                                                </div>
                                                <div class="ms-2">
                                                    <h6 class="mb-0 font-14">${item.id}</h6>
                                                </div>
                                            </div>
                                        </td>
                                        <td>${item.accountName}</td>
                                        <td>
                                            ${item.progress}
                                        </td>
                                        <td>${item.totalCost}</td>
                                        <td>${item.createAt}</td>
                                        <td>
                                            <a href="/orderDetails-admin?orderId=${item.id}" class="btn btn-primary btn-sm radius-30 px-4">View Details
                                            </a>
                                        </td>
                                        <td>
                                            <div class="d-flex order-actions">
                                                <a href="javascript:;" class=""><i class='bx bxs-edit'></i></a>
                                                <a href="javascript:;" class="ms-3"><i class='bx bxs-trash'></i></a>
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>


        </div>
    </div>
    <!--end page wrapper -->
    <!--start overlay-->
    <div class="overlay toggle-icon"></div>
    <!--end overlay-->
    <!--Start Back To Top Button--> <a href="javaScript:;" class="back-to-top"><i class='bx bxs-up-arrow-alt'></i></a>
    <!--End Back To Top Button-->
    <footer class="page-footer">
        <p class="mb-0">Copyright © 2023. All right reserved.</p>
    </footer>
</div>
<!--end wrapper-->
<!-- Bootstrap JS -->
<script src="../resources/admin/assets/js/bootstrap.bundle.min.js"></script>
<!--plugins-->
<script src="../resources/admin/assets/js/jquery.min.js"></script>
<script src="../resources/admin/assets/plugins/simplebar/js/simplebar.min.js"></script>
<script src="../resources/admin/assets/plugins/metismenu/js/metisMenu.min.js"></script>
<script src="../resources/admin/assets/plugins/perfect-scrollbar/js/perfect-scrollbar.js"></script>
<!--app JS-->
<script src="../resources/admin/assets/js/app.js"></script>
</body>

</html>
