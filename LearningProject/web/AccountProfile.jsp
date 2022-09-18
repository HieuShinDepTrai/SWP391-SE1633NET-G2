<%-- 
    Document   : AccountProfile
    Created on : Sep 17, 2022, 11:02:54 AM
    Author     : HieuShin
--%>

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
        <link rel="stylesheet" href="assets/css/header.css">
        <link rel="stylesheet" href="assets/css/account_profile.css">
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
        <header>
            <div class="header-content">
                <div class="logo">
                    <img src="assets/img/Logo-FPT.webp" alt="">
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
                    <div class="avatar" onclick="event.stopPropagation()">
                        <img src="assets/img/user.png" alt="">
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
                                <div class="line">

                                </div>
                                <div class="menu-element">
                                    Account Balance:
                                    <a href="" class="menu-title">${user.getBalance()} đ</a>
                                </div>
                                <div class="menu-element">
                                    <i class="fa-solid fa-right-from-bracket"></i>
                                    <a href="" class="menu-title">Đăng xuất</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </header>

        <!-- Begin: Account Profile Section -->
        <section>
            <!-- Begin: Modal -->
            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Change Avatar</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <div class="avatar-preview">
                                <img src="" alt="" style="object-fit: cover; width: 100%; height: 100%;">
                            </div>
                            <div class="mb-3 mt-3">
                                <label for="formFile" class="form-label">Upload your image</label>
                                <input class="form-control" type="file" id="formFile" onchange="console.log(this)">
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-primary">Save changes</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End: Modal -->

            <div class="account-profile-container">
                <div class="account-profile-menu">
                    <div class="menu-header">
                        Account
                    </div>
                    <div class="menu-list">
                        <div class="menu menu-active" onclick="profile_link(this)">
                            <i class="fa-solid fa-user"></i>
                            <a href="#" class="menu-title">Personal Information</a>
                        </div>
                        <div class="menu" onclick="course_link(this)">
                            <i class="fa-solid fa-lock menu-course"></i>
                            <a href="#" class="menu-title">My Course</a>
                        </div>
                        <div class="menu">
                            <i class="fa-solid fa-lock menu-security"></i>
                            <a href="#" class="menu-title">Security</a>
                        </div>
                        <div class="menu">
                            <i class="fa-solid fa-right-from-bracket menu-logout"></i>
                            <a href="#" class="menu-title">Log Out</a>
                        </div>
                    </div>
                </div>

                <div class="account-profile-content link-profile active">
                    <!-- Begin: Profile Information -->
                    <div class="content-container">
                        <div class="content-header">
                            Personal Information
                        </div>
                        <div class="account-content">
                            <div class="account-avatar-container">
                                <!-- Begin: Avatar Profile -->
                                <div class="account-avatar">
                                    <div class="user-avatar">
                                        <img src="assets/img/f8-logo.png" alt="">
                                        <div class="user-action">
                                            <p>${user.getFirstName()} ${user.getLastName()}</p>
                                            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                                                Change avatar
                                            </button>
                                        </div>
                                    </div>
                                    <div class="account-type">
                                        Member Account
                                    </div>
                                </div>
                                <!-- End: Avatar Profile -->
                                <!-- Begin: Account Information Section -->
                                <form action="AccountProfile" method="POST">
                                    <div class="account-information-section mt-4">
                                        <h6>Account Information</h6>
                                        <div class="row mt-3">
                                            <div class="col-md-6 mt-3">
                                                <label for="FirstName" class="form-label">First Name</label>
                                                <input type="text" class="form-control" value="${user.getFirstName()}" name="firstname" disabled>
                                            </div>
                                            <div class="col-md-6 mt-3">
                                                <label for="SecondName" class="form-label">Last Name</label>
                                                <input type="text" class="form-control" value="${user.getLastName()}" name="lastname" disabled>
                                            </div>
                                            <div class="col-md-12 mt-3">
                                                <label for="Date Of Birth" class="form-label">Date of Birth</label>
                                                <input type="text" class="form-control" value="${user.getDob()}" name="dob" disabled>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- End: Account Information Section -->
                                    <div class="account-information-section mt-4">
                                        <h6>Physical address</h6>
                                        <div class="row mt-3">
                                            <div class="col-md-6 mt-3">
                                                <label for="Country" class="form-label">Country</label>
                                                <input type="text" class="form-control" value="${user.getCountry()}" name="country" disabled>
                                            </div>
                                            <div class="col-md-6 mt-3">
                                                <label for="City" class="form-label">City</label>
                                                <input type="text" class="form-control" value="${user.getCity()}" name="city" disabled>
                                            </div>
                                            <div class="col-md-6 mt-4">
                                                <label for="Address" class="form-label">Address</label>
                                                <input type="text" class="form-control" value="${user.getAddress()}" name="address" disabled>
                                            </div>
                                            <div class="col-md-6 mt-4">
                                                <label for="PostalCode" class="form-label">Postal Code</label>
                                                <input type="text" class="form-control" value="${user.getPostCode()}" name="postcode" disabled>
                                            </div>
                                            <div class="col-md-12 mt-4">
                                                <label for="Phone Number" class="form-label">Phone Number</label>
                                                <input type="text" class="form-control" value="${user.getPhone()}" name="phonenumber" disabled>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="btn btn-primary mt-3" onclick="disableOff(this)">Edit Profile</div>
                                    <button type="submit" class="btn btn-primary mt-3 d-none" id="save">Save</button>
                                </form>
                            </div>
                        </div>
                    </div>
                    <!-- End: Profile Information -->
                </div>

                <div class="account-profile-content link-course">
                    <!-- Begin: Course -->
                    <div class="content-container">
                        <div class="content-header">
                            My Course
                        </div>
                        <div class="account-content">
                            <div class="account-avatar-container">
                                <!-- Begin: Account Course -->
                                <div class="account-information-section mt-4">
                                    <h4>Course Progress</h4>
                                    <div class="row">
                                        <div class="col-md-4 mb-3">
                                            <div class="card" style="border-radius: 6px; overflow: hidden; height: 360px;">
                                                <img src="assets/img/htmlcss.avif" alt="" class="card-img-top"
                                                     style="width: 100%; object-fit: cover; max-height: 200px;">
                                                <div class="card-body">
                                                    <h5 class="card-title" style="font-weight: 600;">HTML CSS</h5>
                                                    <div class="course-meta-info">
                                                        <div class="course-meta-author">
                                                            <div class="author-avatar">
                                                                <img src="https://images.unsplash.com/photo-1594744803329-e58b31de8bf5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80"
                                                                     alt="">
                                                            </div>
                                                            <p>By <a href="#" class="author-name">Lynda</a></p>
                                                        </div>
                                                        <div class="course-meta-student">
                                                            <i class="fa-solid fa-user"></i>
                                                            <p>51 Students</p>
                                                        </div>
                                                    </div>
                                                    <div class="progress mt-3">
                                                        <div class="progress-bar" role="progressbar" style="width: 25%;"
                                                             aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">25%
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-4 mb-3">
                                            <div class="card" style="border-radius: 6px; overflow: hidden; height: 360px;">
                                                <img src="assets/img/htmlcss.avif" alt="" class="card-img-top"
                                                     style="width: 100%; object-fit: cover; max-height: 200px;">
                                                <div class="card-body">
                                                    <h5 class="card-title" style="font-weight: 600;">HTML CSS</h5>
                                                    <div class="course-meta-info">
                                                        <div class="course-meta-author">
                                                            <div class="author-avatar">
                                                                <img src="https://images.unsplash.com/photo-1594744803329-e58b31de8bf5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80"
                                                                     alt="">
                                                            </div>
                                                            <p>By <a href="#" class="author-name">Lynda</a></p>
                                                        </div>
                                                        <div class="course-meta-student">
                                                            <i class="fa-solid fa-user"></i>
                                                            <p>51 Students</p>
                                                        </div>
                                                    </div>
                                                    <div class="progress mt-3">
                                                        <div class="progress-bar" role="progressbar" style="width: 25%;"
                                                             aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">25%
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-4 mb-3">
                                            <div class="card" style="border-radius: 6px; overflow: hidden; height: 360px;">
                                                <img src="assets/img/htmlcss.avif" alt="" class="card-img-top"
                                                     style="width: 100%; object-fit: cover; max-height: 200px;">
                                                <div class="card-body">
                                                    <h5 class="card-title" style="font-weight: 600;">HTML CSS</h5>
                                                    <div class="course-meta-info">
                                                        <div class="course-meta-author">
                                                            <div class="author-avatar">
                                                                <img src="https://images.unsplash.com/photo-1594744803329-e58b31de8bf5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80"
                                                                     alt="">
                                                            </div>
                                                            <p>By <a href="#" class="author-name">Lynda</a></p>
                                                        </div>
                                                        <div class="course-meta-student">
                                                            <i class="fa-solid fa-user"></i>
                                                            <p>51 Students</p>
                                                        </div>
                                                    </div>
                                                    <div class="progress mt-3">
                                                        <div class="progress-bar" role="progressbar" style="width: 25%;"
                                                             aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">25%
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-4 mb-3">
                                            <div class="card" style="border-radius: 6px; overflow: hidden; height: 360px;">
                                                <img src="assets/img/htmlcss.avif" alt="" class="card-img-top"
                                                     style="width: 100%; object-fit: cover; max-height: 200px;">
                                                <div class="card-body">
                                                    <h5 class="card-title" style="font-weight: 600;">HTML CSS</h5>
                                                    <div class="course-meta-info">
                                                        <div class="course-meta-author">
                                                            <div class="author-avatar">
                                                                <img src="https://images.unsplash.com/photo-1594744803329-e58b31de8bf5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80"
                                                                     alt="">
                                                            </div>
                                                            <p>By <a href="#" class="author-name">Lynda</a></p>
                                                        </div>
                                                        <div class="course-meta-student">
                                                            <i class="fa-solid fa-user"></i>
                                                            <p>51 Students</p>
                                                        </div>
                                                    </div>
                                                    <div class="progress mt-3">
                                                        <div class="progress-bar" role="progressbar" style="width: 25%;"
                                                             aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">25%
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-4 mb-3">
                                            <div class="card" style="border-radius: 6px; overflow: hidden; height: 360px;">
                                                <img src="assets/img/htmlcss.avif" alt="" class="card-img-top"
                                                     style="max-height: 200px;">
                                                <div class="card-body">
                                                    <h5 class="card-title" style="font-weight: 600;">HTML CSS</h5>
                                                    <div class="course-meta-info">
                                                        <div class="course-meta-author">
                                                            <div class="author-avatar">
                                                                <img src="https://images.unsplash.com/photo-1594744803329-e58b31de8bf5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80"
                                                                     alt="">
                                                            </div>
                                                            <p>By <a href="#" class="author-name">Lynda</a></p>
                                                        </div>
                                                        <div class="course-meta-student">
                                                            <i class="fa-solid fa-user"></i>
                                                            <p>51 Students</p>
                                                        </div>
                                                    </div>
                                                    <div class="progress mt-3">
                                                        <div class="progress-bar" role="progressbar" style="width: 25%;"
                                                             aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">25%
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- End: Account Course -->
                            </div>
                        </div>
                    </div>
                    <!-- End: Profile Information -->
                </div>
            </div>
        </section>
        <!-- End: Account Profile Section -->
        <!-- Begin: Footer -->
        <footer>

        </footer>
        <!-- End: Footer -->
        <script src="https://kit.fontawesome.com/7562df3d9f.js" crossorigin="anonymous"></script>
        <script src="assets/js/home_page.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
        <script src="assets/js/account_profile.js"></script>
    </body>

    <footer class="new_footer_area bg_color">
        <div class="new_footer_top">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-md-12 text-center">
                        <div class="f_widget company_widget wow fadeInLeft" data-wow-delay="0.2s"
                             style="visibility: visible; animation-delay: 0.2s; animation-name: fadeInLeft;">
                            <h3 class="f-title f_600 t_color f_size_18">About us</h3>
                            <p>We are group 2, class SE1633-NET. This is our project in subject SWP391. This project is guided by
                                lecturer Pham Duc Thang. This is an online learning platform through video lectures. We hope this
                                platform will help you learn better in programming, moreover in soft skills. Thank you!</p>
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

</html>
