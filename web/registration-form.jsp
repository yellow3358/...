<%-- 
    Document   : login
    Created on : Feb 28, 2024, 8:16:13 PM
    Author     : nocol
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <!--<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">-->
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Register License Car</title>
        <style>
            body{
                background: #000
            }
            .card{
                border: none;
                height: 600px;
            }
            .forms-inputs{
                position: relative;
                width: 100%;
            }
            .forms-inputs span{
                position: absolute;
                top:-18px;
                left: 10px;
                background-color: #fff;
                padding: 5px 10px;
                font-size: 15px
            }
            .forms-inputs input{
                height: 50px;
                border: 2px solid #eee;
                width: 100%;
            }
            .forms-inputs input:focus{
                box-shadow: none;
                outline: none;
                border: 2px solid #000
            }
            .btn{
                height: 50px
            }
            .success-data{
                display: flex;
                flex-direction: column
            }
            .bxs-badge-check{
                font-size: 90px
            }
        </style>
    </head>
    <body>
        <div class="container">
            <header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
                <a href="home" class="d-flex align-items-center col-md-3 mb-2 mb-md-0 text-dark text-decoration-none">
                    <!--<svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap"><use xlink:href="#bootstrap"></use></svg>-->
                    <h1>License Registration System</h1>
                </a>
                <c:if test="${sessionScope.user eq null}">
                    <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
                        <!--<li><a href="" class="nav-link px-2 link-dark">Register</a></li>-->
                        <li><a href="home" class="nav-link px-2 link-dark">Homepage</a></li>
                        <!--<li><a href="regisListAdmin" class="nav-link px-2 link-dark">List Registrations</a></li>-->
                        <!--                        <li><a href="#" class="nav-link px-2 link-dark">Pricing</a></li>
                                                <li><a href="#" class="nav-link px-2 link-dark">FAQs</a></li>
                                                <li><a href="#" class="nav-link px-2 link-dark">About</a></li>-->
                    </ul>
                </c:if>
                <c:if test="${sessionScope.user ne null and sessionScope.user.getIsAdmin() eq 0}">
                    <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
                        <li><a href="home" class="nav-link px-2 link-dark">Homepage</a></li>
                        <li><a href="registerCar" class="nav-link px-2 link-dark">Register</a></li>
                        <li><a href="regisListUser" class="nav-link px-2 link-dark">List Registrations</a></li>
                        <!--                        <li><a href="#" class="nav-link px-2 link-dark">Pricing</a></li>
                                                <li><a href="#" class="nav-link px-2 link-dark">FAQs</a></li>
                                                <li><a href="#" class="nav-link px-2 link-dark">About</a></li>-->
                    </ul>
                </c:if>
                <c:if test="${sessionScope.user ne null and sessionScope.user.getIsAdmin() eq 1}">
                    <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
                        <!--<li><a href="" class="nav-link px-2 link-dark">Register</a></li>-->
                        <li><a href="home" class="nav-link px-2 link-dark">Homepage</a></li>
                        <li><a href="regisListAdmin" class="nav-link px-2 link-dark">List Registrations</a></li>
                        <!--                        <li><a href="#" class="nav-link px-2 link-dark">Pricing</a></li>
                                                <li><a href="#" class="nav-link px-2 link-dark">FAQs</a></li>
                                                <li><a href="#" class="nav-link px-2 link-dark">About</a></li>-->
                    </ul>
                </c:if>
                <!--                <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
                                    <li><a href="#" class="nav-link px-2 link-secondary">Home</a></li>
                                    <li><a href="#" class="nav-link px-2 link-dark">Features</a></li>
                                    <li><a href="#" class="nav-link px-2 link-dark">Pricing</a></li>
                                    <li><a href="#" class="nav-link px-2 link-dark">FAQs</a></li>
                                    <li><a href="#" class="nav-link px-2 link-dark">About</a></li>
                                </ul>-->

                <div class="col-md-3 text-end">
                    <c:if test="${sessionScope.user eq null}">
                        <a href="login"><button type="button" class="btn btn-outline-primary me-2" >Login</button></a>
                        <a href="register"><button type="button" class="btn btn-primary">Sign-up</button></a>
                    </c:if>

                    <c:if test="${sessionScope.user ne null}">
                        <a href="lougout"><button type="button" class="btn btn-primary">Logout</button></a>

                    </c:if>
                </div>
            </header>
        </div>
        <!--        <form method="post" action="login">
                    Username: <input type="text" name="username">
                    <br>
                    Password: <input type="password" name="password">
                    <br>
                    <p style="color: red">${message}</p>
                    <p><button class="btn btn-success btn-block">Login</button></p>
                </form>-->
        <div class="container mt-5">
            <div class="row d-flex justify-content-center">
                <h1 style="color: white; padding-bottom: 20px; font-size: 70px">Register Car</h1>
                <div class="col-md-6">
                    <form method="post" action="registerCar">
                        <div class="card px-5 py-5" id="form1">
                            <div class="form-data">
<!--                                <div class="forms-inputs mb-4"> <span>CMND</span> <input type="text" name="cmnd">
                                    <div class="invalid-feedback">${message}</div>
                                </div>-->
                                <div class="forms-inputs mb-4"> <span>Full Name</span> <input type="text" name="fullname">
                                </div>
                                <span>Name Of Car</span>
                                <br>
                                <select id="image-select" name="nameOfCar" style="margin-bottom: 20px" onchange="displayImage()">
                                    <option value="Air Blade">Air Blade</option>
                                    <option value="Wave Alpha">Wave Alpha</option>
                                    <option value="Vision">Vision</option>
                                    <option value="SH">SH</option>
                                </select>
                                <div id="image-container" style="margin-bottom: 20px">
                                    <img id="display-image" src="" width="150px" height="150px" alt="Selected Motorbike">
                                </div>

                                <div class="mb-3"> <button class="btn btn-dark w-100">Create Request</button> </div>
                                <div class="mb-3"> <a href="regisListUser"><p class="fw-bold mb-1">Return list requests</p></a> </div>
                            </div>
                            <div class="success-data">
                                <div class="text-center d-flex flex-column"><span class="text-center fs-1">${message}</span> </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <script>
            function displayImage() {
                var selectBox = document.getElementById("image-select");
                var selectedValue = selectBox.options[selectBox.selectedIndex].value;
                var image = document.getElementById("display-image");

                // Set image source based on selected option
                switch (selectedValue) {
                    case "Air Blade":
                        image.src = "img/air_blade.jpg";
                        break;
                    case "Wave Alpha":
                        image.src = "img/wave_alpha.jpg";
                        break;
                    case "Vision":
                        image.src = "img/vision.jpg";
                        break;
                    case "SH":
                        image.src = "img/sh.jpg";
                        break;
                    default:
                        image.src = "img/air_blade.jpg"; // Set default image if option not recognized
                }
            }
        </script>
    </body>
</html>
