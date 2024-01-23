<%-- 
    Document   : product
    Created on : 28-May-2023, 21:29:39
    Author     : Hoang Long
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <link href="css/stylePaging.css" rel="stylesheet">
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
                    <!-- Price Start -->
                    <div class="border-bottom mb-4 pb-4">
                        <h5 class="font-weight-semi-bold mb-4" style="margin-top: 20px">Filter by price</h5>
                        <form action="filter">
                            <input type="hidden" value="${cId}" name="cid"/>
                            <input type="hidden" value="${search}" name="search"/>
                            <div class="custom-control d-flex align-items-center justify-content-between mb-3">
                                <label  for="price-min">Min Price</label>
                                <input required style="width: 100%" min="0" step="50" type="number"  id="price-min"  name="minPrice" value="${minPrice}">
                            </div>
                            <div class="custom-control d-flex align-items-center justify-content-between mb-3">
                                <label  for="price-max">Max Price</label>
                                <input required style="width: 100%" step="50" type="number"  id="price-max" min="0" name="maxPrice" value="${maxPrice}">
                            </div>
                            <div class="custom-control d-flex align-items-center justify-content-between mb-3" style="margin-top: 10px;padding-left: 0px">
                                <input type="submit" value="Filter" style="color: #FFFFFF;background-color: #FF3B54;border: none; width: 50%;border-radius: 5px;">
                            </div>

                        </form>
                    </div>
                    <!-- Price End -->
                </div>
                <div class="col-lg-9 right" >
                    <%@include file="right-page.jsp" %>
                    <div class="nav-item dropdown" style="display: flex;">
                        <h3 style="color: #FF0D54;" class=" nav-link dropdown-toggle" data-toggle="dropdown">Sort by</h3>
                        <div class="dropdown-menu  rounded-0 m-0">
                            <form action="sort" onclick="this.submit()" class="dropdown-item">A to Z
                                <input type="hidden" value="name asc" name="op"/>
                                <input type="hidden" value="${cId}" name="cid"/>
                                <input type="hidden" value="${search}" name="search"/>
                                <input type="hidden" name="minPrice" value="${minPrice}"/>
                                <input type="hidden" name="maxPrice" value="${maxPrice}"/>
                            </form>
                            <form action="sort" onclick="this.submit()" class="dropdown-item">Z to A
                                <input type="hidden" value="name desc" name="op"/>
                                <input type="hidden" value="${cId}" name="cid"/>
                                <input type="hidden" value="${search}" name="search"/>
                                <input type="hidden" name="minPrice" value="${minPrice}"/>
                                <input type="hidden" name="maxPrice" value="${maxPrice}"/>
                            </form>
                            <form action="sort" onclick="this.submit()" class="dropdown-item">Category
                                <input type="hidden" value="cid" name="op"/>
                                <input type="hidden" value="${cId}" name="cid"/>
                                <input type="hidden" value="${search}" name="search"/>
                                <input type="hidden" name="minPrice" value="${minPrice}"/>
                                <input type="hidden" name="maxPrice" value="${maxPrice}"/>
                            </form>


                            <form action="sort" onclick="this.submit()" class="dropdown-item">Min to Max
                                <input type="hidden" value="price asc" name="op"/>
                                <input type="hidden" value="${cId}" name="cid"/>
                                <input type="hidden" value="${search}" name="search"/>
                                <input type="hidden" name="minPrice" value="${minPrice}"/>
                                <input type="hidden" name="maxPrice" value="${maxPrice}"/>
                            </form>
                            <form action="sort" onclick="this.submit()" class="dropdown-item">Max to Min
                                <input type="hidden" value="price desc" name="op"/>
                                <input type="hidden" value="${cId}" name="cid"/>
                                <input type="hidden" value="${search}" name="search"/>
                                <input type="hidden" name="minPrice" value="${minPrice}"/>
                                <input type="hidden" name="maxPrice" value="${maxPrice}"/>
                            </form>
                        </div>
                    </div>
                    <div id="found"></div>        
                    <div class="row px-xl-5 pb-3 list" id="list">
                        <c:forEach items="${listP}" var="o">
                            <div class="col-lg-4 col-md-6 col-sm-12 pb-1 item">
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
                                        <button onclick="addToCart(${o.id},${o.size.id},${o.mat.id}, 1)"  class="btn btn-sm text-dark p-0"><i class="fas fa-shopping-cart text-primary mr-1"></i>Add To Cart</button>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                        <div class="col-12 pb-1 ">
                            <nav aria-label="Page navigation">
                                <ul class="listPage">

                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Navbar End -->


        <%@include file="footer.jsp" %>

        <!-- Back to Top -->
        <a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>


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
        <script src="js/paging.js"></script>
        <script src="js/addToCart.js"></script>

    </body>
</html>
