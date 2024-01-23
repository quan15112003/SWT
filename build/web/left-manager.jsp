<a class=" btn shadow-none d-flex align-items-center justify-content-between bg-primary text-white w-100" data-toggle="collapse" href="#navbar-vertical" style="height: 65px; margin-top: -1px; padding: 0 30px;">
    <h6 class="m-0 ">Menu</h6>
    <i class="fa fa-angle-down text-dark"></i>
</a>
<nav class="collapse show navbar navbar-vertical navbar-light align-items-start p-0 border border-top-0 border-bottom-0" id="navbar-vertical">
    <div class="navbar-nav w-100 overflow-hidden" style="height: 410px">
        <a href="user-detail" class="nav-item nav-link">Profile</a>

        <c:if test="${sessionScope.acc.isAdmin == 1}">
            <a href="account-manage" class="nav-item nav-link">Manage Account</a>
            <a href="category-manage" class="nav-item nav-link">Manage Category</a>
        </c:if>
        <c:if test="${sessionScope.acc.isSell == 1}">
            <a href="product-manage" class="nav-item nav-link">Manage Product</a>
            <a href="size-manage" class="nav-item nav-link">Manage Size</a>
            <a href="material-manage" class="nav-item nav-link">Manage Material</a>
            <a href="chart-product" class="nav-item nav-link">Chart</a>
        </c:if>
        <a href="history-order" class="nav-item nav-link">History Order</a>
    </div>
</nav>