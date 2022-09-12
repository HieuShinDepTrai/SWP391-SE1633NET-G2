<%-- 
    Document   : register
    Created on : Sep 12, 2022, 2:16:30 PM
    Author     : vuman
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign up</title>
    <link rel="stylesheet" href="assets/css/Log-Reg.css">
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet" />

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet" />

    <!-- MDB -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/4.3.0/mdb.min.css" rel="stylesheet" />

    <!-- Owl Carousel -->
    <link rel="stylesheet" href="lib/owlcarousel/assets/owl.carousel.min.css" />
    <link rel="stylesheet" href="lib/owlcarousel/assets/owl.theme.default.min.css" />
    </head>
    
    <body>
        <div class="body d-flex align-items-center min-vh-100 py-3 py-md-0">
        <div class="container">
            <div class="card login-card">
                <div class="row no-gutters">
                    <div class="col-md-6">
                        <img src="https://images.unsplash.com/photo-1549082984-1323b94df9a6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80"
                            alt="login" class="img-fluid rounded-4" style="height: 700px; object-fit: cover;">
                    </div>

                    <div class="col-md-1">
                        <a href="home" style="color: black;" title="Return home">
                            <i class="fa-solid fa-circle-left home"></i>
                        </a>
                    </div>

                    <div class="col-md-5 form">
                        <div class="card-body">
                            <p class="login-card-description text">Create new account</p>
                            <p style="color: rgb(179, 177, 177);">Start for free</p>

                            <form action="login" method="post">

                                <div class="form-outline mb-3 input">
                                    <input type="text" name="account" class="form-control">
                                    <label class="form-label">Username</label>
                                </div>

                                <div class="form-outline mb-3 input">
                                    <input type="text" name="email" class="form-control">
                                    <label class="form-label">Email</label>
                                </div>

                                <div class="form-outline mb-3 input">
                                    <input type="text" name="firstname" class="form-control">
                                    <label class="form-label">Firstname</label>
                                </div>

                                <div class="form-outline mb-3 input">
                                    <input type="text" name="account" class="form-control">
                                    <label class="form-label">Lastname</label>
                                </div>

                                <div class="form-outline mb-3 input">
                                    <input type="password" name="password" class="form-control">
                                    <label class="form-label">Password</label>
                                </div>

                                <div class="form-outline mb-5 input ">
                                    <input type="password" name="cfpassword" class="form-control">
                                    <label class="form-label">Confirm password</label>
                                </div>

                                <button class="btn btn-block login-btn mb-4" type="submit" style="background-color: black; color: white;">Sign up</button>
                            </form>

                            <div style="margin-left: 40px;">
                                <span>Already have an account?</span>
                                <a class="move" href="forgot-password" style="color: rgb(92, 88, 88); font-weight: bold;">Sign in</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- MDB -->
        <script type="text/javascript"
            src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/5.0.0/mdb.min.js"></script>

    </body>
</html>
