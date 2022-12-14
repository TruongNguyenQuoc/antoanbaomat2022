<%@ page import="com.example.shoesproject.model.Account" %>
<%@ page import="com.example.shoesproject.util.SessionUtil" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<body>

<%
    Account account = null;
    if (session.getAttribute("account") != null) {
        account = (Account) session.getAttribute("account");
    }
%>

<div class="tm-header tm-header-sticky">
    <!-- Header Top Area -->
    <div class="tm-header-toparea bg-black">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-8 col-12">
                    <ul class="tm-header-info">
                        <li><a href="tel:18883456789"><i class="ion-ios-telephone"></i>1-888-345-6789</a></li>
                        <li><a href="mailto:contact@example.com"><i
                                class="ion-android-mail"></i>contact@example.com</a></li>
                    </ul>
                </div>
                <div class="col-lg-4 col-12">
                    <div class="tm-header-options">
                        <div class="tm-dropdown tm-header-links">
                            <%
                                if (session.getAttribute("account") == null) {
                            %>
                                <button>My Account</button>
                            <%
                                }
                            %>
                            <%
                                if (session.getAttribute("account") != null) {
                            %>
                                <button><%=account.getFullName()%></button>
                            <%
                                }
                            %>

                            <ul>
                                <li><a href="/profile">My Account</a></li>
                                <%
                                    if (session.getAttribute("account") == null) {
                                %>
                                <li><a href="/login.jsp">Login / Register</a></li>
                                <%
                                    }
                                %>
                                <li><a href="/orders">Shopping Cart</a></li>
                                <li><a href="/checkout">Checkout</a></li>
                                <%
                                    if (session.getAttribute("account") != null) {
                                %>
                                <li><a href="login?command=logout">Logout</a></li>
                                <%
                                    }
                                %>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--// Header Top Area -->

    <!-- Header Middle Area -->
    <div class="tm-header-middlearea bg-white">
        <div class="container">
            <div class="tm-mobilenav"></div>
            <div class="row align-items-center">
                <div class="col-lg-3 col-6 orders-1 orders-lg-1">
                    <a href="/home" class="tm-header-logo">
                        <img src="resources/assets/images/logo.png" alt="surose">
                    </a>
                </div>
                <div class="col-lg-6 col-12 orders-3 orders-lg-2">
                    <form class="tm-header-search">
                        <input type="text" placeholder="Search product...">
                        <button><i class="ion-android-search"></i></button>
                    </form>
                </div>
                <div class="col-lg-3 col-6 orders-2 orders-lg-3">
                    <ul class="tm-header-icons">
                        <%
                            if (session.getAttribute("totalProduct") == null) {
                        %>
                        <li><a href="orders"><i class="ion-bag"></i><span>0</span></a></li>
                        <%
                            }
                        %>
                        <%
                            if (session.getAttribute("totalProduct") != null) {
                        %>
                        <li><a href="orders"><i
                                class="ion-bag"></i><span><%=session.getAttribute("totalProduct")%></span></a></li>
                        <%
                            }
                        %>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!--// Header Middle Area -->

    <!-- Header Bottom Area -->
    <div class="tm-header-bottomarea bg-white">
        <div class="container">
            <nav class="tm-header-nav">
                <ul>
                    <li><a href="index.html">Home</a></li>
                    <li><a href="about.html">About</a></li>
                    <li class="tm-header-nav-dropdown"><a href="products.html">Shop</a>
                        <ul>
                            <li><a href="products.html">Products</a></li>
                            <li><a href="products-leftsidebar.html">Products Left Sidebar</a></li>
                            <li><a href="products-nosidebar.html">Products Without Sidebar</a></li>
                            <li><a href="products-4-column.html">Products 4 Column</a></li>
                            <li><a href="product-details.html">Product Details</a></li>
                            <li><a href="product-details-leftsidebar.html">Product Details Left Sidebar</a></li>
                            <li><a href="product-details-nosidebar.html">Product Details Without Sidebar</a>
                            </li>
                            <li><a href="#">Others</a>
                                <ul>
                                    <li><a href="cart.html">Shopping Cart</a></li>
                                    <li><a href="wishlist.html">Wishlist</a></li>
                                    <li><a href="checkout.html">Checkout</a></li>
                                    <li><a href="my-account.html">My Account</a></li>
                                    <li><a href="login-register.html">Login / Register</a></li>
                                </ul>
                            </li>
                        </ul>
                    </li>
                    <li class="tm-header-nav-megamenu"><a href="index.html">Pages</a>

                        <ul>
                            <li><a href="shop.html">Common Pages</a>
                                <ul>
                                    <li><a href="index.html">Homepage</a></li>
                                    <li><a href="about.html">About</a></li>
                                    <li><a href="portfolios.html">Portfolios</a></li>
                                    <li><a href="contact.html">Contact</a></li>
                                </ul>
                            </li>
                            <li><a href="#">Blog Pages</a>
                                <ul>
                                    <li><a href="blog.html">Blog</a></li>
                                    <li><a href="blog-leftsidebar.html">Blog Left Sidebar</a></li>
                                    <li><a href="blog-details.html">Blog Details</a></li>
                                    <li><a href="blog-details-leftsidebar.html">Blog Details Left Sidebar</a>
                                    </li>
                                </ul>
                            </li>
                            <li><a href="#">Shop Pages</a>
                                <ul>
                                    <li><a href="products.html">Products</a></li>
                                    <li><a href="products-leftsidebar.html">Products Left Sidebar</a></li>
                                    <li><a href="products-nosidebar.html">Products Without Sidebar</a></li>
                                    <li><a href="products-4-column.html">Products 4 Column</a></li>
                                    <li><a href="product-details.html">Product Details</a></li>
                                    <li><a href="product-details-leftsidebar.html">Product Details Left
                                        Sidebar</a></li>
                                    <li><a href="product-details-nosidebar.html">Product Details Without
                                        Sidebar</a>
                                    </li>
                                </ul>
                            </li>
                            <li><a href="#">Shop Related Pages</a>
                                <ul>
                                    <li><a href="cart.html">Shopping Cart</a></li>
                                    <li><a href="wishlist.html">Wishlist</a></li>
                                    <li><a href="checkout.html">Checkout</a></li>
                                    <li><a href="my-account.html">My Account</a></li>
                                    <li><a href="login-register.html">Login / Register</a></li>
                                </ul>
                            </li>
                        </ul>

                    </li>
                    <li class="tm-header-nav-dropdown"><a href="blog.html">Blog</a>
                        <ul>
                            <li><a href="blog.html">Blog</a></li>
                            <li><a href="blog-leftsidebar.html">Blog Left Sidebar</a></li>
                            <li><a href="blog-details.html">Blog Details</a></li>
                            <li><a href="blog-details-leftsidebar.html">Blog Details Left Sidebar</a></li>
                        </ul>
                    </li>
                    <li><a href="contact.html">Contact</a></li>
                </ul>
            </nav>
        </div>
    </div>
    <!--// Header Bottom Area -->
</div>
</body>
</html>
