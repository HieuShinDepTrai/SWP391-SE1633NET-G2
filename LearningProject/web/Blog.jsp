<%-- 
    Document   : Blog
    Created on : Oct 19, 2022, 6:40:10 PM
    Author     : Dung
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Blog</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />
        <link rel="stylesheet" href="assets/css/header.css" />
                <link rel="stylesheet" href="assets/css/homepage.css">

        <link rel="stylesheet" href="assets/css/blog.css">
    </head>

    <body style="font-family: 'Montserrat';">
        <div id="main">
            <%@include file="header.jsp"%>
            <!-- Begin: Side Bar -->
            <div id="side-bar">
                <c:if test="${user.role == 'Mentor'}">
                    <a style="
                       display: block;
                       width: 36px;
                       display: flex;
                       justify-content: center;
                       align-items: center;
                       height: 36px;
                       padding: 19px;
                       border-radius: 50%;
                       background-color: var(--bs-orange);
                       margin: 0 auto 10px auto;
                       " href="CreateCourse" data-bs-toggle="tooltip" data-bs-placement="right" title="Create Course">
                        <i class="fa-solid fa-plus" style="
                           font-size: 24px;
                           /* padding: 10px; */
                           color: white;
                           "></i>
                    </a>
                </c:if>
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
                    <a class="bar-button " href="userdashboard">
                        <i class="fa-solid fa-road"></i>
                        <p class="button-title text-center">User Dashboard</p>
                    </a>
                    <a class="bar-button" href="admindashboard">
                        <i class="fa-solid fa-road"></i>
                        <p class="button-title text-center">Admin Dashboard</p>
                    </a>
                </c:if>
                <c:if test="${user.role == 'Mentor'}">
                    <a class="bar-button " href="userdashboard">
                        <i class="fa-solid fa-road"></i>
                        <p class="button-title text-center">User Dashboard</p>
                    </a>
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
            
            <div id="blog">
                <div class="row g-2 py-3 px-4">
                    <div class="col-12 fw-bolder fs-2 mb-2">Bài viết nổi bật</div>
                    <div class="col-12 mb-2">Tổng hợp các bài viết chia sẻ về kinh nghiệm tự học lập trình online và các kỹ thuật lập trình web.</div>
                    <div class="col-12 row mt-5">
                        <!-- Blog -->
                        <div class="col-8">
                            <div class="card card-body p-3 shadow-sm mb-4"> 
                                <div class="d-flex align-items-center justify-content-between">
                                    <!-- User post -->
                                    <div class="d-flex align-items-center">
                                        <img src="../assets/img/f8-logo.png" alt="" style="width: 24px; height: 24px; object-fit: cover; border-radius: 50%;">
                                        <span style="font-size: 12px; font-weight: 600  ;" class="ms-2">dungssj12</span>
                                    </div>
                                    <!-- User post -->

                                    <!-- Action -->
                                    <i class="fa-solid fa-ellipsis"></i>
                                    <!-- Action -->
                                </div>

                                <!-- Content -->
                                <div class="mt-3 d-flex justify-content-between align-items-center">
                                    <!-- Content left -->
                                    <div class="" style="width: 78%;">
                                        <h5 class="fw-bolder">Setup Môi Trường Lập Trình Nhanh Chóng Cho Desktop. Phần 1: Lý thuyết</h5>
                                        <p class="text-black-50" style="font-size: 15px;">Một ngày đẹp trời, bạn mới sắm cho mình một chiếc laptop hoặc một bộ PC để tập trung theo đuổi công nghệ thông tin, theo ngành...</p>
                                    </div>
                                    <!-- Content left -->
                                    <div style="width: 20%; height: 80px;">
                                        <img src="../assets/img/f8-logo.png" class="rounded-3" alt="" style="width: 100%; max-height: 120px; object-fit: cover;">
                                    </div>
                                    <!-- Content right -->
                                    <div>

                                    </div>
                                    <!-- Content right -->

                                </div>
                                <!-- Content -->

                                <div class="d-flex align-items-center">
                                    <div class="tag bg-primary fw-bold text-white" style="padding: 6px 12px; width: fit-content; border-radius: 16px; font-size: 14px;">
                                        Javascript
                                    </div>
                                    <span class="ms-2">
                                        .
                                    </span>
                                    <div class="ms-2 d-inline-block" style="font-size: 14px;">
                                        4 tháng trước
                                    </div>
                                    <span class="ms-2">
                                        .
                                    </span>
                                    <div class="ms-2 d-inline-block" style="font-size: 14px;">
                                        6 phút đọc
                                    </div>
                                </div>
                            </div>


                        </div>
                        <!-- Blog -->

                        <!-- Tag -->
                        <div class="col-3">
                            <h6 class="text-black-50">CÁC CHỦ ĐỀ ĐƯỢC ĐỀ XUẤT</h6>
                            <a style="padding: 6px 12px; background-color: rgba(0, 0, 0, 0.3); border-radius:20px;" class="d-inline-block text-white">
                                Front-end
                            </a>
                        </div>                    
                        <!-- Tag -->
                    </div>
                </div>
            </div>
        </div>
        <script src="https://kit.fontawesome.com/7562df3d9f.js" crossorigin="anonymous"></script>
        <script src="assets/js/home_page.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
    </body>

</html>