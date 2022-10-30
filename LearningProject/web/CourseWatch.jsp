<%-- 
    Document   : CourseWatch
    Created on : Sep 30, 2022, 8:26:22 PM
    Author     : Dung
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
        <%@include file="header.jsp"%>
        <div id="main">            
            <section>
                <div class="course-watch-left">
                    <div class="course-watch-left-content" style="overflow-y: auto;">
                        <c:if test="${lesson.getType() == 'Video'}">
                            <div class="lesson-video">
                                <iframe width="100%" height="100%" src="${lesson.getVideoLink()}" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                            </div>
                            <div class="lesson-information">
                                <div class="lesson-description">
                                    <h3 class="lesson-title">
                                        ${lesson.getLessonName()}
                                    </h3>
                                </div>
                                <div class="lesson-comment" style="cursor: pointer;">
                                    Comment
                                </div>
                            </div>
                            <!-- Mark As Done -->                                
                            <div class="d-flex justify-content-center">
                                <c:if test="${lesson.getStatus() ne 'Done'}">
                                    <form action="WatchCourse" method="POST">
                                        <button class="btn btn-primary">Mark As Done</button>
                                        <input type="hidden" name="lessonID" value="${lessonID}">
                                        <input type="hidden" name="sectionID" value="${sectionID}">
                                        <input type="hidden" name="courseID" value="${courseID}">
                                    </form>
                                </c:if>
                            </div>
                            <!-- Mark As Done -->
                        </c:if>
                        <c:if test="${lesson.getType() == 'Docs'}">
                            <div class="lesson-information" style="display: block;">
                                <div class="lesson-description">
                                    <h1 class="lesson-title fw-bold" style="font-size: 48px">
                                        ${lesson.getLessonName()}
                                    </h1><br>
                                </div>
                                ${lesson.getContent()}
                            </div>
                            <div class="d-flex justify-content-between p-5">
                                <div class="d-flex justify-content-center">
                                    <c:if test="${lesson.getStatus() ne 'Done'}">                                            
                                        <form action="markasdone" method="POST">
                                            <button class="btn btn-primary">Mark As Done</button>
                                            <input type="hidden" name="lessonID" value="${lessonID}">
                                            <input type="hidden" name="sectionID" value="${sectionID}">
                                            <input type="hidden" name="courseID" value="${courseID}">
                                        </form>
                                    </c:if>
                                </div>
                                <div class="lesson-comment" style="cursor: pointer; width: fit-content">
                                    Comment
                                </div>
                            </div>

                        </c:if>

                        <c:if test="${lesson.getType() == 'Quiz'}">
                            <div class="lesson-content">
                                <div class="bg-primary p-5" style="height: 240px;">
                                    <div class="container p-2">
                                        <h3 class="text-white fw-bold">Question ${count} of ${number}</h3>
                                        <div class="question-content text-white" style="line-height: 28px;">
                                            ${question.getQuestionContent()}
                                        </div>
                                    </div>
                                </div>  
                                <div class="bg-light p-4">
                                    <div class="container d-flex justify-content-betweena align-items-center">
                                        <div class="container fw-bold">
                                            Choose the correct answer below:
                                        </div>
                                        <div class="container d-flex justify-content-end">
                                            <form action="WatchCourse?courseID=${courseID}&sectionID=${sectionID}&lessonID=${lessonID}&questionID=${questionID}" method="GET">
                                                <input type="hidden" value="${courseID}" name="courseID">
                                                <input type="hidden" value="${sectionID}" name="sectionID">
                                                <input type="hidden" value="${lessonID}" name="lessonID">
                                                <input type="hidden" value="${questionID}" name="questionID">
                                                <input type="hidden" value="${count}" name="count">
                                                <c:if test="${count ne number}">
                                                    <button type="submit" class="btn btn-danger">Next Question</button>
                                                </c:if>
                                                <c:if test="${count eq number}">
                                                    <button type="submit" class="btn btn-danger" disabled="">Next Question</button>
                                                </c:if>
                                            </form>

                                            <!-- If is last question: Show submit quiz -->
                                            <!-- <div class="btn btn-danger">Submit Quiz</div> -->

                                        </div>
                                    </div>
                                </div>
                                <div class="p-5">
                                    <div class="answer-title fw-bold mb-3">Your Answer:</div>
                                    <div class="answer-list">
                                        <!-- Answer -->
                                        <c:forEach items="${answer}" var="answers">
                                            <div class="form-check mb-3">
                                                <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault" style="width: 20px; height: 20px;"> 
                                                <label class="form-check-label fs-5" for="flexCheckDefault">
                                                    ${answers.getAnswerContent()}
                                                </label>
                                            </div>
                                        </c:forEach>

                                        <!-- Answer -->
                                    </div>
                                </div>
                            </div>
                        </c:if>
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
                                                <c:set var="totalLesson" value="${0}"></c:set>
                                                <c:set var="userTotalLesson" value="${0}"></c:set>
                                                    <!-- Begin: Lesson Progress -->   
                                                <c:forEach items="${listLesson}" var="lesson">
                                                    <c:if test="${lesson.getSectionId() == section.getSectionId()}">                                                        
                                                        <c:set var="totalLesson" value="${totalLesson+1}"></c:set>
                                                        <c:if test="${lesson.getStatus() eq 'Done'}">
                                                            <c:set var="userTotalLesson" value="${userTotalLesson+1}"></c:set>
                                                        </c:if>
                                                    </c:if>
                                                </c:forEach>
                                                <div class="course-lesson-progress d-inline">${userTotalLesson}/${totalLesson}</div>
                                                <div class="d-inline">|</div>
                                                <!-- End: Lesson Progress -->

                                                <!-- Begin: Section Time -->
                                                <%
                                                    int sectionTime = 0;
                                                %>
                                                <c:forEach items="${listLesson}" var="lesson">
                                                    <c:if test="${lesson.getSectionId() == section.getSectionId()}">

                                                        <c:set var="lessonTime" value="${lesson.getTime()}"></c:set>
                                                        <%
                                                            int lessonTime = Integer.parseInt(pageContext.getAttribute("lessonTime").toString());
                                                            sectionTime +=  lessonTime;
                                                        %>
                                                    </c:if>
                                                </c:forEach>
                                                <%
                                                    int minute = sectionTime / 60 % 60;
                                                    int second = sectionTime % 60;
                                                %>
                                                <div class="course-lesson-time d-inline"><%=minute%>:<%=second%></div>
                                                <!-- End: Section Time -->
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
                                                <c:if test="${lesson.getType() == 'Quiz'}">
                                                    <a href="WatchCourse?courseID=${course.getCourseID()}&sectionID=${section.getSectionId()}&lessonID=${lesson.getLessonId()}&questionID=0&count=0">
                                                        <div class="course-lesson-child  px-4 py-2">
                                                            <div class="course-lesson-child-content d-flex justify-content-between align-items-center">
                                                                <div class="course-lesson-child-content-title">${lesson.getLessonName()}</div>

                                                                <c:choose>
                                                                    <c:when test="${lesson.getStatus() eq 'Done'}">
                                                                        <i class="fa-solid fa-circle-check"></i>
                                                                    </c:when>                                                                
                                                                    <c:otherwise>
                                                                        <i class="fa-regular fa-circle"></i>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </div>

                                                            <div class="course-lesson-child-footer">
                                                                <i class="fa-solid fa-clipboard-question"></i>
                                                                <fmt:parseNumber var="time" type="number" integerOnly="true" value="${lesson.getTime()}"/>
                                                                <fmt:parseNumber var="minute" type="number" value="${time/60%60}" pattern="#" integerOnly="true"/>
                                                                <fmt:parseNumber var="second" type="number" integerOnly="true" value="${time%60}"/>
                                                                ${minute}:${second}

                                                            </div>
                                                        </div>
                                                    </a>
                                                </c:if>

                                                <c:if test="${lesson.getType() != 'Quiz'}">
                                                    <a href="WatchCourse?courseID=${course.getCourseID()}&sectionID=${section.getSectionId()}&lessonID=${lesson.getLessonId()}">
                                                        <div class="course-lesson-child  px-4 py-2">
                                                            <div class="course-lesson-child-content d-flex justify-content-between align-items-center">
                                                                <div class="course-lesson-child-content-title">${lesson.getLessonName()}</div>

                                                                <c:choose>
                                                                    <c:when test="${lesson.getStatus() eq 'Done'}">
                                                                        <i class="fa-solid fa-circle-check"></i>
                                                                    </c:when>                                                                
                                                                    <c:otherwise>
                                                                        <i class="fa-regular fa-circle"></i>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </div>
                                                                
                                                            <div class="course-lesson-child-footer">
                                                                <i class="fa-solid fa-circle-play"></i>
                                                                <fmt:parseNumber var="time" type="number" integerOnly="true" value="${lesson.getTime()}"/>
                                                                <fmt:parseNumber var="minute" type="number" value="${time/60%60}" pattern="#" integerOnly="true"/>
                                                                <fmt:parseNumber var="second" type="number" integerOnly="true" value="${time%60}"/>
                                                                ${minute}:${second}

                                                            </div>    
                                                        </div>        
                                                                
                                                    </a>
                                                </c:if>

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
            <div>
                <div class="course-comment-container" style="display: none;">
                    <div class="course-comment">
                        <i class="fa-solid fa-xmark course-comment-close" id="course-comment-close"></i>
                        <div class="course-comment-title">
                            ${numberOfComments} Comments
                            <span>(If you see spam comment, please report to admin)</span>
