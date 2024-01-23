<%-- 
    Document   : header
    Created on : 25-May-2023, 10:34:55
    Author     : Hoang Long
--%>

<div class="container-fluid">

    <div class="row align-items-center py-3 px-xl-5">
        <div class="col-lg-3 d-none d-lg-block">
            <a href="home" class="text-decoration-none">
                <h1 class="m-0 display-5 font-weight-semi-bold"><span class="text-primary font-weight-bold border px-3 mr-1">Ria</span>Shop</h1>
            </a>

        </div>
        <div class="col-lg-6 col-6 text-left">
            <form action="search" method="post">
                <div class="input-group" >
                    <input  oninput="searchByName(this)" value="${search}" name="search" type="text" class="form-control" placeholder="Search for products">
                    <button onclick="this.form.submit()" style="background-color: transparent; border: 1px solid #EDF1FF;"  >
                        <div class="input-group-append" >
                            <span class="input-group-text bg-transparent text-primary" style="border: none;" >
                                <i class="fa fa-search"></i>
                            </span>
                        </div>
                    </button>
                    <div id="searchIn"></div>
                </div>
            </form>
        </div>
        <div class="col-lg-3 col-6 text-right">

            <a href="cart" class="btn border">
                <i class="fas fa-shopping-cart text-primary"></i>
                <span class="badge" id="numberCart">${numberOfCart}</span>
            </a>
        </div>
    </div>
</div>
<script>
    function searchByName(param) {
        var txtSearch = param.value;
        console.log(txtSearch);
        $.ajax({
            url: "/project/hint-search",
            type: "get",
            data: {
                txtSearch: txtSearch
            },
            success: function (data) {
                var out = document.getElementById("searchIn");
                out.innerHTML = data;
            },
            error: function (xhr) {
                //handle error
            }
        });
    }
</script>
