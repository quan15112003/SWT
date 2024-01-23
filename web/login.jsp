<%-- 
    Document   : login
    Created on : 26-May-2023, 22:30:46
    Author     : Hoang Long
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="img/icon.jpg" type="image/x-icon"/>
        <title>RiaShop-Login</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/styleLogin.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

    </head>
    <body style="
          background-image:
          linear-gradient(0,rgba(255,255,255,0.8),rgba(255,255,255,0.8)),
          url(img/banner1.png);
          background-size: cover;
          background-repeat: no-repeat;">
        <section class="ftco-section">
            <div class="container">

                <div class="row justify-content-center">
                    <div class="col-md-12 col-lg-10">
                        <div class="wrap d-md-flex">
                            <div class="img" style="background-image: url(img/login.png);">
                            </div>
                            <div class="login-wrap p-4 p-md-5">
                                <div class="d-flex">
                                    <div class="w-100">
                                        <h3 class="mb-4">Sign In</h3>
                                    </div>
                                    <div class="w-100">
                                        <p class="social-media d-flex justify-content-end">
                                            <a href="https://www.facebook.com/dialog/oauth?client_id=808055917596266&redirect_uri=https://localhost:9999/project/login-facebook" class="social-icon d-flex align-items-center justify-content-center"><span class="fa fa-facebook"></span></a>
                                        </p>
                                    </div>
                                    <div class="w-100">
                                        <p class="social-media d-flex justify-content-end">
                                            <a href="https://accounts.google.com/o/oauth2/auth?scope=email&redirect_uri=http://localhost:9999/project/login-google&response_type=code&client_id=200695014267-347in3eam2f8ff2q37kt3006m2hkic65.apps.googleusercontent.com&approval_prompt=force" class="social-icon d-flex align-items-center justify-content-center"><span class="fa fa-google"></span></a>
                                        </p>
                                    </div>
                                </div>
                                <form action="login" method="post" class="signin-form">
                                    <div class="form-group mb-3">
                                        <label class="label" for="name">Username</label>
                                        <input name="user" value="${username}" type="text" class="form-control" placeholder="Username" required>
                                    </div>
                                    <div class="form-group mb-3">
                                        <label class="label" for="password">Password</label>
                                        <input name="pass" value="${password}" type="password" class="form-control" placeholder="Password" required>
                                    </div>

                                    <c:if test ="${wrong ne null}">
                                        <div class="alert alert-danger" role="alert">
                                            ${wrong}
                                        </div>
                                    </c:if>

                                    <div class="form-group">
                                        <button type="submit" class="form-control btn btn-primary rounded submit px-3">Sign In</button>
                                    </div>
                                    <div class="form-group d-md-flex">
                                        <div class="w-50 text-left">
                                            <label class="checkbox-wrap checkbox-primary mb-0">Remember Me
                                                <input name="rem"${cookie.remC.value eq 'on'?'checked':''} type="checkbox" value="on">
                                                <span class="checkmark"></span>
                                            </label>
                                        </div>
                                        <div class="w-50 text-md-right">
                                            <a href="#">Forgot Password</a>
                                        </div>
                                    </div>

                                </form>
                                <p class="text-center">Not a member? <a data-toggle="tab" href="register">Sign Up</a></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <script src="js/jquery.min.js"></script>
        <script src="js/popper.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/main.js"></script>


    </body>
</html>