<!--                            <button class="btn btn-classic" onclick="loadAllComment()">View </button>-->
                        </div>

                        <!-- Begin: Course post comment -->

                        <form  action="postvideocomment" method="GET">
                            <input type="hidden" name="lessonID" value="${lessonID}">
                            <input type="hidden" name="courseID" value="${courseID}">
                            <input type="hidden" name="sectionID" value="${sectionID}">

                            <div class="course-post-comment-container">
                                <div class="course-comment-postcomment d-flex justify-content-between">
                                    <img src="${User.getAvatar()}" alt="none" class="user-avatar">
                                    <!-- <input type="text" class="content" placeholder="Comment" style="    width: 90%;
                                    border: none;
                                    border-bottom: 1px solid rgba(0, 0, 0, 0.2); outline: none;"> -->
                                    <textarea name="comment" id="commentContent" oninput="auto_height(this); active_comment_button(this)"></textarea>
                                </div>
                                <div class="course-postcomment-action" style="float: right;">
<!--                                    <p class="post-cancel d-inline-block me-4 fw-bold" >Cancel</p>-->
                                <input class="submit-comment" onclick="loadAllComment()" type="submit" name="op" value="Comment">
                                </div>
                            </div>
                        </form>

                        <!-- End: Course post comment -->

                        <!-- Comment List -->
                        <div class="course-comment-list d-flex flex-column w-100 gap-4" id="commentform">
                            <!-- Begin: Comment -->
                            <c:forEach items="${requestScope.parentComment}" var="parentComment">
                               
                                <div class="comment d-flex align-items-start">
