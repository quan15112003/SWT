<%-- 
    Document   : adding-product
    Created on : 04-Jun-2023, 21:44:49
    Author     : Hoang Long
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="img/icon.jpg" type="image/x-icon"/>
        <title>RiaShop- Adding Category</title>
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
        <div class="container-fluid">

            <div class="row align-items-center py-3 px-xl-5">
                <div class="col-lg-3 d-none d-lg-block">
                    <a href="home" class="text-decoration-none">
                        <h1 class="m-0 display-5 font-weight-semi-bold"><span class="text-primary font-weight-bold border px-3 mr-1">Ria</span>Shop</h1>
                    </a>
                </div>
                <div class="col-lg-9 col-12 text-left">
                    <%@include file="right-page.jsp" %>
                </div>

            </div>
            <div class="container-fluid mb-5">
                <div class="row border-top px-xl-5">
                    <div class="col-lg-3 d-none d-lg-block">
                        <%@include file="left-manager.jsp" %>
                    </div>
                    <div class="col-lg-9">
                        <div class="container-fluid pt-5">
                            <div class="text-center mb-4">
                                <h2 class="section-title px-5"><span class="px-2">Adding Category</span></h2>
                            </div>
                            <div class="row px-xl-5">
                                <div class="col-lg-12 mb-5">
                                    <div class="contact-form">
                                        <div id="success"></div>
                                        <form action="add-category" method="post" >
                                            <div class="control-group">
                                                <input type="text" class="form-control" name="name" id="name" placeholder="Category name"
                                                       required="required" data-validation-required-message="Please enter your category name" />
                                                <p class="help-block text-danger"></p>
                                            </div>

                                            <div class="control-group">
                                                <input type="file" class="form-control" name="image" id="image" placeholder="Image"
                                                       required="required" data-validation-required-message="Please upload your image " />
                                                <p class="help-block text-danger"></p>
                                            </div>




                                            <div>
                                                <input class="btn btn-primary py-2 px-4" type="submit" value="Add Category"></>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                                <div class="col-lg-5 mb-5">

                                </div>
                            </div>
                        </div>

                    </div>
                    <!-- Topbar End -->


                </div>
            </div>
        </div>


        <!-- Cart End -->
        <%@include file="footer.jsp" %>
        <!-- Contact Start -->

        <!-- Contact End -->
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
        <script src="<c:url value='../../test/ckeditor/ckeditor.js' />"></script>
        <script>
            CKEDITOR.replace('description');
        </script>
    </body>
</html>
