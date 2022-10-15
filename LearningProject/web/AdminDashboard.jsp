<%-- 
    Document   : AdminDashboard
    Created on : Oct 9, 2022, 4:49:25 PM
    Author     : NamDepTraiVL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Elearning</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />
    <link rel="stylesheet" href="assets/css/user_dashboard.css" />
    <link rel="stylesheet" href="assets/css/header.css" />
    <style>
        @import url("https://fonts.googleapis.com/css2?family=Lato:wght@300;400;700;900&family=Montserrat:wght@400;500;600;700;800;900&display=swap");
    </style>
</head>

<body>
    <div id="main">
        <%@include file="header.jsp" %>
        <section>
            <!-- Begin: Side Bar -->
            <div id="side-bar-container">
                <div id="side-bar">
                    <div class="bar-button" onclick="activeHome()">
                        <i class="fa-solid fa-house"></i>
                        <p class="button-title">Home</p>
                    </div>
                    <div class="bar-button button-hover" onclick="activeCourse()">
                        <i class="fa-solid fa-road"></i>
                        <p class="button-title text-center">Admin Dashboard</p>
                    </div>
                    <div class="bar-button">
                        <i class="fa-solid fa-newspaper"></i>
                        <p class="button-title">Blog</p>
                    </div>
                </div>
            </div>
            <!-- End: Side Bar -->

            <!-- Begin: User Dashboard -->
            <div class="user-dashboard-container">
                <div class="user-dashboard px-5 py-4">
                    <div class="row">
                        <div class="col-12 fs-3 fw-bold mb-2">Admin Dashboard</div>
                        <div class="col-12 mb-3">
                            <div class="container-fluid d-flex align-items-center">
                                <div
                                    class="user-dashboard-slide d-flex justify-content-between align-items-center w-100">
                                    <div class="slide-left">
                                        <h4 class="fw-bold">Hi dungssj12</h4>
                                        <p class="mb-3">Welcome to your admin dashboard</p>
                                        <button>Get Started</button>
                                    </div>
                                    <div class="slide-right">
                                        <img src="assets/img/UserDashBoard.png" alt="" width="300px">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-8">
                            <h5 class="fw-bold">Overview</h5>
                            <div class="row gy-3">
                                <div class="col-6">
                                    <div class="overview p-4">
                                        <div class="overview-header mb-2">
                                            <h6>All number of course</h6>
                                        </div>
                                        <div class="overview-content d-flex justify-content-between">
                                            <p>${totalCourse}</p>
                                            <i class="fa-solid fa-laptop overview-content-img"></i>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-6">
                                    <div class="overview p-4">
                                        <div class="overview-header mb-2">
                                            <h6>All number of user</h6>
                                        </div>
                                        <div class="overview-content d-flex justify-content-between">
                                            <p>${totalUser}</p>
                                            <i class="fa-solid fa-laptop overview-content-img"></i>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-6">
                                    <div class="overview p-4">
                                        <div class="overview-header mb-2">
                                            <h6>All number of waiting withdraw</h6>
                                        </div>
                                        <div class="overview-content d-flex justify-content-between">
                                            <p>${totalWithdrawPending}</p>
                                            <i class="fa-solid fa-laptop overview-content-img"></i>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-6">
                                    <div class="overview p-4">
                                        <div class="overview-header mb-2">
                                            <h6>All number of quiz</h6>
                                        </div>
                                        <div class="overview-content d-flex justify-content-between">
                                            <p>02</p>
                                            <i class="fa-solid fa-laptop overview-content-img"></i>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <div class="col-4">
                            <h5 class="fw-bold">Admin Tools</h5>
                            <div class="row flex-column gy-2">
                                <div class="col-12">
                                    <div class="card shadow-sm overflow-hidden">
                                        <div class="row my-course g-0">
                                            <div class="col-3">
                                                <img src="https://img.freepik.com/free-vector/online-courses-tutorials_52683-37860.jpg?w=1060&t=st=1664958980~exp=1664959580~hmac=88310d1b905804a0cd9333cbce64a79caae79f10802976640842f9cc7129c044"
                                                    alt="" style="width: 100%; height: 96px; object-fit: cover;">
                                            </div>
                                            <div class="col-9 px-3 m-auto">
                                                <div class="fw-bold mb-1">
                                                    <a href="withdrawmanagement">Transaction Management</a>
                                                </div>
                                                <div class="mb-2" style="font-size: 14px;">Show all pending withdraw
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-12">
                                    <div class="card shadow-sm overflow-hidden">
                                        <div class="row my-course g-0">
                                            <div class="col-3">
                                                <img src="https://img.freepik.com/free-vector/online-courses-tutorials_52683-37860.jpg?w=1060&t=st=1664958980~exp=1664959580~hmac=88310d1b905804a0cd9333cbce64a79caae79f10802976640842f9cc7129c044"
                                                    alt="" style="width: 100%; height: 96px; object-fit: cover;">
                                            </div>
                                            <div class="col-9 px-3 m-auto">
                                                <div class="fw-bold mb-1">
                                                    <a href="#">Account Management</a>
                                                </div>
                                                <div class="mb-2" style="font-size: 14px;">Admin Function Description
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End: User Dashboard -->
        </section>

        <!-- Begin: Footer -->
        <!-- End: Footer -->
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="assets/js/create_video_lesson.js"></script>
    <script src="https://kit.fontawesome.com/7562df3d9f.js" crossorigin="anonymous"></script>
    <script src="assets/js/home_page.js"></script>
</body>

</html>