<!--                                    <img src="assets/img/f8-logo.png" alt="" class="user-avatar">-->
                                    <img src="${parentComment.getUser().getAvatar()}" alt="none" class="user-avatar">
                                    <div class="comment-content">
                                        <form action="LikeComment" method="GET">
                                            <div class="comment-user">
                                                <div class="user-name">
                                                    ${parentComment.getUser().getLastName()} ${parentComment.getUser().getFirstName()}
                                                </div>
                                                <input name="commentContent" style="border:none" id="cmt${parentComment.getCommentId()}" type="text" value="${parentComment.getCommentContent()}" disabled>
                                            </div>
                                            <div class="comment-action">
                                                <div id="Like${parentComment.getCommentId()}">
                                                    <input type="hidden" name="lessonID" value="${lessonID}">
                                                    <input type="hidden" name="courseID" value="${courseID}">
                                                    <input type="hidden" name="sectionID" value="${sectionID}">
                                                    <input type="hidden" name="CommentID" value="${parentComment.getCommentId()}">
                                                    <c:if test="${!userCmtId.contains(parentComment.getCommentId())}">
                                                        <input style="border: none;background-color: white; color: #FD803A;" type="submit" name="op"  value="Like">
                                                    </c:if>
                                                    <c:if test="${userCmtId.contains(parentComment.getCommentId())}">
                                                        <input style="border: none;background-color: white; color: #FD803A;" type="submit" name="op" class="comment-action-content" value="Liked">
                                                    </c:if>
                                                </div>
                                                    <div id="NumberLikes${parentComment.getCommentId()}">${parentComment.getLikes()}</div>
                                                <div class="comment-action-content comment-action-content-reply d-none" id="Cancel${parentComment.getCommentId()}" data-cmt-cancel-id="${parentComment.getCommentId()}" onclick="disableOff(this)"> Cancel</div>
                                                <div class="dot">.</div>
                                                <div class="comment-action-content comment-action-content-reply" id="Edit${parentComment.getCommentId()}" data-cmt-id="${parentComment.getCommentId()}" onclick="disableOn(this)">Edit</div>
                                                <input style="border: none;background-color: white; color: #FD803A;" class="d-none" id="Save${parentComment.getCommentId()}" type="submit" name="op"  value="Save">
                                                <div class="dot">.</div>
                                                <div class="comment-action-content comment-action-content-reply" id="Reply${parentComment.getCommentId()}" data-cmt-reply="${parentComment.getCommentId()}" onclick="show_reply_post_comment(this)">Reply</div>
                                                <div class="dot" id="dotReply${parentComment.getCommentId()}">.</div>
                                                <div id="Report${parentComment.getCommentId()}">
                                                    
                                                    <!--<form action="Report" method="GET">-->

                                                    <c:if test="${!userCommentIdOfReport.contains(parentComment.getCommentId())}">
                                                        <input style="border: none;background-color: white; color: #FD803A;" type="submit" name="op" class="comment-action-content" value="Report">
                                                    </c:if>
                                                    <c:if test="${userCommentIdOfReport.contains(parentComment.getCommentId())}">
                                                        <input style="border: none;background-color: white; color: #FD803A;" type="submit" name="op" class="comment-action-content" value="Reported">
                                                    </c:if>
                                                        
                                                    <!--</form>-->
                                                </div>
                                                <div class="dot" id="dotReport${parentComment.getCommentId()}">.</div>
                                                <input style="border: none;background-color: white; color: #FD803A;" type="submit" name="op" class="comment-action-content" value="Delete">
                                                <div class="dot" id="dotReport${parentComment.getCommentId()}">.</div>
                                                <div class="comment-create-day" style="color: rgba(0, 0, 0, 0.4); font-weight: 600;">${parentComment.getCommentDate()}</div>
                                            </div>
                                        </form> 



                                        <!-- Reply Comment -->

                                        <div class="reply-comment d-none" id="ShowReply${parentComment.getCommentId()}">
                                            <form  action="postvideocomment" method="GET">
                                                <input type="hidden" name="lessonID" value="${lessonID}">
                                                <input type="hidden" name="courseID" value="${courseID}">
                                                <input type="hidden" name="sectionID" value="${sectionID}">
                                                <input type="hidden"  name="videoID" value="${videoID}">
                                                <div class="course-post-comment-container">
                                                    <div class="course-comment-postcomment d-flex justify-content-between">
                                                        <img src="${User.getAvatar()}" alt="none" class="user-avatar">
                                                        <!-- <input type="text" class="content" placeholder="Comment" style="    width: 90%;
                                                        border: none;
                                                        border-bottom: 1px solid rgba(0, 0, 0, 0.2); outline: none;"> -->
                                                        <textarea name="repComment" id="repComment" oninput="auto_height(this); active_comment_button(this)"></textarea>
                                                    </div>
                                                    <div class="course-postcomment-action" style="float: right;">
                                                        <div class="post-cancel d-inline-block me-4 fw-bold" data-cmt-cancel-id="${parentComment.getCommentId()}" onclick="CancelReply(this)">Cancel</div>

                                                        <input type="submit" name="op" value="Reply" class="submit-comment">                                     
                                                        <input type="hidden" name="pId" value="${parentComment.getCommentId()}">
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                        <!-- Reply Comment -->


                                        <!-- Show Reply Comment -->
                                        <div class="show-reply-comment " style="margin-left: 20px; margin-top: 10px;">
                                            <!--                                            <h6>Show reply comment<i class="fa-solid fa-chevron-down"></i></h6>-->
                                            <div class="show-reply-comment-content">
                                                <!-------------------------- Begin: Comment ------------------------------------------>

                                                <c:forEach items="${requestScope.commentOfLesson}" var="commentOfLesson">
                                                    <c:if test="${commentOfLesson.getParentId() == parentComment.getCommentId()}">
                                                        <div class="comment d-flex align-items-start">
                                                            <img src="${commentOfLesson.getUser().getAvatar()}" alt="none" class="user-avatar">
                                                            <div class="comment-content">

                                                                <form action="LikeComment" method="GET">
                                            <div class="comment-user">
                                                <div class="user-name">
                                                    ${commentOfLesson.getUser().getLastName()} ${commentOfLesson.getUser().getFirstName()}
                                                </div>
                                                <input name="commentContent" style="border:none" id="cmt${commentOfLesson.getCommentId()}" type="text" value="${commentOfLesson.getCommentContent()}" disabled>
                                            </div>
                                            <div class="comment-action">
                                                <div id="Like${commentOfLesson.getCommentId()}">
                                                    <input type="hidden" name="lessonID" value="${lessonID}">
                                                    <input type="hidden" name="courseID" value="${courseID}">
                                                    <input type="hidden" name="sectionID" value="${sectionID}">
                                                    <input type="hidden" name="CommentID" value="${commentOfLesson.getCommentId()}">
                                                    <c:if test="${!userCmtId.contains(commentOfLesson.getCommentId())}">
                                                        <input style="border: none;background-color: white; color: #FD803A;" type="submit" name="op"  value="Like">
                                                    </c:if>
                                                    <c:if test="${userCmtId.contains(commentOfLesson.getCommentId())}">
                                                        <input style="border: none;background-color: white; color: #FD803A;" type="submit" name="op" class="comment-action-content" value="Liked">
                                                    </c:if>
                                                </div>
                                                    <div id="NumberLikes${commentOfLesson.getCommentId()}">${commentOfLesson.getLikes()}</div>
                                                <div class="comment-action-content comment-action-content-reply d-none" id="Cancel${commentOfLesson.getCommentId()}" data-cmt-cancel-id="${commentOfLesson.getCommentId()}" onclick="disableOff(this)"> Cancel</div>
                                                <div class="dot">.</div>
                                                <div class="comment-action-content comment-action-content-reply" id="Edit${commentOfLesson.getCommentId()}" data-cmt-id="${commentOfLesson.getCommentId()}" onclick="disableOn(this)">Edit</div>
                                                <input style="border: none;background-color: white; color: #FD803A;" class="d-none" id="Save${commentOfLesson.getCommentId()}" type="submit" name="op"  value="Save">
                                                <div class="dot">.</div>
                                                <div class="comment-action-content comment-action-content-reply" id="Reply${commentOfLesson.getCommentId()}" onclick="show_reply_post_comment(this)">Reply</div>
                                                <div class="dot" id="dotReply${commentOfLesson.getCommentId()}">.</div>
                                                <div id="Report${commentOfLesson.getCommentId()}">
                                                    <!--<form action="Report" method="GET">-->

                                                    <c:if test="${!userCommentIdOfReport.contains(commentOfLesson.getCommentId())}">
                                                        <input style="border: none;background-color: white; color: #FD803A;" type="submit" name="op" class="comment-action-content" value="Report">
                                                    </c:if>
                                                    <c:if test="${userCommentIdOfReport.contains(commentOfLesson.getCommentId())}">
                                                        <input style="border: none;background-color: white; color: #FD803A;" type="submit" name="op" class="comment-action-content" value="Reported">
                                                    </c:if>
                                                    <!--</form>-->
                                                </div>
                                                <div class="dot" id="dotReport${commentOfLesson.getCommentId()}">.</div>
                                                <input style="border: none;background-color: white; color: #FD803A;" type="submit" name="op" class="comment-action-content" value="Delete">
                                                <div class="dot" id="dotReport${parentComment.getCommentId()}">.</div>
                                                <div class="comment-create-day" style="color: rgba(0, 0, 0, 0.4); font-weight: 600;">${commentOfLesson.getCommentDate()}</div>
                                            </div>
                                        </form>

                                                                <!-- Reply Comment -->

                                                                <div class="reply-comment d-none">
                                                                    <div class="course-post-comment-container">
                                                                        <div class="course-comment-postcomment d-flex justify-content-between">
                                                                            <img src="assets/img/f8-logo.png" alt="" class="user-avatar">
                                                                            <!-- <input type="text" class="content" placeholder="Comment" style="    width: 90%;
                                                                            border: none;
                                                                            border-bottom: 1px solid rgba(0, 0, 0, 0.2); outline: none;"> -->
                                                                            <textarea name="repComment" oninput="auto_height(this); active_comment_button(this)"></textarea>
                                                                        </div>
                                                                        <div class="course-postcomment-action" style="float: right;">
                                                                            <p class="post-cancel d-inline-block me-4 fw-bold">Cancel</p>

                                                                            <input type="submit" name="" value="Reply" class="submit-comment">                                     

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
                                                    </c:if>
                                                </c:forEach>

                                                <!---------------------------------------- End: Comment ---------------------------------->
                                            </div>
                                        </div>
                                        <!-- Show Reply Comment -->
                                    </div>
                                </div>

                            </c:forEach>
                            <!-- End: Comment -->
                        </div>

                        <!-- Comment List -->
                    </div>
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
        <script>
        function loadAllComment() {
            var Comment = document.getElementById("commentContent").value;
            $.ajax({
                url: "/LearningProject/loadcomment",
                type: 'GET',
                data:'lessonid=${lessonID}',
                success: function (data) {
                    var row = document.getElementById("commentform");
                    row.innerHTML = data;
                },
                error: function () {
                    console.log('Error');
                }
            });
        }
        </script>        
    </body>

</html>
