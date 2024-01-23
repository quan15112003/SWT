<div class="row align-items-center py-3 px-xl-5">
    <div class="col-lg-3 d-none d-lg-block">
        <a href="home" class="text-decoration-none">
            <h1 class="m-0 display-5 font-weight-semi-bold"><span class="text-primary font-weight-bold border px-3 mr-1">Ria</span>Shop</h1>
        </a>
    </div>
    <div class="col-lg-9 col-12 text-left">

        <nav class="navbar navbar-expand-lg bg-light navbar-light py-3 py-lg-0 px-0">
            <a href="home" class="text-decoration-none d-block d-lg-none">
                <h1 class="m-0 display-5 font-weight-semi-bold"><span class="text-primary font-weight-bold border px-3 mr-1">Ria</span>Shop</h1>
            </a>
            <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">

                <c:if test="${sessionScope.acc != null}">
                    <div class="navbar-nav ml-auto py-0">

                        <div style="display: flex;justify-items: center;align-items: center">
                            <img style="height: 40px;border-radius: 50%;" src="${sessionScope.acc.info.avatar}" alt="avatar"/>
                        </div>
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle active" data-toggle="dropdown">${sessionScope.acc.info.fullName}</a>
                            <div class="dropdown-menu dropdown-menu-right rounded-0 m-0">
                                <a href="user-detail" class="dropdown-item">Profile</a>
                                <a href="change-pass" class="dropdown-item">Change password</a>
                                <a href="logout" class="dropdown-item">Logout</a>
                            </div>
                        </div>
                    </div>
                </c:if>

            </div>
        </nav>
    </div>

</div>