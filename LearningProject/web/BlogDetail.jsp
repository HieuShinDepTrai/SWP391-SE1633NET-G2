<%-- 
    Document   : BlogDetail
    Created on : Oct 30, 2022, 3:26:45 PM
    Author     : HieuShin
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
        <link rel="stylesheet" href="../assets/css/blog.css">
        <script src="https://cdn.tiny.cloud/1/no-api-key/tinymce/6/tinymce.min.js" referrerpolicy="origin"></script>
        <script>
            tinymce.init({
                selector: '#mytextarea'
            });
        </script>
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
                       " href="createblog" data-bs-toggle="tooltip" data-bs-placement="right" title="Create Course">
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
                <a class="bar-button" href="blog">
                    <i class="fa-solid fa-newspaper"></i>
                    <p class="button-title">Blog</p>
                </a>

            </div>
            <!-- End: Side Bar -->

            <div id="blog">
                <div class="row w-100" style="--bs-gutter-x: 0">
                    <div class="col-12 w-100 d-flex">
                        <div class="w-75 mx-auto">
                            <h1 class="mt-2" style="font-weight: 700;">Về key prop trong map()</h1>

                            <!-- User and post information -->
                            <div class="d-flex justify-content-center">
                                <div class="d-flex justify-content-between align-items-center w-100">
                                    <div class="user d-flex">
                                        <img src="../assets/img/f8-logo.png" alt="" style="width: 48px; height: 48px; object-fit: cover; border-radius: 50px;">
                                        <div class="ms-3 d-flex justify-content-between flex-column">
                                            <div class="username" style="font-weight: 600;">dungssj12</div>
                                            <div class="post-time text-black-50" style="font-size: 14px;">25-12-2002</div>
                                        </div>
                                    </div>
                                    <div class="dropdown">
                                        <i class="fa-solid fa-ellipsis" id="dropdownMenuButton1" data-bs-toggle="dropdown" style="cursor: pointer;"></i>
                                        <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                                            <li><a class="dropdown-item" href="#">Action</a></li>
                                            <li><a class="dropdown-item" href="#">Another action</a></li>
                                            <li><a class="dropdown-item" href="#">Something else here</a></li>
                                        </ul>
                                    </div>
                                </div>

                            </div>
                            <!-- User and post information -->

                            <!-- Post content -->
                            <div class="mt-3" style="border: 1px solid black; height: 600px;">

                            </div>
                            <!-- Post content -->

                            <!-- Action Post -->
                            <div class="mt-5 d-flex">
                                <div class="d-flex align-items-center">
                                    <i class="text-black-50 fa-regular fa-heart" style="font-size: 24px;"></i>
                                    <span class="ms-2 text-black-50">1</span>    
                                </div>
                                <div class="d-flex align-items-center ms-4">
                                    <i class="text-black-50 fa-regular fa-comment" style="font-size: 24px;"></i>
                                    <span class="ms-2 text-black-50">1</span>    
                                </div>
                            </div>
                            <!-- Action Post -->


                            <div class="mt-5">
                                <h5 style="font-weight: 600;">Bài đăng cùng tác giả</h5>
                                <ul>
                                    <li><a href="#">Bai viet so 1</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <script src="https://kit.fontawesome.com/7562df3d9f.js" crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="../assets/js/create_course.js"></script>
        <script src="assets/js/home_page.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
    </body>

</html>
