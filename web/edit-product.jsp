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
        <title>RiaShop- Adding Product</title>
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
        <!-- Contact Start -->
        <div class="container-fluid pt-5">
            <div class="text-center mb-4">
                <h2 class="section-title px-5"><span class="px-2">Edit Product</span></h2>
            </div>
            <div class="row px-xl-5">
                <div class="col-lg-7 mb-5">
                    <div class="contact-form">
                        <div id="success"></div>
                        <form action="edit-product" method="post" >
                            <div class="control-group">
                                <input type="text" class="form-control" name="id"
                                       readonly="" value="${p.id}"  />
                            </div>
                            <div class="control-group">
                                <input type="text" class="form-control"  value="${p.name}" name="name" id="name" placeholder="Product name"
                                       required="required" data-validation-required-message="Please enter your product name" />
                                <p class="help-block text-danger"></p>
                            </div>
                            <div class="control-group">
                                <input type="number" class="form-control" value="${p.price}" name="price" id="price" placeholder="Price"
                                       required="required" data-validation-required-message="Please enter your price" />
                                <p class="help-block text-danger"></p>
                            </div>
                            <div class="control-group">
                                <input type="number" class="form-control"  value="${p.quantity}" name="quantity" id="quantity" placeholder="Quantity"
                                       required="required" data-validation-required-message="Please enter your quantity" />
                                <p class="help-block text-danger"></p>
                            </div>
                            <div class="control-group">
                                <input type="file" class="form-control"  value="${p.image}"  name="image" id="image" placeholder="Image"
                                       required="required" data-validation-required-message="Please upload your image " />
                                <p class="help-block text-danger"></p>
                            </div>

                            <div class="control-group">
                                <textarea class="form-control" rows="6"  name="description" id="description" placeholder="Description"
                                          required="required"
                                          data-validation-required-message="Please enter your description">${p.description}</textarea>
                                <p class="help-block text-danger"></p>
                            </div>
                            <div class="control-group">
                                <select class="form-control" name="category"  required="required" data-validation-required-message="Please choose your category">
                                    <c:forEach items="${listC}" var="o">
                                        <option ${p.cate.id == o.id?'selected':''} value="${o.id}">${o.name}</option>
                                    </c:forEach>
                                </select>
                                <p class="help-block text-danger"></p>
                            </div>
                            <div class="control-group">
                                <select class="form-control" name="size"   required="required" data-validation-required-message="Please choose your size">
                                    <c:forEach items="${listS}" var="o">
                                        <option <c:if test="${param.sizeId eq o.id}">selected</c:if> value="${o.id}">${o.name}</option>
                                    </c:forEach>
                                </select>
                                <p class="help-block text-danger"></p>
                                <input type="hidden" value="${param.sizeId}" name="old_size">
                            </div>
                            <div class="control-group">
                                <select class="form-control" name="material"  required="required" data-validation-required-message="Please choose your material">
                                    <c:forEach items="${listM}" var="o">
                                        <option <c:if test="${param.matId eq o.id}">selected</c:if> value="${o.id}">${o.name}</option>
                                    </c:forEach>
                                </select>
                                <p class="help-block text-danger"></p>
                                <input type="hidden" value="${param.matId}" name="old_material">
                            </div> 

                            <div>
                                <input class="btn btn-primary py-2 px-4" type="submit" value="Save"></>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="col-lg-5 mb-5">
                    
                </div>
            </div>
        </div>
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
