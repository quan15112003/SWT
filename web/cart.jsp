<%-- 
    Document   : cart
    Created on : 11-Jun-2023, 20:16:15
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
                </div>
            </div>
        </div>
        <!-- Navbar End -->
        <div class="container-fluid pt-5">
            <div class="row px-xl-5">
                <div class="col-lg-8 table-responsive mb-5">
                    <table class="table table-bordered text-center mb-0">
                        <thead class="bg-secondary text-dark">
                            <tr>
                                <th>No</th>
                                <th>Products</th>
                                <th>Price</th>

                                <th>Quantity</th>
                                <th>Total</th>
                                <th>Remove</th>
                            </tr>
                        </thead>
                        <tbody class="align-middle">
                            <c:set var="i" value="0"/>
                            <c:forEach items="${cart.items}" var="o" >
                                <tr>
                                    <c:set var="i" value="${i+1}"/>
                                    <td>${i}</td>
                                    <td class="align-middle"><img src="${o.product.image}" alt="" style="width: 50px;"> ${o.product.name}</td>
                                    <td class="align-middle">${o.price}$</td>

                                    <td class="align-middle">
                                        <div class="input-group quantity mx-auto" style="width: 100px;">
                                            <div class="input-group-btn">
                                                <a href="process?num=-1&pId=${o.product.id}&sizeId=${o.product.size.id}&matId=${o.product.mat.id}">
                                                    <button class="btn btn-sm btn-primary btn-minus" >
                                                        <i class="fa fa-minus"></i>
                                                    </button>
                                                </a>
                                            </div>
                                            <input type="text" readonly="" class="form-control form-control-sm bg-secondary text-center" value="${o.quantity}">
                                            <div class="input-group-btn">
                                                <a href="process?num=1&pId=${o.product.id}&sizeId=${o.product.size.id}&matId=${o.product.mat.id}">
                                                    <button class="btn btn-sm btn-primary btn-plus">
                                                        <i class="fa fa-plus"></i>
                                                    </button>
                                                </a>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="align-middle">${o.price*o.quantity}</td>
                                    <td class="align-middle">
                                        <form action="process" method="post">
                                            <input type="hidden" name="pId" value="${o.product.id}">
                                            <input type="hidden" name="sizeId" value="${o.product.size.id}">
                                            <input type="hidden" name="matId" value="${o.product.mat.id}">
                                            <input type="submit" value="x" class="btn btn-sm btn-primary"/>
                                        </form>
                                    </td>

                                </tr>
                            </c:forEach>    
                        </tbody>
                    </table>
                </div>
                <div class="col-lg-4">

                    <div class="card border-secondary mb-5">
                        <div class="card-header bg-secondary border-0">
                            <h4 class="font-weight-semi-bold m-0">Cart Summary</h4>
                        </div>
                        <div class="card-body">
                            <c:forEach items="${cart.items}" var="o" >
                                <div class="d-flex justify-content-between mb-3 pt-1">
                                    <h6 class="font-weight-medium">${o.product.name}</h6>
                                    <h6 class="font-weight-medium">${o.price*o.quantity}$</h6>
                                    
                                </div>
                            </c:forEach>

                        </div>
                        <div class="card-footer border-secondary bg-transparent">
                            <div class="d-flex justify-content-between mt-2">
                                <h5 class="font-weight-bold">Total</h5>
                                <h5 class="font-weight-bold">$ ${cart.totalMoney}</h5>
                            </div>
                            <<form action="checkout" method="post">
                                <input type="submit" value="Proceed To Checkout" class="btn btn-block btn-primary my-3 py-3"/>
                            </form>>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Cart End -->
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
    </body>
</html>
