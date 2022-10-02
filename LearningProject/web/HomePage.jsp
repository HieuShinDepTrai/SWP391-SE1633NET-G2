<%-- 
    Document   : HomePage
    Created on : Sep 18, 2022, 3:59:18 AM
    Author     : HieuShin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Elearning</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="assets/css/homepage.css">
        <link rel="stylesheet" href="assets/css/header.css">
        <link rel="stylesheet" href="assets/css/footer.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick-theme.min.css"
              integrity="sha512-17EgCFERpgZKcm0j0fEq1YCJuyAWdz9KUtv1EjVuaOz8pDnh/0nZxmU6BBXwaaxqoi9PQXnRWqlcDB027hgv9A=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.css"
              integrity="sha512-yHknP1/AwR+yx26cB1y0cjvQUMvEa2PFzt1c9LlS4pRQ5NOTZFWbhBig+X9G9eYW/8m0/4OXNx8pxJ6z57x0dw=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Lato:wght@300;400;700;900&family=Montserrat:wght@400;500;600;700;800;900&display=swap');
        </style>
    </head>

    <body>
        <div id="main" >
            <header>
                <div class="header-content">
                    <div class="logo">
                        <a href="home"><img src="assets/img/Logo-FPT.webp" alt=""></a>
                        <div class="header-title">
                            Học Lập Trình FPT
                        </div>
                    </div>
                    <div class="header-search">
                        <div class="icon-search">
                            <i class="fa-solid fa-magnifying-glass"></i>
                        </div>
                        <input type="text" placeholder="Tìm kiếm khóa học, bài viết, video...">
                    </div>
                    <div class="header-profile">
                        <div class="header-mycourse">
                            Khóa học của tôi
                        </div>
                        <div class="header-notification" onclick="event.stopPropagation()">
                            <i class="fa-solid fa-bell"></i>
                            <div class="notification-cotainer" onclick="event.stopPropagation()">
                                <div class="notification-header">
                                    <h3>Thông báo</h3>
                                    <i class="fa-solid fa-ellipsis"></i>
                                </div>
                                <div class="notification-list ">
                                    <div class="notification">
                                        <div class="noti-icon">
                                            <img src="assets/img/f8-logo.png" alt="">
                                        </div>
                                        <div class="noti-content">
                                            <p>Chào mừng <span>Le Dao Quang Dung</span> đã gia nhập F8. Hãy luôn đam mê,
                                                kiên trì và theo đuổi mục tiêu tới cùng bạn nhé ❤️</p>
                                            <div class="noti-time">
                                                một tháng trước
                                            </div>
                                        </div>
                                        <div class="noti-remind">
                                        </div>
                                    </div>
                                    <div class="notification">
                                        <div class="noti-icon">
                                            <img src="assets/img/f8-logo.png" alt="">
                                        </div>
                                        <div class="noti-content">
                                            <p>Chào mừng <span>Le Dao Quang Dung</span> đã gia nhập F8. Hãy luôn đam mê,
                                                kiên trì và theo đuổi mục tiêu tới cùng bạn nhé ❤️</p>
                                            <div class="noti-time">
                                                một tháng trước
                                            </div>
                                        </div>
                                        <div class="noti-remind">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <c:if test="${user==null}">
                            <button class="btn btn-info"><a href="login" class="text-white fw-bold">Login</a></button>
                        </c:if>
                        <c:if test="${user!=null}">
                            <div class="avatar" onclick="event.stopPropagation()">
                                <c:if test="${user.getAvatar() != null}">
                                    <img src="${user.getAvatar()}" alt="">                                
                                </c:if>
                                <c:if test="${user.getAvatar() == null}">
                                    <img src="assets/img/user.png">
                                </c:if>
                                <div class="account-menu">
                                    <div class="menu-content">
                                        <div class="menu-element">
                                            <i class="fa-solid fa-user"></i>
                                            <a href="AccountProfile" class="menu-title">Trang cá nhân</a>
                                        </div>
                                        <div class="menu-element">
                                            <i class="fa-solid fa-list"></i>
                                            <a href="" class="menu-title">Khóa học của tôi</a>
                                        </div>
                                        <div class="menu-element">
                                            <i class="fa-solid fa-gear"></i>
                                            <a href="" class="menu-title">Cài đặt</a>
                                        </div>
                                        <div class="line">

                                        </div>
                                        <div class="menu-element">
                                            Account Balance:
                                            <a href="" class="menu-title">${user.getBalance()}</a>
                                        </div>
                                        <div class="menu-element menu-logout">
                                            <i class="fa-solid fa-right-from-bracket"></i>
                                            <a href="logout" class="menu-title">Đăng xuất</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:if>

                    </div>
                </div>
            </header>
            <div id="content" >
                <!-- Begin: Side Bar -->
                <div id="side-bar">
                    <a class="bar-button button-hover" href="home">
                        <i class="fa-solid fa-house"></i>
                        <p class="button-title">Home</p>
                    </a>
                    <c:if test="${user.role == 'User'}">
                        <a class="bar-button " href="userdashboard">
                            <i class="fa-solid fa-road"></i>
                            <p class="button-title text-center">User Dashboard</p>
                        </a>
                    </c:if>
                    <c:if test="${user.role == 'Admin'}">
                        <a class="bar-button " href="#">
                            <i class="fa-solid fa-road"></i>
                            <p class="button-title text-center">Admin Dashboard</p>
                        </a>
                    </c:if>
                    <c:if test="${user.role == 'Mentor'}">
                        <a class="bar-button " href="mentordashboard">
                            <i class="fa-solid fa-road"></i>
                            <p class="button-title text-center">Mentor Dashboard</p>
                        </a>
                    </c:if>
                    <a class="bar-button">
                        <i class="fa-solid fa-newspaper"></i>
                        <p class="button-title">Blog</p>
                    </a>


                </div>
                <!-- End: Side Bar -->

                <!-- Begin: Section Content -->
                <section class="section-home show">
                    <div class="section-slider autoplay">
                        <div class="slider-content">
                            <div class="slider-content-left">
                                <h1>Become a mentor on our web</h1>
                                <p>Come and register as a mentor to post course on our website</p>
                                <a href="becomementor">Register</a>
                            </div>
                            <div class="slider-content-right">
                                <img src="assets/img/slider-img/slide-img.png" alt=""
                                     style="height: 100%; object-fit: cover;">
                            </div>
                        </div>
                        <div class="slider-content-1">
                            <div class="slider-content-left">
                                <h1>Upgrade your learning skill</h1>
                                <p>Đây là khóa học đầy đủ và chi tiết nhất bạn có thể tìm thấy được ở trên Internet!</p>
                                <a href="#">Tìm hiểu thêm</a>
                            </div>
                            <div class="slider-content-right" style="height: 80%;">
                                <img src="assets/img/slider-img/slider1-img.png" alt=""
                                     style="height: 100%; object-fit: cover;">
                            </div>
                        </div>
                        <div class="slider-content-2">
                            <div class="slider-content-left">
                                <h1>Upgrade your learning skill</h1>
                                <p>Đây là khóa học đầy đủ và chi tiết nhất bạn có thể tìm thấy được ở trên Internet!</p>
                                <a href="#">Tìm hiểu thêm</a>
                            </div>
                            <div class="slider-content-right" style="height: 90%;">
                                <img src="assets/img/slider-img/slider2-img.png" alt=""
                                     style="height: 100%; object-fit: cover;">
                            </div>
                        </div>
                        <div class="slider-content-3">
                            <div class="slider-content-left">
                                <h1>Upgrade your learning skill</h1>
                                <p>Đây là khóa học đầy đủ và chi tiết nhất bạn có thể tìm thấy được ở trên Internet!</p>
                                <a href="#">Tìm hiểu thêm</a>
                            </div>
                            <div class="slider-content-right" style="height: 90%;">
                                <img src="assets/img/slider-img/slider3-img.png" alt=""
                                     style="height: 100%; object-fit: cover;">
                            </div>
                        </div>
                    </div>
                    <div class="container-fluid">
                        <div class="row">
                            <h3 class="fw-bold my-3">Pro Course</h3>
                        </div>
                        <div class="row g-3">
                            <c:forEach items="${requestScope.courses}" var="course">
                                <c:if test="${course.getStatus() == 'Enabled   '}">
                                    <div class="col-xl-3 col-lg-4 col-md-6" >
                                        <div class="card" style="min-height: 234px; height: 520px;">
                                            <div class="card-top-img">
                                                <img src="https://images.unsplash.com/photo-1663326223816-7d8d969eddfc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80" alt="" style="width: 100%; height: 100%; object-fit: cover">
                                            </div>
                                            <div class="card-body">

                                                <h5 class="course-title"><a href="CourseDetails?id=${course.getCourseID()}">${course.getCourseName()}</a></h5>
                                                        
                                                        

                                                <div class="course-meta-info">
                                                    <div class="course-meta-author">
                                                        <div class="author-avatar">
                                                            <img src="https://images.unsplash.com/photo-1594744803329-e58b31de8bf5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80"
                                                                 alt="">
                                                        </div>
                                                        <p>By <a href="#" class="author-name">${course.getAuthor().firstName}</a></p>
                                                    </div>
                                                    <div class="course-meta-student">
                                                        <i class="fa-solid fa-user"></i>
                                                        <p>${course.getNumberEnrolled()} Students</p>
                                                    </div>
                                                </div>
                                                <div class="course-footer">
                                                    <c:if test="${course.getCoursePrice() == 0}">
                                                        <div class="free" style="background-color: cornflowerblue; padding: 8px 18px; border-radius: 40px; color:  white;">Free</div>
                                                        <form action="enroll" method="POST">                                                        

                                                            <c:if test="${!courseIDs.contains(course.getCourseID())}">
                                                                <input name="op" type="submit" value="Enroll">
                                                            </c:if>

                                                            <c:if test="${courseIDs.contains(course.getCourseID())}">
                                                                <input name="op" type="submit" value="Go to Course">
                                                            </c:if>


                                                            <input type="hidden" name="courseID" value="${course.getCourseID()}">
                                                        </form>
                                                    </c:if>
                                                    <c:if test="${course.getCoursePrice() != 0}">
                                                        <div class="course-price">${course.getCoursePrice()} đ</div>
                                                        <a href="#">Buy now</a>
                                                    </c:if>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </div>
                    </div>

                </section>
                <!-- End: Section Content -->
            </div>

            <!-- Begin: Footer -->
            <footer style="margin-left: 100px;">
                <footer class="new_footer_area bg_color">
                    <div class="new_footer_top">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-6 col-md-12 text-center">
                                    <div class="f_widget company_widget wow fadeInLeft" data-wow-delay="0.2s"
                                         style="visibility: visible; animation-delay: 0.2s; animation-name: fadeInLeft;">
                                        <h3 class="f-title f_600 t_color f_size_18">About us</h3>
                                        <p>We are group 2, class SE1633-NET. This is our project in subject SWP391. This
                                            project is guided by
                                            lecturer Pham Duc Thang. This is an online learning platform through video
                                            lectures. We hope this
                                            platform will help you learn better in programming, moreover in soft skills.
                                            Thank you!</p>
                                        </form>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-12 text-center">
                                    <div class="f_widget about-widget pl_70 wow fadeInLeft" data-wow-delay="0.6s"
                                         style="visibility: visible; animation-delay: 0.6s; animation-name: fadeInLeft;">
                                        <h3 class="f-title f_600 t_color f_size_18">Contact us</h3>
                                        <ul class="list-unstyled f_list">
                                            <li>
                                                <a href="#"><i class="lnr lnr-phone-handset"></i> +84 988 561
                                                    896</a>
                                            </li>
                                            <li>
                                                <a href="#"><i class="lnr lnr-envelope"></i>
                                                    hieunvhe163104@fpt.edu.vn</a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <div class="footer_bg">
                            <div class="footer_bg_one"></div>
                            <div class="footer_bg_two"></div>
                        </div>
                    </div>
                </footer>
            </footer>
            <!-- End: Footer -->
        </div>
        <script src="https://kit.fontawesome.com/7562df3d9f.js" crossorigin="anonymous"></script>
        <script src="assets/js/home_page.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.js"
                integrity="sha512-XtmMtDEcNz2j7ekrtHvOVR4iwwaD6o/FUJe6+Zq+HgcCsk3kj4uSQQR8weQ2QVj1o0Pk6PwYLohm206ZzNfubg=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.js"
                integrity="sha512-WNZwVebQjhSxEzwbettGuQgWxbpYdoLf7mH+25A7sfQbbxKeS5SQ9QBf97zOY4nOlwtksgDA/czSTmfj4DUEiQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script type="text/javascript">
                                $('.autoplay').slick({
                                    slidesToShow: 1,
                                    slidesToScroll: 1,
                                    autoplay: true,
                                    autoplaySpeed: 5000,
                                    speed: 1500,
                                    dots: true
                                });
        </script>
    </body>

</html>
