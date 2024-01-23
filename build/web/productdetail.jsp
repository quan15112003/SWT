<%-- 
    Document   : product
    Created on : 27-May-2023, 21:46:12
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
        <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.css" rel="stylesheet">
    </head>
    <body>
        <%@include file="header.jsp" %>>
        <div class="container-fluid mb-5">
            <div class="row border-top px-xl-5">
                <div class="col-lg-3 d-none d-lg-block">
                    <%@include file="left-page.jsp" %>
                </div>
                <div class="col-lg-9">
                    <%@include file="right-page.jsp" %>
                    <!-- Shop Detail Start -->

                    <div class="container-fluid py-5">
                        <div class="row px-xl-5">
                            <div class="col-lg-5 pb-5">
                                <div id="product-carousel" class="carousel slide" data-ride="carousel">
                                    <div class="carousel-inner border">
                                        <div class="carousel-item active">
                                            <img class="w-100 h-100" src="${p.image}" alt="Image">
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-7 pb-5">
                                <h3 class="font-weight-semi-bold">${p.name}</h3>
                                <div class="d-flex mb-3">

                                </div>
                                <h3 class="font-weight-semi-bold mb-4" id="price">
                                    ${p.price}$   <del style="color: grey">${p.price*1.2}$</del>
                                </h3>
                                <p class="mb-4">${p.description}</p>

                                <div class="d-flex mb-3">
                                    <p class="text-dark font-weight-medium mb-0 mr-3">Materials:</p>
                                    <form>
                                        <c:forEach items="${listMat}" var="o">

                                            <div class="custom-control custom-radio custom-control-inline">
                                                <input type="radio" <c:if test="${o.name eq p.mat.name}">checked</c:if> class="custom-control-input calculate" value="${o.id}" id="material-${o.id}" name="material">
                                                <label class="custom-control-label" for="material-${o.id}">${o.name}</label>
                                            </div>
                                        </c:forEach>
                                    </form>
                                </div>

                                <div class="d-flex mb-3">
                                    <p class="text-dark font-weight-medium mb-0 mr-3">Size: </p>
                                    <form>
                                        <c:forEach items="${listSize}" var="o">
                                            <div class="custom-control custom-radio custom-control-inline">
                                                <input type="radio" <c:if test="${o.name eq p.size.name}">checked</c:if> class="custom-control-input calculate" value="${o.id}" id="size-${o.id}" name="size">
                                                <label class="custom-control-label" for="size-${o.id}">${o.name}</label>
                                            </div>
                                        </c:forEach>
                                    </form>
                                </div>


                                <div class="d-flex mb-3" id="quantity">
                                    Quantity: <p id="valQ">${p.quantity}</p>
                                </div>
                                <div class="d-flex mb-4">

                                </div>
                                <div class="d-flex align-items-center mb-4 pt-2">
                                    <div class="input-group quantity mr-3" style="width: 130px;">
                                        <div class="input-group-btn">
                                            <button id="minus" class="btn btn-primary btn-minus" disabled>
                                                <i class="fa fa-minus"></i>
                                            </button>
                                        </div>
                                        <input id="quantity_input" type="text" readonly class="form-control bg-secondary text-center" value="1" maxlength="3">
                                        <div class="input-group-btn">
                                            <button id="plus" class="btn btn-primary btn-plus" >
                                                <i class="fa fa-plus"></i>
                                            </button>
                                        </div>
                                    </div>
                                    <button id="addToCart" class="btn btn-primary px-3" onclick="addToCart2()"><i class="fa fa-shopping-cart mr-1"></i> Add To Cart</button>
                                </div>

                            </div>
                        </div>

                    </div>
                    <!-- Shop Detail End -->
                </div>
            </div>
        </div>
        <div class="row" style="margin:5px">
            <div class="col-md-12">
                <div style="margin-bottom: 10px">
                    <h4 class="mb-4" style="text-align: center">Comment</h4>
                    <textarea id="content_comment" name="content"></textarea>
                    <button id="comment">Comment</button>
                </div>

                <h4 class="mb-4" style="text-align: center">Review for ${p.name}</h4>
                <div id="comment-post">
                    <c:if test="${p.totalComment == 0}">
                        <h4 class="mb-4" style="text-align: center">Recently, there has been no comment.</h4>
                    </c:if>
                    <c:forEach items="${p.comments}" var="o" begin="0" end="3">
                        <div class="media mb-4">
                            <img src="${o.user.info.avatar}" alt="Image" class="img-fluid mr-3 mt-1" style="width: 45px;">
                            <div class="media-body">
                                <h6>${o.user.info.fullName}<small> - <i>${o.date}</i></small></h6>

                                <p>${o.content}</p>
                            </div>
                        </div>
                    </c:forEach>

                </div>
                <c:if test="${p.totalComment >= 4}">
                    <button id="loadMore" >Load more comment</button>
                </c:if>

            </div>
        </div>                        
        <!-- Products Start -->
        <div class="container-fluid py-5">
            <div class="text-center mb-4">
                <h2 class="section-title px-5"><span class="px-2">You May Also Like</span></h2>
            </div>
            <div class="row px-xl-5">
                <div class="col">
                    <div class="owl-carousel related-carousel">
                        <c:forEach items="${listP}" var="o">
                            <div class="card product-item border-0">
                                <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                                    <img class="img-fluid w-100" src="${o.image}" alt="">
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
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
        <!-- Products End -->
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
        <script src="js/addToCart.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.js"></script>

        <script>
                                        $('#loadMore').on('click', function () {
                                            var start = document.getElementById("comment-post").childElementCount;
                                            console.log(start);

                                            var pId = ${p.id};
                                            $.ajax({
                                                url: "/project/comment",
                                                type: "post",
                                                data: {
                                                    pId: pId,
                                                    start: start
                                                },
                                                success: function (data) {
                                                    var out = document.getElementById("comment-post");
                                                    out.innerHTML += data;
                                                    start = document.getElementById("comment-post").childElementCount;
                                                    if (start >= ${p.totalComment}) {
                                                        document.getElementById('loadMore').style.display = "none";
                                                    }
                                                },
                                                error: function (xhr) {
                                                    //handle error
                                                }
                                            });

                                        });
                                        $('#comment').on('click', function () {
                                            var content = $('#content_comment').val();
                                            $('#content_comment').summernote('reset');
            <c:if test="${sessionScope.acc != null}">
                                            var uId = ${sessionScope.acc.id};
                                            var pId = ${p.id};
                                            console.log(content + "--" + pId + "--" + uId);
                                            $.ajax({
                                                url: "/project/comment",
                                                type: "get",
                                                data: {
                                                    pId: pId,
                                                    content: content
                                                },
                                                success: function (data) {
                                                    var out = document.getElementById("comment-post");
                                                    out.innerHTML = data;
                                                },
                                                error: function (xhr) {
                                                    //handle error
                                                }
                                            });
            </c:if>
            <c:if test="${sessionScope.acc == null}">
                                            alert("You need to login to comment!!!");
            </c:if>



                                        });
                                        $('#content_comment').summernote();
                                        $('#plus').on('click', function () {
                                            var quantityMax = $('#valQ').text();
                                            var quantity = parseFloat($('#quantity_input').val());
                                            if (quantity == quantityMax - 1) {
                                                $('#quantity_input').val(quantityMax)
                                                $('#plus').prop('disabled', true);
                                            } else {
                                                $('#quantity_input').val(quantity + 1)
                                                $('#minus').removeAttr("disabled");

                                            }

                                        });
                                        $('#minus').on('click', function () {
                                            var quantity = parseFloat($('#quantity_input').val());
                                            if (quantity == 1) {
                                                $('#quantity_input').val(0)
                                                $('#minus').prop('disabled', true);
                                            } else {
                                                $('#quantity_input').val(quantity - 1)
                                                $('#plus').removeAttr("disabled");
                                            }

                                        });

                                        function change(price, quantity) {
                                            document.getElementById('price').innerHTML = price + '$   <del style="color: grey">' + (price * 1.2) + '$</del>';
                                            document.getElementById('quantity').innerHTML = 'Quantity:' + '<p id = "valQ">' + quantity + '</p>';

                                        }
                                        function addToCart2() {
                                            pId = ${p.id};
                                            mId = $('input[name="material"]:checked').val();
                                            sId = $('input[name="size"]:checked').val();
                                            console.log(mId)
                                            console.log(sId)
                                            var quantity = parseFloat($('#quantity_input').val());
                                            form = document.getElementById("addToCart");
                                            txtCart = getCookie('cart');
                                            console.log(txtCart);
                                            eraseCookie('cart');
                                            if (txtCart == null) {
                                                txtCart = pId + ":" + sId + ":" + mId + ":" + quantity;
                                            } else {
                                                txtCart = txtCart + "/" + pId + ":" + sId + ":" + mId + ":" + quantity;
                                            }
                                            console.log(txtCart);
                                            num = parseInt(document.getElementById('numberCart').innerHTML);
                                            console.log(num);
                                            document.getElementById('numberCart').innerHTML = num + 1;
                                            setCookie("cart", txtCart, 2);
                                            alert('Add to cart success!!');
                                        }
                                        function setCookie(name, value, days) {
                                            var expires = "";
                                            if (days) {
                                                var date = new Date();
                                                date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
                                                expires = "; expires=" + date.toUTCString();
                                            }
                                            document.cookie = name + "=" + (value || "") + expires + "; path=/";
                                        }
                                        function getCookie(name) {
                                            var nameEQ = name + "=";
                                            var ca = document.cookie.split(';');
                                            for (var i = 0; i < ca.length; i++) {
                                                var c = ca[i];
                                                while (c.charAt(0) == ' ')
                                                    c = c.substring(1, c.length);
                                                if (c.indexOf(nameEQ) == 0)
                                                    return c.substring(nameEQ.length, c.length);
                                            }
                                            return null;
                                        }
                                        function eraseCookie(name) {
                                            document.cookie = name + '=; Max-Age=-99999999;';
                                        }
                                        $('.calculate').on('click', function () {
                                            mId = $('input[name="material"]:checked').val();
                                            sId = $('input[name="size"]:checked').val();
                                            //                console.log(mId)               
                                            //                console.log(sId)               
                                            var price, quantity;
            <c:forEach items="${pList}" var="o">

                                            if (mId == ${o.mat.id} && sId == ${o.size.id}) {

                                                price = ${o.price};
                                                quantity = ${o.quantity};
                                            }
            </c:forEach>
                                            document.getElementById('price').innerHTML = price + '$   <del style="color: grey">' + (price * 1.2) + '$</del>';
                                            document.getElementById('quantity').innerHTML = 'Quantity:' + '<p id = "valQ">' + quantity + '</p>';
                                            var quantityMax = $('#valQ').text();
                                            if (quantityMax == 0) {
                                                $('#addToCart').prop('disabled', true);
                                            } else {
                                                $('#addToCart').removeAttr("disabled");
                                            }
                                        });

        </script>
        <script src="js/main.js"></script>
    </body>
</html>
