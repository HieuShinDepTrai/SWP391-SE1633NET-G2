<%-- 
    Document   : CourseWatch
    Created on : Sep 30, 2022, 8:26:22 PM
    Author     : Dung
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <link rel="stylesheet" href="assets/css/course_watch.css">
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
                <div class="course-watch-left">
                    <div class="course-watch-left-content">
                        <div class="lesson-video">
                            <iframe width="100%" height="100%" src="https://www.youtube.com/embed/_Pdbne-_css" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                        </div>
                        <div class="lesson-information">
                            <div class="lesson-description">
                                <h3 class="lesson-title">
                                    Lesson 1 : Introduce HTML 
                                </h3>
                                <div class="lesson-date">
                                    25/12/2019
                                </div>
                            </div>
                            <div class="lesson-comment" style="cursor: pointer;">
                                Comment
                            </div>
                        </div>
                        <!-- Mark As Done -->
                        <div class="d-flex justify-content-center">
                            <div class="btn btn-primary">Mark As Done</div>
                        </div>
                        <!-- Mark As Done -->
                    </div>
                </div>
                <div class="course-watch-right">
                    <div class="course-watch-right-content">
                        <h4 class="course-content-title px-4 py-3">Course Content</h4>
                        <div class="course-lesson-list">
                            <c:forEach items="${listSection}" var="section">

                                <!-- Course section -->
                                <div class="course-lesson-container">
                                    <div class="course-lesson d-flex justify-content-between px-4 align-items-center">
                                        <div class="course-lesson-left">
                                            <div class="course-lesson-left-title">
                                                ${section.getSectionName()}
                                            </div>
                                            <div class="course-lesson-left-description">
                                                <div class="course-lesson-progress d-inline">12/12</div>
                                                <div class="d-inline">|</div>
                                                <div class="course-lesson-time d-inline">14:36</div>
                                            </div>
                                        </div>
                                        <div class="course-lesson-right">
                                            <i class="fa-solid fa-chevron-down"></i>
                                        </div>
                                    </div>
                                    <!-- Course lesson child container -->
                                    <div class="course-lesson-child-container" style="display: none;">        
                                        <c:forEach items="${listLesson}" var="lesson">
                                            <c:if test="${lesson.getSectionId() == section.getSectionId()}">

                                                <!-- course lesson child -->
                                                <a href="#">
                                                    <div class="course-lesson-child  px-4 py-2">
                                                        <div class="course-lesson-child-content d-flex justify-content-between align-items-center">
                                                            <div class="course-lesson-child-content-title">${lesson.getLessonName()}</div>
                                                            <i class="fa-solid fa-circle-check"></i>
                                                        </div>
                                                        <div class="course-lesson-child-footer">
                                                            <i class="fa-solid fa-circle-play"></i>
                                                            03:25
                                                        </div>
                                                    </div>
                                                </a>
                                                <!-- course lesson child -->

                                            </c:if>
                                        </c:forEach>
                                        <!-- Course lesson child container -->
                                    </div>
                                </div>    
                                <!-- Course section -->
                            </c:forEach>

                        </div>
                    </div>    
                </div>
            </section>
            <!-- Course Comment -->
            <div class="course-comment-container" style="display: none;">
                <div class="course-comment">
                    <i class="fa-solid fa-xmark course-comment-close" id="course-comment-close"></i>
                    <div class="course-comment-title">
                        88 Comment
                        <span>(If you see spam comment, please report to admin)</span>
                    </div>

                    <!-- Begin: Course post comment -->
                    <div class="course-post-comment-container">
                        <div class="course-comment-postcomment d-flex justify-content-between">
                            <img src="assets/img/f8-logo.png" alt="" class="user-avatar">
                            <!-- <input type="text" class="content" placeholder="Comment" style="    width: 90%;
                            border: none;
                            border-bottom: 1px solid rgba(0, 0, 0, 0.2); outline: none;"> -->
                            <textarea name="" oninput="auto_height(this); active_comment_button(this)"></textarea>
                        </div>
                        <div class="course-postcomment-action" style="float: right;">
                            <p class="post-cancel d-inline-block me-4 fw-bold">Cancel</p>
                            <button class="submit-comment">Comment</button>
                        </div>
                    </div>

                    <!-- End: Course post comment -->

                    <!-- Comment List -->
                    <div class="course-comment-list d-flex flex-column w-100 gap-4">
                        <!-- Begin: Comment -->
                        <div class="comment d-flex align-items-start">
                            <img src="assets/img/f8-logo.png" alt="" class="user-avatar">
                            <div class="comment-content">
                                <div class="comment-user">
                                    <div class="user-name">
                                        dungssj12
                                    </div>
                                    <div class="user-comment-content">
                                        HelloKitty xin chao toi la helasdkfjl aslkdfjaslk sdcxznzv,n sadfwqfadslfkasjdklfj  asldfjlkasdj
                                    </div>
                                </div>
                                <div class="comment-action">
                                    <div class="comment-action-content">Like</div>
                                    <div class="dot">.</div>
                                    <div class="comment-action-content comment-action-content-reply" onclick="show_reply_post_comment(this)">Reply</div>
                                    <div class="dot">.</div>
                                    <div class="comment-action-content">Report</div>
                                    <div class="dot">.</div>
                                    <div class="comment-create-day" style="color: rgba(0, 0, 0, 0.4); font-weight: 600;">20 day ago</div>
                                </div>

                                <!-- Reply Comment -->
                                <div class="reply-comment d-none">
                                    <div class="course-post-comment-container">
                                        <div class="course-comment-postcomment d-flex justify-content-between">
                                            <img src="assets/img/f8-logo.png" alt="" class="user-avatar">
                                            <!-- <input type="text" class="content" placeholder="Comment" style="    width: 90%;
                                            border: none;
                                            border-bottom: 1px solid rgba(0, 0, 0, 0.2); outline: none;"> -->
                                            <textarea name="" oninput="auto_height(this); active_comment_button(this)"></textarea>
                                        </div>
                                        <div class="course-postcomment-action" style="float: right;">
                                            <p class="post-cancel d-inline-block me-4 fw-bold">Cancel</p>
                                            <button class="submit-comment">Reply</button>
                                        </div>
                                    </div>

                                </div>
                                <!-- Reply Comment -->


                                <!-- Show Reply Comment -->
                                <div class="show-reply-comment d-none" style="margin-left: 20px; margin-top: 10px;">
                                    <h6>Show reply comment<i class="fa-solid fa-chevron-down"></i></h6>
                                    <div class="show-reply-comment-content">

                                    </div>
                                </div>
                                <!-- Show Reply Comment -->
                            </div>
                        </div>
                        <!-- End: Comment -->


                        <!-- Begin: Comment -->
                        <div class="comment d-flex align-items-start">
                            <img src="assets/img/f8-logo.png" alt="" class="user-avatar">
                            <div class="comment-content">
                                <div class="comment-user">
                                    <div class="user-name">
                                        dungssj12
                                    </div>
                                    <div class="user-comment-content">
                                        HelloKitty xin chao toi la helasdkfjl aslkdfjaslk sdcxznzv,n sadfwqfadslfkasjdklfj  asldfjlkasdj
                                    </div>
                                </div>
                                <div class="comment-action">
                                    <div class="comment-action-content">Like</div>
                                    <div class="dot">.</div>
                                    <div class="comment-action-content comment-action-content-reply" onclick="show_reply_post_comment(this)">Reply</div>
                                    <div class="dot">.</div>
                                    <div class="comment-action-content">Report</div>
                                    <div class="dot">.</div>
                                    <div class="comment-create-day" style="color: rgba(0, 0, 0, 0.4); font-weight: 600;">20 day ago</div>
                                </div>

                                <!-- Reply Comment -->
                                <div class="reply-comment d-none">
                                    <div class="course-post-comment-container">
                                        <div class="course-comment-postcomment d-flex justify-content-between">
                                            <img src="assets/img/f8-logo.png" alt="" class="user-avatar">
                                            <!-- <input type="text" class="content" placeholder="Comment" style="    width: 90%;
                                            border: none;
                                            border-bottom: 1px solid rgba(0, 0, 0, 0.2); outline: none;"> -->
                                            <textarea name="" oninput="auto_height(this); active_comment_button(this)"></textarea>
                                        </div>
                                        <div class="course-postcomment-action" style="float: right;">
                                            <p class="post-cancel d-inline-block me-4 fw-bold">Cancel</p>
                                            <button class="submit-comment">Reply</button>
                                        </div>
                                    </div>

                                </div>
                                <!-- Reply Comment -->


                                <!-- Show Reply Comment -->
                                <div class="show-reply-comment d-none" style="margin-left: 20px; margin-top: 10px;">
                                    <h6>Show reply comment<i class="fa-solid fa-chevron-down"></i></h6>
                                    <div class="show-reply-comment-content">

                                    </div>
                                </div>
                                <!-- Show Reply Comment -->
                            </div>
                        </div>
                        <!-- End: Comment -->

                    </div>
                    <!-- Comment List -->
                </div>
            </div>
            <!-- Course Comment -->

            <!-- Begin: Footer -->
            <!-- End: Footer -->
        </div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="assets/js/course_watch.js"></script>
        <script src="https://kit.fontawesome.com/7562df3d9f.js" crossorigin="anonymous"></script>
        <script src="assets/js/home_page.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
        <script src="https://player.vimeo.com/api/player.js"></script>
    </body>

</html>