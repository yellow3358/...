<%-- 
    Document   : login
    Created on : Feb 28, 2024, 8:16:13 PM
    Author     : nocol
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <!--<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">-->
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Login</title>
        <style>
            body{
                background: #000
            }
            .card{
                border: none;
                height: 360px
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
                <h1 style="color: white; padding-bottom: 20px; font-size: 70px">Car Registration System</h1>
                <div class="col-md-6">
                    <form method="post" action="login">
                        <div class="card px-5 py-5" id="form1">
                            <div class="form-data">
                                <div class="forms-inputs mb-4"> <span>Username</span> <input type="text" name="username">
                                    <div class="invalid-feedback">${message}</div>
                                </div>
                                <div class="forms-inputs mb-4"> <span>Password</span> <input type="password" name="password">
                                    <div class="invalid-feedback">Password must be 8 character!</div>
                                </div>
                                <div class="mb-3"> <button class="btn btn-dark w-100">Login</button> </div>
                                <div class="mb-3"> <a href="register"><p class="fw-bold mb-1">Do not have account</p></a> </div>
                            </div>
                            <div class="success-data">
                                <div class="text-center d-flex flex-column"><span class="text-center fs-1">${message}</span> </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
