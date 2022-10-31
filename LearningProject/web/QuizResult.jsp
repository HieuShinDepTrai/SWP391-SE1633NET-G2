<%-- 
    Document   : QuizResult
    Created on : Oct 30, 2022, 2:59:04 AM
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
            <div class="course-watch-left" style="overflow-y: auto;">
                <div class="course-watch-left-content">
                    <div class="lesson-content">
                        <div class="bg-primary py-5 px-4 fw-bold text-white fs-3">
                            Summary of your previous attempts
                            <span class="btn-danger btn float-end"><a href="DoQuiz?quizid=${quizid}">Return to quiz</a></span>
                        </div>

                        <div class="">
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Date attempt</th>
                                        <th>Number of correct answer</th>
                                        <th>Grade</th>
                                        <th>Review</th>

                                    </tr>
                                </thead>
                                <c:set var="count" value="${0}"></c:set>
                                <c:forEach items="${quizhislist}" var="quizhis">
                                    <c:set var="count" value="${count + 1}"></c:set>
                                        <tr class="fw-bold">
                                            <td>${count}</td>
                                        <td>${quizhis.getTime()}</td>
                                        <td>${quizhis.getCorrectAmount()}/${numofques}</td>
                                        <td>${quizhis.getMark()}/10</td>
                                        <td><a href="quizresultreview?userquizid=${quizhis.getUserQuizId()}&quizid=${quizhis.getQuizId()}"  class="text-danger">Review</a></td>
                                    </tr>
                                </c:forEach>
                            </table>
                        </div>
                    </div>


                </div>
            </div>

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
