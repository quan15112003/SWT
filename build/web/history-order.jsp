<%-- 
    Document   : chart-product
    Created on : 21-Jun-2023, 11:43:30
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
        <%@include file="header-manage.jsp" %>
        <!-- Navbar Start -->
        <div class="container-fluid mb-5">
            <div class="row border-top px-xl-5">
                <div class="col-lg-3 d-none d-lg-block">
                    <%@include file="left-manager.jsp" %>
                </div>

                <div class="col-lg-9">


                    <div class='row'>


                        <div class="col-lg-12 table-responsive mb-12" style="margin-top: 15px">
                            <div class="input-group">
                                Year<input id="yearOrder" onkeypress="handle(event)"class="form-control" type="text" name="year">
                                Month<input id="monthOrder" onkeypress="handle(event)" class="form-control" type="text" name="month">
                                Day<input id="dayOrder" onkeypress="handle(event)" class="form-control" type="text" name="day">
                            </div>
                            <table class="table table-bordered text-center mb-0 list">
                                <thead class="bg-secondary text-dark list">
                                    <tr>
                                        <th>Order Id</th>
                                        <th>Customer Name</th>
                                        <th>Total Money</th>
                                        <th>Date</th>
                                        <th>Customer Location</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody class="align-middle " id="orderList">
                                    <c:forEach items="${listOrder}" var="o">
                                        <tr class="item">
                                            <td>${o.oId}</td>
                                            <td>${o.customer.info.fullName}</td>
                                            <td>${o.totalMoney}</td>
                                            <td>${o.date}</td>
                                            <td>${o.customer.info.regionCountry}</td>
                                            <td>
                                                <button class="btn btn-sm btn-primary" onclick="viewDetail(${o.oId},${sessionScope.acc.id})">
                                                    View Detail
                                                </button>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>

                        </div>
                        <table class="table table-bordered text-center mb-0">
                            <thead class="bg-secondary text-dark list">
                                <tr>
                                    <th>Product Name</th>
                                    <th>Order Id</th>
                                    <th>Material</th>
                                    <th>Size</th>
                                    <th>Quantity</th>
                                    <th>Price</th>
                                </tr>
                            </thead>
                            <tbody class="align-middle " id="orderDetail">

                            </tbody>   

                        </table>
                    </div>
                </div>
            </div>
            <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>           
            <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
            <script>
                                                    function handle(e) {
                                                        if (e.keyCode === 13) {
                                                            e.preventDefault(); // Ensure it is only this code that runs
                                                            var year = document.getElementById('yearOrder').value;
                                                            var month = document.getElementById('monthOrder').value;
                                                            var day = document.getElementById('dayOrder').value;
                                                            $.ajax({
                                                                url: "/project/search-order-customer",
                                                                type: "get",
                                                                data: {
                                                                    year: year,
                                                                    month: month,
                                                                    day: day,
                                                                    cusId: ${sessionScope.acc.id}
                                                                },
                                                                success: function (data) {
                                                                    var out = document.getElementById("orderList");
                                                                    out.innerHTML = data;
                                                                },
                                                                error: function (xhr) {
                                                                    //handle error
                                                                }
                                                            });
                                                        }
                                                    }
                                                    function viewDetail(oId, cId) {
                                                        console.log(oId + "==" + cId);
                                                        $.ajax({
                                                            url: "/project/view-detail-customer",
                                                            type: "get",
                                                            data: {
                                                                oId: oId,
                                                                cId: cId
                                                            },
                                                            success: function (data) {
                                                                var out = document.getElementById("orderDetail");
                                                                out.innerHTML = data;
                                                                loadItem();
                                                            },
                                                            error: function (xhr) {
                                                                //handle error
                                                            }
                                                        });
                                                    }
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
