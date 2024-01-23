<%-- 
    Document   : user-profile
    Created on : 08-Jun-2023, 23:16:12
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
        <style>
            .personal-image {
                text-align: center;
            }
            .personal-image input[type="file"] {
                display: none;
            }
            .personal-figure {
                position: relative;
                width: 200px;
                height: 200px;
            }
            .personal-avatar {
                cursor: pointer;
                width: 200px;
                height: 200px;
                box-sizing: border-box;
                border-radius: 100%;
                border: 2px solid transparent;
                box-shadow: 0px 2px 4px 0px rgba(0, 0, 0, 0.2);
                transition: all ease-in-out .3s;
            }
            .personal-avatar:hover {
                box-shadow: 0px 2px 4px 0px rgba(0, 0, 0, 0.5);
            }
            .personal-figcaption {
                cursor: pointer;
                position: absolute;
                top: 0px;
                width: inherit;
                height: inherit;
                border-radius: 100%;
                opacity: 0;
                background-color: rgba(0, 0, 0, 0);
                transition: all ease-in-out .3s;
            }
            .personal-figcaption:hover {
                opacity: 1;
                background-color: rgba(0, 0, 0, .5);
            }
            .personal-figcaption > img {
                margin-top: 58px;
                width: 60px;
                height: 60px;
            }
        </style>
    </head>  

    <body>
        <%@include file="header-manage.jsp" %>
        <div class="container-fluid mb-5">
            <div class="row border-top px-xl-5">
                <div class="col-lg-3 d-none d-lg-block">
                    <%@include file="left-manager.jsp" %>
                </div>
                <div class="col-lg-9">
                    <div class="container rounded bg-white mt-5 mb-5">
                        <div class="row">

                            <div class="col-md-3 border-right">
                                <div class="personal-image" id="personal-image">
                                    <label class="label">
                                        <input id="avatarInput" type="file" onchange="previewAvatar()"/>
                                        <figure class="personal-figure">
                                            <img id="avatar" src="${acc.info.avatar}" class="personal-avatar" alt="avatar">
                                            <figcaption class="personal-figcaption">
                                                <img src="https://raw.githubusercontent.com/ThiagoLuizNunes/angular-boilerplate/master/src/assets/imgs/camera-white.png">
                                            </figcaption>
                                        </figure>
                                    </label>
                                    <form id="form-submit-avatar"></form>
                                </div>
                                <div class="d-flex flex-column align-items-center text-center p-3 py-5">
                                    <span class="font-weight-bold">${acc.account}</span>
                                </div>
                            </div>
                            <form class="col-md-9"  action="user-detail" method="post">
                                <div class="col-md-9 border-left">
                                    <div class="p-3 py-5">
                                        <div class="d-flex justify-content-between align-items-center mb-3">
                                            <h4 class="text-right">Profile Settings</h4>
                                        </div>
                                        <div class="row mt-2">
                                            <div class="col-md-12">
                                                <label class="labels">Full Name</label>
                                                <input name="fullName" type="text" class="form-control" placeholder="enter your name" value="${acc.info.fullName}">
                                            </div>

                                            <div class="col-md-12 ">
                                                <p class="">Gender</p>
                                                <div  class="custom-control custom-radio custom-control-inline">
                                                    <input class="custom-control-input " type="radio" <c:if test="${acc.info.gender eq '1'}">checked</c:if>  name="gender" id="male" value="1">
                                                        <label class="custom-control-label " for="male">Male</label>
                                                    </div>
                                                    <div  class="custom-control custom-radio custom-control-inline">
                                                        <input class="custom-control-input " type="radio" <c:if test="${acc.info.gender eq '0'}">checked</c:if>  name="gender" id="female" value="0">
                                                        <label class="custom-control-label " for="female">Female</label>
                                                    </div>
                                                </div>

                                            </div>
                                            <div class="row mt-3">
                                                <div class="col-md-12">
                                                    <label class="labels">Phone Number</label>
                                                    <input name="phoneNumber" type="text" class="form-control" placeholder="enter phone number" value="${acc.info.phoneNumber}">
                                            </div>
                                            <div class="col-md-12">
                                                <label class="labels">Email ID</label>
                                                <input name="email" type="text" class="form-control" placeholder="enter email id" value="${acc.info.emailAddress}">
                                            </div>
                                            <div class="col-md-12">
                                                <label class="labels">Region/Country</label>
                                                <input name="regionCountry" type="text" class="form-control" placeholder="enter region/country" value="${acc.info.regionCountry}">
                                            </div>
                                        </div>

                                        <div class="mt-5 text-center"><input class="btn btn-primary profile-button" type="submit" value="Save Profile"></div>
                                    </div>
                                </div>

                            </form>
                        </div>
                    </div>

                </div>
            </div>
        </div>

        <script type="text/javascript">

            function previewAvatar() {
                $('#personal-image').remove(".form-submit-avatar");

                var myFile = $('#avatarInput').prop('files');
                console.log(myFile);
                console.log(window.URL.createObjectURL(myFile[0]));
                if (myFile) {
                    $('#avatar').attr('src', URL.createObjectURL(myFile[0]));
                }


                var form = $('#form-submit-avatar');
                if (form.length != 0) {
                    form.empty();
                }
                form.attr('action', 'save-avatar');
                form.attr('method', 'post');
                var file = document.createElement("input");
                file.value = myFile[0].name;
                file.type = "hidden";
                file.name = "avatar";
                form.prepend(file);

                var submit = document.createElement("input");
                submit.type = "submit";
                submit.className = "btn btn-primary profile-button";
                submit.value = "Save";
                form.prepend(submit);

            }
        </script>
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/owlcarousel/owl.carousel.min.js"></script>

        <!-- Contact Javascript File -->
        <script src="mail/jqBootstrapValidation.min.js"></script>
        <script src="mail/contact.js"></script>

        <!-- Template Javascript -->
        <script src="js/main.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js" type="text/javascript"></script>
    </body>
</html>
