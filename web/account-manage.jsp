<%-- 
    Document   : product-manage
    Created on : 04-Jun-2023, 12:49:51
    Author     : Hoang Long
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="img/icon.jpg" type="image/x-icon"/>
        <title>RiaShop- ManageProduct</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="Free HTML Templates" name="keywords">
        <meta content="Free HTML Templates" name="description">

        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet"> 

        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <!-- Libraries Stylesheet -->
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
        <link href="css/stylePaging.css" rel="stylesheet">
    </head>
    <body>
        <!-- Topbar Start --> 
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
                        <div class="row  py-2 ">


                            <div class="col-lg-12 table-responsive mb-12" style="margin-top: 15px">
                                <table class="table table-bordered text-center mb-0 list">
                                    <thead class="bg-secondary text-dark list">
                                        <tr>
                                            <th>Account ID</th>
                                            <th>Account Name</th>
                                            <th>isSeller</th>
                                            <th>Status</th>
                                        </tr>
                                    </thead>
                                    <tbody class="align-middle " >
                                        <c:forEach items="${list}" var="o">
                                            <tr class="item">
                                                <td class="align-middle">${o.id}</td>
                                                <td class="align-middle"> ${o.account}</td>
                                                <td class="align-middle">
                                                    <form id="setSeller${o.id}" action="change-seller-status" method="post">
                                                        <input type="hidden" name="id" value="${o.id}">
                                                        <select name="isSeller" id="setPosition" onchange="setSeller(${o.id})">
                                                            <option value="1" <c:if test="${o.isSell eq 1}">selected</c:if>>Seller</option>
                                                            <option value="0" <c:if test="${o.isSell != 1}">selected</c:if>>Not a Seller</option>
                                                            </select>
                                                        </form>
                                                    </td>
                                                    <td>
                                                    <c:if test="${o.isAdmin == -1}">
                                                        <div style="display: flex;align-items: center;justify-content: center">
                                                            <i class="fa fa-circle"style="color: grey; margin-right: 5px"></i>
                                                            <form action="change-status" method="post">
                                                                <input type="hidden" name="id" value="${o.id}">
                                                                <input type="hidden" name="status" value="0">
                                                                <input type="submit" value="Active">
                                                            </form>
                                                        </div>

                                                    </c:if>
                                                    <c:if test="${o.isAdmin != -1}">
                                                        <div style="display: flex;align-items: center;justify-content: center">
                                                            <i class="fa fa-circle" style="color: #00c300; margin-right: 5px"></i>
                                                            <form action="change-status" method="post">
                                                                <input type="hidden" name="id" value="${o.id}">
                                                                <input type="hidden" name="status" value="-1">
                                                                <input type="submit" value="Disable">
                                                            </form>
                                                        </div>

                                                    </c:if>

                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                                <div class="col-12 pb-1 ">
                                    <nav aria-label="Page navigation">
                                        <ul class="listPage">

                                        </ul>
                                    </nav>
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
        <script>
                                                            function setSeller(id) {
                                                                document.getElementById("setSeller" + id).submit();
                                                            }
                                                            $('.changeStatus').on('click', function () {
                                                                $('#changeStatus').submit();
                                                            });

                                                            let thisPage = 1;
                                                            let limit = 6;
                                                            let list = document.querySelectorAll('.list .item');

                                                            function loadItem() {
                                                                let beginGet = limit * (thisPage - 1);
                                                                let endGet = limit * thisPage - 1;
                                                                list.forEach((item, key) => {
                                                                    if (key >= beginGet && key <= endGet) {
                                                                        item.style.display = 'table-row';
                                                                    } else {
                                                                        item.style.display = 'none';
                                                                    }
                                                                });
                                                                listPage();
                                                            }
                                                            loadItem();

                                                            function listPage() {
                                                                let count = Math.ceil(list.length / limit);
                                                                document.querySelector('.listPage').innerHTML = '';
                                                                if (list.length == 0) {
                                                                    let notFound = document.createElement('h1');
                                                                    notFound.innerHTML = 'Not found any items';
                                                                    notFound.style = 'text-align: center;align-items: center;color: #6F6F6F;';
                                                                    notFound.classList.add('page-item');
                                                                    document.querySelector('.right').appendChild(notFound);
                                                                }
                                                                if (thisPage != 1 && list.length != 0) {
                                                                    let prev = document.createElement('li');
                                                                    prev.innerHTML = '<<';
                                                                    prev.setAttribute('onclick', "changePage(" + (thisPage - 1) + ")");
                                                                    prev.classList.add('page-item');
                                                                    document.querySelector('.listPage').appendChild(prev);
                                                                }

                                                                for (i = 1; i <= count; i++) {
                                                                    let newPage = document.createElement('li');
                                                                    newPage.innerText = i;
                                                                    if (i == thisPage) {
                                                                        newPage.classList.add('active');
                                                                    }
                                                                    newPage.classList.add('page-item');
                                                                    newPage.setAttribute('onclick', "changePage(" + i + ")");
                                                                    document.querySelector('.listPage').appendChild(newPage);
                                                                }

                                                                if (thisPage != count && list.length != 0) {
                                                                    let next = document.createElement('li');
                                                                    next.innerText = '>>';
                                                                    next.setAttribute('onclick', "changePage(" + (thisPage + 1) + ")");
                                                                    next.classList.add('page-item');
                                                                    document.querySelector('.listPage').appendChild(next);
                                                                }

                                                            }

                                                            function changePage(i) {
                                                                thisPage = i;
                                                                loadItem();
                                                            }
        </script>

    </body>
</html>
