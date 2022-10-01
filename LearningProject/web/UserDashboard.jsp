<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            <header>
                <div class="header-content">
                    <div class="logo">
                        <img src="assets/img/Logo-FPT.webp" alt="" />
                        <div class="header-title">Học Lập Trình FPT</div>
                    </div>
                    <div class="header-search d-none">
                        <div class="icon-search">
                            <i class="fa-solid fa-magnifying-glass"></i>
                        </div>
                        <input type="text" placeholder="Tìm kiếm khóa học, bài viết, video..." />
                    </div>
                    <div class="header-profile">
                        <div class="header-mycourse">Khóa học của tôi</div>
                        <div class="header-notification" onclick="event.stopPropagation()">
                            <i class="fa-solid fa-bell"></i>
                            <div class="notification-cotainer" onclick="event.stopPropagation()">
                                <div class="notification-header">
                                    <h3>Thông báo</h3>
                                    <i class="fa-solid fa-ellipsis"></i>
                                </div>
                                <div class="notification-list">
                                    <div class="notification">
                                        <div class="noti-icon">
                                            <img src="assets/img/f8-logo.png" alt="" />
                                        </div>
                                        <div class="noti-content">
                                            <p>
                                                Chào mừng <span>Le Dao Quang Dung</span> đã gia nhập F8.
                                                Hãy luôn đam mê, kiên trì và theo đuổi mục tiêu tới cùng
                                                bạn nhé ❤️
                                            </p>
                                            <div class="noti-time">một tháng trước</div>
                                        </div>
                                        <div class="noti-remind"></div>
                                    </div>
                                    <div class="notification">
                                        <div class="noti-icon">
                                            <img src="assets/img/f8-logo.png" alt="" />
                                        </div>
                                        <div class="noti-content">
                                            <p>
                                                Chào mừng <span>Le Dao Quang Dung</span> đã gia nhập F8.
                                                Hãy luôn đam mê, kiên trì và theo đuổi mục tiêu tới cùng
                                                bạn nhé ❤️
                                            </p>
                                            <div class="noti-time">một tháng trước</div>
                                        </div>
                                        <div class="noti-remind"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="avatar" onclick="event.stopPropagation()">
                            <img src="assets/img/user.png" alt="" />
                            <div class="account-menu">
                                <div class="menu-content">
                                    <div class="menu-element">
                                        <i class="fa-solid fa-user"></i>
                                        <a href="" class="menu-title">Trang cá nhân</a>
                                    </div>
                                    <div class="menu-element">
                                        <i class="fa-solid fa-list"></i>
                                        <a href="" class="menu-title">Khóa học của tôi</a>
                                    </div>
                                    <div class="menu-element">
                                        <i class="fa-solid fa-gear"></i>
                                        <a href="" class="menu-title">Cài đặt</a>
                                    </div>
                                    <div class="line"></div>
                                    <div class="menu-element">
                                        Account Balance:
                                        <a href="" class="menu-title">200.000đ</a>
                                    </div>
                                    <div class="menu-element menu-logout">
                                        <i class="fa-solid fa-right-from-bracket"></i>
                                        <a href="" class="menu-title">Đăng xuất</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </header>

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
                            <p class="button-title text-center">User Dashboard</p>
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
                            <div class="col-12 fs-3 fw-bold mb-2">User Dashboard</div>
                            <div class="col-12 mb-3">
                                <div class="container-fluid d-flex align-items-center">
                                    <div class="user-dashboard-slide d-flex justify-content-between align-items-center w-100">
                                        <div class="slide-left">
                                            <h4 class="fw-bold">Hi dungssj12</h4>
                                            <p class="mb-3">Welcome to your user dashboard</p>
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
                                                <h6>Course Enroll</h6>
                                            </div>
                                            <div class="overview-content d-flex justify-content-between">
                                                <p>${allUserCourse}</p>
                                                <i class="fa-solid fa-laptop overview-content-img"></i>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="overview p-4">
                                            <div class="overview-header mb-2">
                                                <h6>Time studied</h6>
                                            </div>
                                            <div class="overview-content d-flex justify-content-between">
                                                <p>02</p>
                                                <i class="fa-solid fa-laptop overview-content-img"></i>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="overview p-4">
                                            <div class="overview-header mb-2">
                                                <h6>Blog details</h6>
                                            </div>
                                            <div class="overview-content d-flex justify-content-between">
                                                <p>02</p>
                                                <i class="fa-solid fa-laptop overview-content-img"></i>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="overview p-4">
                                            <div class="overview-header mb-2">
                                                <h6>Quizzes detail</h6>
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
                                <h5 class="fw-bold">My Course</h5>
                                <div class="row flex-column gy-2">
                                    <c:forEach var="course" items="${courseList}">
                                        <div class="col-12">
                                            <div class="card shadow-sm overflow-hidden">                                                
                                                <div class="row my-course g-0">
                                                    <div class="col-3">
                                                        <img src="https://images.unsplash.com/photo-1610360655260-decd32e267aa?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80" alt="" style="width: 100%; height: 96px; object-fit: cover;">
                                                    </div>
                                                    <div class="col-9 px-3 m-auto">
                                                        <div class="fw-bold mb-1">
                                                            <a href="CourseDetails?id=${course.getCourseID()}">${course.getCourseName()}</a>
                                                        </div>
                                                        <div class="mb-2" style="font-size: 14px;">${course.getAuthor().getFirstName()}</div>
                                                        <div class="progress mb-2">
                                                            <div class="progress-bar" role="progressbar" style="width: ${course.getCourseProgress()}%;" aria-valuenow="${course.getCourseProgress()}" aria-valuemin="0" aria-valuemax="100">${course.getCourseProgress()}%</div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>                                    
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