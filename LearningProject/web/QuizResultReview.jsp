<%-- 
    Document   : QuizResultReview
    Created on : Oct 28, 2022, 5:13:54 PM
    Author     : vuman
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
                        <img src="../assets/img/Logo-FPT.webp" alt="" />
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
                                            <img src="../assets/img/f8-logo.png" alt="" />
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
                            <img src="../assets/img/user.png" alt="" />
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
                <div class="course-watch-left" style="overflow-y: auto;" id="style-1">
                    <div class="course-watch-left-content">
                        <div class="lesson-content">
                            <div class="bg-primary py-5 px-4 fw-bold text-white fs-3">
                                Review attempt on Monday, 1 August 2022, 3:01 PM
                                <span class="btn-danger btn float-end">Return to Quiz History</span>
                            </div>

                            <div class="">
                                <div class="px-5 py-2">
                                    <div class="fw-bold mb-2" style="font-size: 20px;">
                                        Question 1
                                    </div>
                                    <div>
                                        A T.V. show’s executives raised the fee for commercials following a report that the show received a “ No.1” rating in a survey of viewers. What type of the description is?
                                    </div>
                                    <div class="mt-3">
                                        <div class="mb-2"><input type="checkbox" class="form-check-input" disabled> Answer 1</div>
                                        <div class="mb-2"><input type="checkbox" class="form-check-input" disabled> Answer 2 <span><i class="fa-solid fa-check text-success"></i></span> </div>
                                        <div class="mb-2"><input type="checkbox" class="form-check-input" disabled> Answer 3</div>
                                    </div>
                                    <div class="bg-success text-white py-3 px-3">
                                        <div>Correct Answer: Hello</div>
                                    </div>
                                </div>

                                <div class="px-5 py-2 text-danger">
                                    <div class="fw-bold mb-2" style="font-size: 20px;">
                                        Question 2
                                    </div>
                                    <div>
                                        A T.V. show’s executives raised the fee for commercials following a report that the show received a “ No.1” rating in a survey of viewers. What type of the description is?
                                    </div>
                                    <div class="mt-3">
                                        <div class="mb-2"><input type="checkbox" class="form-check-input" disabled> Answer 1</div>
                                        <div class="mb-2"><input type="checkbox" class="form-check-input" disabled> Answer 2 <span><i class="fa-solid fa-xmark text-danger"></i></span> </div>
                                        <div class="mb-2"><input type="checkbox" class="form-check-input" disabled> Answer 3</div>
                                    </div>

                                    <div class="bg-success text-white py-3 px-3">
                                        <div>Correct Answer: Hello</div>
                                    </div>
                                </div>

                                <c:forEach items="${queslist}" var="question">
                                    <div class="px-5 py-2">
                                        <div class="fw-bold mb-2" style="font-size: 20px;">
                                            Question 1
                                        </div>
                                    </div>
                                    
                                    <div>
                                        ${question.getQuestionContent()}
                                    </div>
                                    
                                    <div class="mt-3">
                                        <c:forEach items="${answerlist}" var="answer">
                                            <c:set var="isCorrect" value="${false}"></c:set>
                                            
                                            <c:forEach items="${correctanswerlist}" var="correctanswer">
                                                <c:if test="${answer.getAnswerId() == correctanswer.getAnswerId()}">
                                                    <c:set var="isCorrect" value="${true}"></c:set>
                                                </c:if>
                                            </c:forEach>
                                            
                                            <c:if test="${isCorrect == true}">
                                              <div class="mb-2"><input type="checkbox" class="form-check-input" disabled> ${answer.getAnswerContent()} <span><i class="fa-solid fa-check text-success"></i></span> </div>  
                                            </c:if>
                                              
                                            <c:if test="${isCorrect == false}">
                                                
                                            </c:if>
                                        </c:forEach>
                                    </div>
                                </c:forEach>

                            </div>
                        </div>


                    </div>
                </div>
                <div class="course-watch-right">
                    <div class="course-watch-right-content">
                        <h4 class="course-content-title px-4 py-3">Course Content</h4>
                        <div class="course-lesson-list">
                            <!-- Course lesson -->
                            <div class="course-lesson-container">
                                <div class="course-lesson d-flex justify-content-between px-4 align-items-center">
                                    <div class="course-lesson-left">
                                        <div class="course-lesson-left-title">
                                            1. Lesson 1
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
                                    <!-- course lesson child -->
                                    <a href="#">
                                        <div class="course-lesson-child  px-4 py-2">
                                            <div class="course-lesson-child-content d-flex justify-content-between align-items-center">
                                                <div class="course-lesson-child-content-title">1. Introduce abour DOM in HTMl</div>
                                                <i class="fa-solid fa-circle-check"></i>
                                            </div>
                                            <div class="course-lesson-child-footer">
                                                <i class="fa-solid fa-circle-play"></i>
                                                03:15
                                            </div>
                                        </div>
                                    </a>
                                    <!-- course lesson child -->

                                    <!-- course lesson child -->
                                    <a href="#">
                                        <div class="course-lesson-child  px-4 py-2">
                                            <div class="course-lesson-child-content d-flex justify-content-between align-items-center">
                                                <div class="course-lesson-child-content-title">1. Introduce abour DOM in HTMl</div>
                                                <i class="fa-solid fa-circle-check"></i>
                                            </div>
                                            <div class="course-lesson-child-footer">
                                                <i class="fa-solid fa-circle-play"></i>
                                                03:15
                                            </div>
                                        </div>
                                    </a>
                                    <!-- course lesson child -->

                                    <!-- course lesson child -->
                                    <a href="#">
                                        <div class="course-lesson-child  px-4 py-2">
                                            <div class="course-lesson-child-content d-flex justify-content-between align-items-center">
                                                <div class="course-lesson-child-content-title">1. Introduce abour DOM in HTMl</div>
                                                <i class="fa-solid fa-circle-check"></i>
                                            </div>
                                            <div class="course-lesson-child-footer">
                                                <i class="fa-solid fa-circle-play"></i>
                                                03:15
                                            </div>
                                        </div>
                                    </a>
                                    <!-- course lesson child -->
                                    <!-- Course lesson child container -->
                                </div>
                                <!-- Course lesson --> 

                                <!-- Course lesson -->
                                <div class="course-lesson-container">
                                    <div class="course-lesson d-flex justify-content-between px-4 align-items-center">
                                        <div class="course-lesson-left">
                                            <div class="course-lesson-left-title">
                                                2. Lesson 2
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
                                        <!-- course lesson child -->
                                        <a href="#">
                                            <div class="course-lesson-child  px-4 py-2">
                                                <div class="course-lesson-child-content d-flex justify-content-between align-items-center">
                                                    <div class="course-lesson-child-content-title">2. Introduce abour DOM in HTMl</div>
                                                    <i class="fa-solid fa-circle-check"></i>
                                                </div>
                                                <div class="course-lesson-child-footer">
                                                    <i class="fa-solid fa-circle-play"></i>
                                                    03:15
                                                </div>
                                            </div>
                                        </a>
                                        <!-- course lesson child -->

                                        <!-- course lesson child -->
                                        <a href="#">
                                            <div class="course-lesson-child  px-4 py-2">
                                                <div class="course-lesson-child-content d-flex justify-content-between align-items-center">
                                                    <div class="course-lesson-child-content-title">2. Introduce abour DOM in HTMl</div>
                                                    <i class="fa-solid fa-circle-check"></i>
                                                </div>
                                                <div class="course-lesson-child-footer">
                                                    <i class="fa-solid fa-circle-play"></i>
                                                    03:15
                                                </div>
                                            </div>
                                        </a>
                                        <!-- course lesson child -->

                                        <!-- course lesson child -->
                                        <a href="#">
                                            <div class="course-lesson-child  px-4 py-2">
                                                <div class="course-lesson-child-content d-flex justify-content-between align-items-center">
                                                    <div class="course-lesson-child-content-title">2. Introduce abour DOM in HTMl</div>
                                                    <i class="fa-solid fa-circle-check"></i>
                                                </div>
                                                <div class="course-lesson-child-footer">
                                                    <i class="fa-solid fa-circle-play"></i>
                                                    03:15
                                                </div>
                                            </div>
                                        </a>
                                        <!-- course lesson child -->
                                        <!-- Course lesson child container -->
                                    </div>

                                    <!-- Course lesson -->     

                                    <!-- Course lesson -->
                                    <div class="course-lesson-container">
                                        <div class="course-lesson d-flex justify-content-between px-4 align-items-center">
                                            <div class="course-lesson-left">
                                                <div class="course-lesson-left-title">
                                                    3. Lesson 3
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
                                            <!-- course lesson child -->
                                            <a href="#">
                                                <div class="course-lesson-child  px-4 py-2">
                                                    <div class="course-lesson-child-content d-flex justify-content-between align-items-center">
                                                        <div class="course-lesson-child-content-title">3. Introduce abour DOM in HTMl</div>
                                                        <i class="fa-solid fa-circle-check"></i>
                                                    </div>
                                                    <div class="course-lesson-child-footer">
                                                        <i class="fa-solid fa-circle-play"></i>
                                                        03:15
                                                    </div>
                                                </div>
                                            </a>
                                            <!-- course lesson child -->

                                            <!-- course lesson child -->
                                            <a href="#">
                                                <div class="course-lesson-child  px-4 py-2">
                                                    <div class="course-lesson-child-content d-flex justify-content-between align-items-center">
                                                        <div class="course-lesson-child-content-title">3. Introduce abour DOM in HTMl</div>
                                                        <i class="fa-solid fa-circle-check"></i>
                                                    </div>
                                                    <div class="course-lesson-child-footer">
                                                        <i class="fa-solid fa-circle-play"></i>
                                                        03:15
                                                    </div>
                                                </div>
                                            </a>
                                            <!-- course lesson child -->

                                            <!-- course lesson child -->
                                            <a href="#">
                                                <div class="course-lesson-child  px-4 py-2">
                                                    <div class="course-lesson-child-content d-flex justify-content-between align-items-center">
                                                        <div class="course-lesson-child-content-title">3. Introduce abour DOM in HTMl</div>
                                                        <i class="fa-solid fa-circle-check"></i>
                                                    </div>
                                                    <div class="course-lesson-child-footer">
                                                        <i class="fa-solid fa-circle-play"></i>
                                                        03:15
                                                    </div>
                                                </div>
                                            </a>
                                            <!-- course lesson child -->
                                            <!-- Course lesson child container -->
                                        </div>

                                        <!-- Course lesson -->     
                                    </div>
                                </div>
                            </div>

                            </section>

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
