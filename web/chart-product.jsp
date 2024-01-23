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
                    <c:if test="">

                    </c:if>
                    <h3>Number of Product upload: ${numProUp}</h3>
                    <h3>Total profit: ${totalProfit}</h3>
                    <h3>Total Number Customers: ${totalCustomer}</h3>
                    <h3>Total Number Product sold today: ${totalSold}</h3>

                    <div class='row'>
                        <div class="col-6">
                            <canvas id="myChart1"></canvas>
                        </div>
                        <div class="col-6">
                            <form id="formYear" action="chart-product" method="post">
                                Year: 
                                <select id="year" name="year">
                                    <option value="2023" <c:if test="${year == 2023}">selected</c:if>>2023</option>
                                    <option value="2022"<c:if test="${year == 2022}">selected</c:if>>2022</option>
                                    <option value="2021"<c:if test="${year == 2021}">selected</c:if>>2021</option>
                                    <option value="2020"<c:if test="${year == 2020}">selected</c:if>>2020</option>
                                    <option value="2019"<c:if test="${year == 2019}">selected</c:if>>2019</option>
                                    <option value="2018"<c:if test="${year == 2018}">selected</c:if>>2018</option>

                                    </select>
                                </form>
                                <canvas id="myChart2"></canvas>

                            </div>
                            <div class="col-6">
                                <canvas id="myChart3"></canvas>
                            </div>
                            <div class="col-6">
                                <canvas id="myChart4"></canvas>
                            </div>
                        </div>

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
                                            <button class="btn btn-sm btn-primary" onclick="viewDetail(${o.oId},${o.sId})">
                                                View Detail
                                            </button>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                            <div class="col-12 pb-1 " id="listPage">
                            <nav aria-label="Page navigation">
                                <ul class="listPage">

                                </ul>
                            </nav>
                        </div>
                    </div>
                    <table class="table table-bordered text-center mb-0">
                        <thead class="bg-secondary text-dark list">
                            <tr>
                                <th>Order Id</th>
                                <th>Product Name</th>
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
                                                function handle(e){
                                                if (e.keyCode === 13){
                                                e.preventDefault(); // Ensure it is only this code that runs
                                                var year = document.getElementById('yearOrder').value;
                                                var month = document.getElementById('monthOrder').value;
                                                var day = document.getElementById('dayOrder').value;
                                                $.ajax({
                                                url: "/project/search-order",
                                                        type: "get",
                                                        data: {
                                                        year: year,
                                                                month: month,
                                                                day: day,
                                                                sellId: ${sessionScope.acc.id}
                                                        },
                                                        success: function (data) {
                                                        var out = document.getElementById("orderList");
                                                        out.innerHTML = data;
                                                        document.getElementById("listPage").style.display = 'none';
                                                        },
                                                        error: function (xhr) {
                                                        //handle error
                                                        }
                                                });
                                                }
                                                }
                                                function viewDetail(oId, sId){
                                                console.log(oId + "==" + sId);
                                                $.ajax({
                                                url: "/project/view-detail",
                                                        type: "get",
                                                        data: {
                                                        oId: oId,
                                                                sId: sId
                                                        },
                                                        success: function (data) {
                                                        var out = document.getElementById("orderDetail");
                                                        out.innerHTML = data;
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


            <c:forEach items="${listC}" var="o">
                                                console.log(${o.data})

            </c:forEach>
                                                $('#year').on('change', function () {
                                                $('#formYear').submit();
                                                });
                                                const ctx1 = document.getElementById('myChart1');
                                                const ctx2 = document.getElementById('myChart2');
                                                const ctx3 = document.getElementById('myChart3');
                                                const ctx4 = document.getElementById('myChart4');
                                                new Chart(ctx1, {
                                                type: 'bar',
                                                        data: {
                                                        labels: [
            <c:forEach items="${listPQ}" var="o">
                                                        '${o.name}',
            </c:forEach>
                                                        ],
                                                                datasets: [{
                                                                label: ' Dataset of Product\'s quantity sold ',
                                                                        data: [
            <c:forEach items="${listPQ}" var="o">
                ${o.purchases},
            </c:forEach>
                                                                        ],
                                                                        backgroundColor: [
                                                                                'rgba(255, 99, 132, 0.2)'
                                                                        ],
                                                                        borderColor: [
                                                                                'rgb(255, 99, 132)'
                                                                        ],
                                                                        borderWidth: 1
                                                                }]
                                                        },
                                                        options: {
                                                        scales: {
                                                        y: {
                                                        beginAtZero: true
                                                        }
                                                        }
                                                        }
                                                });
                                                new Chart(ctx2, {
                                                type: 'line',
                                                        data: {
                                                        labels: [
                                                                'January',
                                                                'February',
                                                                'March',
                                                                'April',
                                                                'May',
                                                                'June',
                                                                'July',
                                                                'August',
                                                                'September',
                                                                'October',
                                                                'November',
                                                                'December'
                                                        ],
                                                                datasets: [{
                                                                label: ' Dataset of Number Product\'s solded in Year ',
                                                                        data: [
            <c:forEach items="${listC}" var="o">
                ${o.data},
            </c:forEach>
                                                                        ],
                                                                        backgroundColor: [
                                                                                'rgba(255, 99, 132, 0.2)'
                                                                        ],
                                                                        borderColor: [
                                                                                'rgb(255, 99, 132)'
                                                                        ],
                                                                        borderWidth: 1
                                                                }]
                                                        },
                                                        options: {
                                                        scales: {
                                                        y: {
                                                        beginAtZero: true
                                                        }
                                                        }
                                                        }
                                                });
                                                new Chart(ctx3, {
                                                type: 'bar',
                                                        data: {
                                                        labels: [
            <c:forEach items="${listVIP}" var="o">
                                                        '${o.label}',
            </c:forEach>
                                                        ],
                                                                datasets: [{
                                                                label: ' Dataset of 5 most spending customers ',
                                                                        data: [
            <c:forEach items="${listVIP}" var="o">
                ${o.data},
            </c:forEach>
                                                                        ],
                                                                        backgroundColor: [
                                                                                'rgba(255, 99, 132, 0.2)',
                                                                                'rgba(255, 159, 64, 0.2)',
                                                                                'rgba(255, 205, 86, 0.2)',
                                                                                'rgba(75, 192, 192, 0.2)',
                                                                                'rgba(54, 162, 235, 0.2)',
                                                                                'rgba(153, 102, 255, 0.2)',
                                                                                'rgba(201, 203, 207, 0.2)'
                                                                        ],
                                                                        borderColor: [
                                                                                'rgb(255, 99, 132)',
                                                                                'rgb(255, 159, 64)',
                                                                                'rgb(255, 205, 86)',
                                                                                'rgb(75, 192, 192)',
                                                                                'rgb(54, 162, 235)',
                                                                                'rgb(153, 102, 255)',
                                                                                'rgb(201, 203, 207)'
                                                                        ],
                                                                        borderWidth: 1
                                                                }]
                                                        },
                                                        options: {
                                                        scales: {
                                                        y: {
                                                        beginAtZero: true
                                                        }
                                                        }
                                                        }
                                                });
                                                new Chart(ctx4, {
                                                type: 'pie',
                                                        data: {
                                                        labels: [
            <c:forEach items="${listCat}" var="o">
                                                        '${o.label}',
            </c:forEach>
                                                        ],
                                                                datasets: [{
                                                                label: ' Dataset of 5 most spending customers ',
                                                                        data: [
            <c:forEach items="${listCat}" var="o">
                ${o.data},
            </c:forEach>
                                                                        ],
                                                                        backgroundColor: [
                                                                                'rgba(255, 99, 132, 0.2)',
                                                                                'rgba(255, 159, 64, 0.2)',
                                                                                'rgba(255, 205, 86, 0.2)',
                                                                                'rgba(75, 192, 192, 0.2)',
                                                                                'rgba(54, 162, 235, 0.2)',
                                                                                'rgba(153, 102, 255, 0.2)',
                                                                                'rgba(201, 203, 207, 0.2)'
                                                                        ],
                                                                        borderColor: [
                                                                                'rgb(255, 99, 132)',
                                                                                'rgb(255, 159, 64)',
                                                                                'rgb(255, 205, 86)',
                                                                                'rgb(75, 192, 192)',
                                                                                'rgb(54, 162, 235)',
                                                                                'rgb(153, 102, 255)',
                                                                                'rgb(201, 203, 207)'
                                                                        ],
                                                                        borderWidth: 1
                                                                }]
                                                        },
                                                        options: {
                                                        scales: {
                                                        y: {
                                                        beginAtZero: true
                                                        }
                                                        }
                                                        }
                                                });
        </script>
    </body>
</html>
