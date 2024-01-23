<%-- 
    Document   : register
    Created on : 26-May-2023, 23:18:47
    Author     : Hoang Long
--%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="img/icon.jpg" type="image/x-icon"/>
        <title>RiaShop-Register</title>
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
                            <div class="img" style="background-image: url(img/register.png);">
                            </div>
                            <div class="login-wrap p-4 p-md-5">
                                <div class="d-flex">
                                    <div class="w-100">
                                        <h3 class="mb-4">Change password</h3>
                                    </div>
                                    
                                </div>
                                <form action="change-pass" method="post" class="signin-form">
                                    <div class="form-group mb-3">
                                        <label class="label" for="name">OldPassword</label>
                                        <input name="oldPass" type="text" class="form-control" placeholder="OldPassword" required>
                                    </div>
                                    <div class="form-group mb-3">
                                        <label class="label" for="password">Password</label>
                                        <input name="newPass" type="text" class="form-control" placeholder="NewPassword" required>
                                    </div>
                                    <div class="form-group mb-3">
                                        <label class="label" for="password">Re-Enter Password</label>
                                        <input name="reEnterPass" type="text" class="form-control" placeholder="Re-Enter Password" required>
                                    </div>
                                    <c:if test ="${err ne null}">
                                        <div class="alert alert-danger" role="alert">
                                            ${requestScope.err}
                                        </div>
                                    </c:if>
                                    <c:if test ="${msg ne null}">
                                        <div class="alert alert-success" role="alert">
                                            ${requestScope.msg}
                                        </div>
                                    </c:if>
                                    <div class="form-group">
                                        <button type="submit" class="form-control btn btn-primary rounded submit px-3">Change password</button>
                                    </div>
                                    
                                </form>
                                <p class="text-center">Go to <a data-toggle="tab" href="home">home</a></p>
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
