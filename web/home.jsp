<%-- 
    Document   : home
    Created on : 24-May-2023, 14:17:31
    Author     : Hoang Long
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="img/icon.jpg" type="image/x-icon"/>
        <title>RiaShop- Your dream your world</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="Free HTML Templates" name="keywords">
        <meta content="Free HTML Templates" name="description">

        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet"> 

        <!-- Font Awesome -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
    </head>
    <body>
        <!-- Topbar Start --> 
        <%@include file="header.jsp" %>
        <!-- Topbar End -->


        <!-- Navbar Start -->
        <div class="container-fluid mb-5">
            <div class="row border-top px-xl-5">
                <div class="col-lg-3 d-none d-lg-block">
                    <%@include file="left-page.jsp" %>
                </div>
                <div class="col-lg-9">
                    <%@include file="right-page.jsp" %>
                    <%@include file="banner.jsp" %>
                </div>
            </div>
        </div>
        <!-- Navbar End -->


        <!-- Featured Start -->
        <div class="container-fluid pt-5">
            <div class="row px-xl-5 pb-3">
                <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                    <div class="d-flex align-items-center border mb-4" style="padding: 30px;">
                        <h1 class="fa fa-check text-primary m-0 mr-3"></h1>
                        <h5 class="font-weight-semi-bold m-0">Quality Product</h5>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                    <div class="d-flex align-items-center border mb-4" style="padding: 30px;">
                        <h1 class="fa fa-shipping-fast text-primary m-0 mr-2"></h1>
                        <h5 class="font-weight-semi-bold m-0">Free Shipping</h5>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                    <div class="d-flex align-items-center border mb-4" style="padding: 30px;">
                        <h1 class="fas fa-exchange-alt text-primary m-0 mr-3"></h1>
                        <h5 class="font-weight-semi-bold m-0">14-Day Return</h5>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                    <div class="d-flex align-items-center border mb-4" style="padding: 30px;">
                        <h1 class="fa fa-phone-volume text-primary m-0 mr-3"></h1>
                        <h5 class="font-weight-semi-bold m-0">24/7 Support</h5>
                    </div>
                </div>
            </div>
        </div>
        <!-- Featured End -->


        <!-- Categories Start -->
        <div class="container-fluid pt-5">
            <div class="row px-xl-5 pb-3">
                <c:forEach items="${listC}" var="o">
                    <div class="col-lg-4 col-md-6 pb-1">
                        <div class="cat-item d-flex flex-column border mb-4" style="padding: 30px;">
                            <p class="text-right">15 Products</p>
                            <a href="category?cid=${o.id}" class="cat-img position-relative overflow-hidden mb-3">
                                <img class="img-fluid" src="${o.image}" alt="">
                            </a>
                            <h5 class="font-weight-semi-bold m-0">${o.name}</h5>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
        <!-- Categories End -->


        <!-- Offer Start -->
        <div class="container-fluid offer pt-5">
            <div class="row px-xl-5">
                <div class="col-md-6 pb-4">
                    <div class="position-relative bg-secondary text-center text-md-right text-white mb-2 py-5 px-5">
                        <img src="img/offer1r.png" alt="">
                        <div class="position-relative" style="z-index: 1;">
                            <h5 class="text-uppercase text-primary mb-3">Bonus Accessory</h5>
                            <h1 class="mb-4 font-weight-semi-bold">Badge</h1>
                            <a href="search?search=" class="btn btn-outline-primary py-md-2 px-md-3">Shop Now</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 pb-4">
                    <div class="position-relative bg-secondary text-center text-md-left text-white mb-2 py-5 px-5">
                        <img src="img/offer2r.png" alt="">
                        <div class="position-relative" style="z-index: 1;">
                            <h5 class="text-uppercase text-primary mb-3">Limited Edition</h5>
                            <h1 class="mb-4 font-weight-semi-bold">Poster</h1>
                            <a href="search?search=" class="btn btn-outline-primary py-md-2 px-md-3">Shop Now</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Offer End -->


        <!-- Products Start -->
        <div class="container-fluid pt-5">
            <div class="text-center mb-4">
                <h2 class="section-title px-5"><span class="px-2">Trandy Products</span></h2>
            </div>
            <div class="row px-xl-5 pb-3">
                <c:forEach items="${listP}" var="o">
                    <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                        <div class="card product-item border-0 mb-4">
                            <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                                <a href="product?id=${o.id}">
                                    <img class="img-fluid w-100" src="${o.image}" alt="">
                                </a>
                            </div>
                            <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                                <h6 class="text-truncate mb-3">${o.name}</h6>
                                <div class="d-flex justify-content-center">
                                    <h6>${o.price}$</h6><h6 class="text-muted ml-2"><del>${o.price*1.2}$</del></h6>
                                </div>
                            </div>
                            <div class="card-footer d-flex justify-content-between bg-light border">
                                <a href="product?id=${o.id}" class="btn btn-sm text-dark p-0"><i class="fas fa-eye text-primary mr-1"></i>View Detail</a>
                                <button onclick="addToCart(${o.id},${o.size.id},${o.mat.id},1)" class="btn btn-sm text-dark p-0"><i class="fas fa-shopping-cart text-primary mr-1"></i>Add To Cart</button>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
        <!-- Products End -->
        <!-- Products Start -->
        <div class="container-fluid pt-5">
            <div class="text-center mb-4">
                <h2 class="section-title px-5"><span class="px-2">Just Arrived</span></h2>
            </div>
            <div class="row px-xl-5 pb-3">
                <c:forEach items="${listN}" var="o">
                    <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                        <div class="card product-item border-0 mb-4">
                            <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                                <a href="product?id=${o.id}">
                                    <img class="img-fluid w-100" src="${o.image}" alt="">
                                </a>
                            </div>
                            <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                                <h6 class="text-truncate mb-3">${o.name}</h6>
                                <div class="d-flex justify-content-center">
                                    <h6>${o.price}$</h6><h6 class="text-muted ml-2"><del>${o.price*1.2}$</del></h6>
                                </div>
                            </div>
                            <div class="card-footer d-flex justify-content-between bg-light border">
                                <a href="product?id=${o.id}" class="btn btn-sm text-dark p-0"><i class="fas fa-eye text-primary mr-1"></i>View Detail</a>
                                <button onclick="addToCart(${o.id},${o.size.id},${o.mat.id},1)" class="btn btn-sm text-dark p-0"><i class="fas fa-shopping-cart text-primary mr-1"></i>Add To Cart</button>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
        <!-- Products End -->

        <%@include file="footer.jsp" %>

        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/owlcarousel/owl.carousel.min.js"></script>

        <!-- Contact Javascript File -->
        <script src="mail/jqBootstrapValidation.min.js"></script>
        <script src="mail/contact.js"></script>

        <!-- Template Javascript -->
        <script src="js/main.js"></script>
        <script src="js/addToCart.js"></script>
                                   
        
    </body>
</html>
