<%-- 
    Document   : CreateCourse
    Created on : Oct 1, 2022, 10:34:28 AM
    Author     : Dung
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
        <link rel="stylesheet" href="assets/css/header.css" />
        <link rel="stylesheet" href="assets/css/create_course.css" />
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

            <!-- Begin: Create Course -->
            <section>
                <form action="CreateCourse" method="POST">
                    <div class="create-course px-5 py-3">
                        <div class="create-course-header mb-3">
                            <h3 class="fw-bold">Create Course</h3>
                            <nav style="--bs-breadcrumb-divider: '>'" aria-label="breadcrumb">
                                <ol class="breadcrumb" style="font-size: 13px">
                                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">
                                        Create Course
                                    </li>
                                </ol>
                            </nav>
                            <h4 class="mb-3 fw-bold mb-1">Basic Infromation</h4>
                        </div>
                        <div class="create-course-content">
                            <div class="content-1">
                                <div class="create-course-title-container mb-3">
                                    <div class="create-course-title mb-1 fw-bold">Course Title</div>
                                    <input type="text" class="w-100 mb-1" name="CourseTitle"/>
                                    <div class="description mb-1">
                                        Please enter your course title
                                    </div>
                                </div>
                                <div class="create-course-title-container mb-3">
                                    <div class="create-course-title mb-1 fw-bold">
                                        Course description
                                    </div>
                                    <textarea name="" id="" class="w-100" style="height: 100px" name="CourseDes"></textarea>
                                    <div class="description mb-1">
                                        Please enter your course description
                                    </div>
                                </div>
                                <div class="create-objectives">
                                    <div class="create-section-title fw-bold mb-3">Objectives</div>
                                    <div class="section-list">
                                        <div class="section-create mb-2">
                                            <div class="section-title">1. Section 1</div>
                                        </div>
                                    </div>
                                    <div class="add-section" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
                                        Add Objectives
                                    </div>
                                </div>
                            </div>
                            <div class="content-2">
                                <div class="course-thumbnail-header fw-bold">
                                    Course Thumbnail
                                </div>
                                <div class="course-thumbnail">
                                    <div class="course-thumbnail-content">
                                        <div class="course-thumbnail-img d-flex">
                                            <img src="" alt="" style="display: none" class="image-thumbnail" />
                                            <img src="assets/img/icon-image.png" alt="" class="icon" width="36px"
                                                 height="36px" />
                                        </div>
                                        <div class="course-thumbnail-footer p-3">
                                            <input type="file" name="" id="thumbnail"/>
                                            <textarea id="imageBase64" name="imageBase64" rows="5" cols="10" class="d-none"></textarea>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="content-3">
                                <div class="course-publish mb-3">
                                    <div class="publish-button d-flex justify-content-center p-4">
                                        <input type="submit" value="Publish" class="btn btn-dark"/>
                                    </div>
                                    <div class="save-draft px-3 py-3">Save draft</div>
                                    <div class="delete-course px-3 py-3">Delete course</div>
                                </div>
                                <div class="course-option p-3">
                                    <div class="course-option-content mb-2">
                                        <div class="course-option-content-title mb-1">Category</div>
                                        <div class="course-option-content-input mb-1">
                                            <select class="form-select w-100" aria-label="Default select example" name="category">
                                                <option selected>Select course category</option>
                                                <option value="Front-end">Front-end</option>
                                                <option value="Back-end">Back-end</option>
                                                <option value="Database">Database</option>
                                            </select>
                                        </div>
                                        <div class="course-option-content-des">Select a Category</div>
                                    </div>
                                    <div class="course-option-content mb-2">
                                        <div class="course-option-content-title mb-1">Price</div>
                                        <div class="course-option-content-input mb-1">
                                            <input type="text" class="w-100" name="CoursePrice"/>
                                        </div>
                                        <div class="course-option-content-des">
                                            Enter price of course
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
                <!-- Modal Add Section-->
                <form action="CreateCourse" method="POST">
                    <div class="modal fade" id="staticBackdrop" data-bs-keyboard="true" tabindex="-1" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="staticBackdropLabel">
                                        Add Objectives
                                    </h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <label for="Section name" class="form-label">Objective Name</label>
                                    <!-- Section name must not null -->
                                    <input type="text" class="form-control" name="SectionName" required="true"/>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                                        Close
                                    </button>
                                    <input type="submit" class="btn btn-primary" value="Add Objectives">
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </section>
            <!-- End: Create Course -->

            <!-- Begin: Footer -->
            <!-- End: Footer -->
        </div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="assets/js/create_course.js"></script>
        <script src="https://kit.fontawesome.com/7562df3d9f.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
        <script src="assets/js/home_page.js"></script>
    </body>

</html>