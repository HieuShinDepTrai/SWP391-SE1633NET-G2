<%-- 
    Document   : CreateLesson
    Created on : Sep 30, 2022, 2:45:45 AM
    Author     : HieuShin
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
        <link rel="stylesheet" href="assets/css/create_course.css" />
        <style>
            @import url("https://fonts.googleapis.com/css2?family=Lato:wght@300;400;700;900&family=Montserrat:wght@400;500;600;700;800;900&display=swap");
        </style>
        <script src="https://cdn.tiny.cloud/1/no-api-key/tinymce/6/tinymce.min.js" referrerpolicy="origin"></script>
        <script>
            tinymce.init({
                selector: '#mytextarea'
            });
        </script>
        <script src="assets/js/add_lesson.js" type="text/javascript"></script>
    </head>

    <body>
        <div id="main">
            <%@include file="header.jsp"%>
            <!-- Begin: Create Course -->
            <section>
                <div class="create-course px-5 py-3">
                    <div class="create-course-header mb-3">
                        <h3 class="fw-bold">Create Lesson</h3>
                        <nav style="--bs-breadcrumb-divider: '>'" aria-label="breadcrumb">
                            <ol class="breadcrumb" style="font-size: 13px">
                                <li class="breadcrumb-item"><a href="#">Home</a></li>
                                <li class="breadcrumb-item"><a href="CreateSection?courseId=${courseID}">Create Section</a></li>
                                <li class="breadcrumb-item active" aria-current="page">
                                    Create Lesson
                                </li>
                            </ol>
                        </nav>
                        <h4 class="mb-3 fw-bold mb-1">Create lesson for ${section.getSectionName()}</h4>
                    </div>
                    <table class="table table-striped">
                        <thead>
                        <th>Lesson No</th>
                        <th>Lesson Name</th>
                        <th>Lesson Type</th>
                        <th>Time Duration (Milliseconds)</th>
                        <th>Action</th>
                        </thead>
                        <tbody>
                            <%
                                int count = 1;
                            %>
                            <c:forEach items="${lessons}" var="lesson">
                                <tr>
                                    <td><%=count%></td>
                                    <td>${lesson.getLessonName()}</td>
                                    <td>${lesson.getType()}</td>
                                    <td>${lesson.getTime()}</td>
                                    <td>
                                        <c:if test="${lesson.getType() == 'Quiz'}">
                                            <button class="btn btn-primary" data-bs-toggle="modal"
                                                        data-bs-target="#quizQuestion">Question</button>
                                        </c:if>
                                        <button class="btn btn-primary">Delete</button>
                                        <button class="btn btn-primary">Edit</button>
                                    </td>
                                </tr>
                                <% 
                                    count++; 
                                %>
                            </c:forEach>

                        </tbody>
                    </table>
                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                        Add New Lesson
                    </button>
                    <!-- Modal Main-->
                    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                         aria-hidden="true">
                        <div class="modal-dialog modal-fullscreen" style="max-width: unset">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title fw-bold" id="exampleModalLabel">Add Lesson</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                            aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <h3 class="text-center">Select type of lesson you want to add</h3>
                                    <div class="type-lesson-list mt-5">
                                        <div class="type-lesson shadow" data-bs-toggle="modal" data-bs-target="#document"> 
                                            <img src="assets/img/Asset 1.png" alt="">
                                            <div class="type-lesson-title">Document</div>
                                        </div>
                                        <div class="type-lesson shadow" data-bs-toggle="modal" data-bs-target="#video">
                                            <img src="assets/img/vidoe.png" alt="">
                                            <div class="type-lesson-title">Video</div>
                                        </div>
                                        <div class="type-lesson shadow" data-bs-toggle="modal" data-bs-target="#quiz">
                                            <div class="quizz-container d-flex flex-column">
                                                <img src="assets/img/Quizz.png" alt="">
                                                <div class="type-lesson-title">Quizzes</div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                    <button type="button" class="btn btn-primary">Save changes</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Modal Document-->
                    <form action="AddLesson?courseID=${courseID}&sectionID=${sectionID}" method="POST">
                        <div class="modal fade" id="document" tabindex="-1" aria-labelledby="document" aria-hidden="true">
                            <div class="modal-dialog modal-fullscreen" style="max-width: unset">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title fw-bold" id="exampleModalLabel">Add
                                            Document</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body py-5" style="padding-left: 240px; padding-right: 240px;">
                                        <h4 class="fw-bolder">Create Document</h4>
                                        <div class="row">
                                            <div class="col-12 mb-3">
                                                <label for="LessonTitle" class="form-label fw-bold">Lesson Title</label>
                                                <input type="text" class="form-control" name="lesson_tilte">
                                            </div>
                                            <div class="col-12 mb-3">
                                                <label for="LessonTitle" class="form-label fw-bold">Time to read (milliseconds)</label>
                                                <input type="number" class="form-control" name="time_to_read">
                                            </div>
                                            <div class="col-12 mb-3">
                                                <label for="LessonTitle" class="form-label fw-bold">Lesson Content</label>
                                                <textarea name="lesson_content" id="mytextarea" cols="30" rows="10" class="form-control"></textarea>
                                            </div>
                                            <input type="text" value="Docs" class="d-none" name="type">
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                        <button type="submit" class="btn btn-primary">Save
                                            changes</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>

                    <!-- Modal Document-->

                    <!-- Modal Video-->
                    <form action="AddLesson?courseID=${courseID}&sectionID=${sectionID}" method="POST" data-type="video">
                        <div class="modal fade" id="video" tabindex="-1" aria-labelledby="video" aria-hidden="true">
                            <div class="modal-dialog modal-fullscreen" style="max-width: unset">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title fw-bold" id="exampleModalLabel">Add
                                            Video</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body py-5" style="padding-left: 240px; padding-right: 240px;">
                                        <h4 class="fw-bolder">Create Video</h4>
                                        <div class="row">
                                            <div class="col-8">
                                                <div class="video-preview">
                                                    <iframe width="100%" height="420" src="https://www.youtube.com/embed/wHviCc5NZFQ" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" id="url-preview" style="display: none;"></iframe>                                        
                                                    <input name="video_url" type="hidden" value="" id="video-URL">
                                                    <i class="fa-brands fa-youtube icon-youtube"></i>
                                                </div>
                                            </div>
                                            <div class="col-4">
                                                <div class="col-12 mb-3">
                                                    <label for="Lesson title">Lesson title</label>
                                                    <input type="text" class="form-control" name="video_title">
                                                </div>
                                                <div class="col-12 mb-3">
                                                    <label for="Lesson title">Video URL</label>
                                                    <input name="url" type="text" class="form-control" id="video-url" oninput="video_preview()">
                                                </div>
                                                <input type="text" value="Video" class="d-none" name="type">
                                                <input type="text" name="sectionID" value="${sectionID}" class="d-none">
                                                <input type="text" class="d-none" name="duration">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                        <button type="button" class="btn btn-primary" onclick="doSubmit()">Save
                                            changes</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>

                    <!-- Modal Video-->

                    <!-- Modal Quiz-->
                    <form action="AddLesson?courseID=${courseID}&sectionID=${sectionID}" method="POST">
                        <div class="modal fade" id="quiz" tabindex="-1" aria-labelledby="quiz" aria-hidden="true">
                            <div class="modal-dialog modal-fullscreen">
                                <div class="modal-content bg-light">
                                    <div class="modal-header">
                                        <h5 class="modal-title fw-bold" id="exampleModalLabel">Add
                                            Quiz</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body py-5" style="padding-left: 120px; padding-right: 120px;">
                                        <div class="row">
                                            <div class="col-8 d-flex justify-content-between align-items-center">
                                                <div>
                                                    <h4 class="fw-bolder mb-2">Create Quiz</h4>
                                                    <p class="mb-2" style="color: rgba(0, 0, 0, 0.5); font-size: 15px;">Create
                                                        your quiz
                                                        below</p>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-8">
                                                <img src="assets/img/undraw_questions_re_1fy7.svg" alt="alt" class="img-fluid"/>
                                            </div>
                                            <div class="col-4">
                                                <div class="card w-100 shadow-sm" style="border-radius: 16px;">
                                                    <div class="card-body px-0">
                                                        <div class="p-3">
                                                            <label for="lessonTitle" class="form-label"
                                                                   style="font-weight: 600; font-size: 15px;">Quiz Title</label>
                                                            <input type="text" class="form-control" id="lessonTitle" name="lessonTitle">
                                                            <input type="hidden" value="Quiz" name="type">
                                                        </div>
                                                        <div class="p-3">
                                                            <label for="lessonTime" class="form-label"
                                                                   style="font-weight: 600; font-size: 15px;">Lesson Time</label>
                                                            <input type="text" class="form-control" id="lessonTime" name="lessonTime">
                                                        </div>

                                                    </div>
                                                </div>

                                            </div>
                                        </div>

                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                        <input type="submit" value="Save changes" class="btn btn-primary">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                    <!-- Modal Quiz-->

                    <!-- Modal Add Lesson For Quiz-->
                    <div class="modal fade" id="quizQuestion" tabindex="-1" aria-labelledby="quizQuestion" aria-hidden="true">
                        <div class="modal-dialog modal-fullscreen">
                            <div class="modal-content bg-light">
                                <div class="modal-header">
                                    <h5 class="modal-title fw-bold" id="exampleModalLabel">Quiz Question</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                            aria-label="Close"></button>
                                </div>
                                <div class="modal-body py-5" style="padding-left: 120px; padding-right: 120px;">
                                    <div class="row">
                                        <div class="col-8 d-flex justify-content-between align-items-center">
                                            <div>
                                                <h4 class="fw-bolder mb-2">Create Quiz</h4>
                                                <p class="mb-2" style="color: rgba(0, 0, 0, 0.5); font-size: 15px;">Create
                                                    your quiz
                                                    below</p>
                                            </div>
                                            <div>
                                                <button class="btn btn-primary" type="button" data-bs-toggle="collapse"
                                                        data-bs-target=".multi-collapse"
                                                        aria-expanded="false">Show/Hide</button>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-8">
                                            <table class="table table-bordered">
                                                <thead>
                                                <th>Number</th>
                                                <th>Question</th>
                                                <th>Action</th>
                                                </thead>
                                                <tbody>
                                                    <!--Begin Question -->
                                                    <tr>
                                                        <td>1</td>
                                                        <td>
                                                            <div class="card mb-2" style="border-radius: 8px;">
                                                                <div class="card-body" data-bs-toggle="collapse"
                                                                     href="#test3" role="button" aria-expanded="false"
                                                                     aria-controls="test3">
                                                                    <div class="question-name fw-bold">Differentiate between
                                                                        calloc() and malloc() ?</div>
                                                                    <div class="collapse multi-collapse mt-3" id="test3">
                                                                        <div class="card card-body mb-2">
                                                                            Answer 1
                                                                        </div>
                                                                        <div class="card card-body mb-2">
                                                                            Answer 1
                                                                        </div>
                                                                        <div class="card card-body mb-2 bg-success">
                                                                            Answer 1
                                                                        </div>
                                                                        <div class="card card-body mb-2">
                                                                            Answer 1
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="btn btn-outline-danger">Delete</div>
                                                            <div class="btn btn-outline-primary" data-bs-toggle="modal"
                                                                 data-bs-target="#editQuestionModal">Edit</div>
                                                        </td>
                                                    </tr>
                                                    <!-- End Question -->
                                                </tbody>
                                            </table>
                                        </div>
                                        <div class="col-4">
                                            <div class="card w-100 shadow-sm" style="border-radius: 16px;">
                                                <div class="card-body px-0">
                                                    <div class="p-3">
                                                        <label for="lessonTime" class="form-label"
                                                               style="font-weight: 600; font-size: 15px;">Quiz Title</label>
                                                        <input type="text" class="form-control" id="lessonTime">
                                                    </div>
                                                    <div class="p-3">
                                                        <label for="lessonTime" class="form-label"
                                                               style="font-weight: 600; font-size: 15px;">Lesson Time</label>
                                                        <input type="text" class="form-control" id="lessonTime">
                                                    </div>

                                                </div>
                                            </div>
                                            <div class="btn btn-danger mt-3" data-bs-toggle="modal"
                                                 data-bs-target="#addQuestionModal">Add Question</div>
                                        </div>
                                    </div>

                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                    <button type="button" class="btn btn-primary">Save
                                        changes</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Modal Add Lesson For Quiz-->

                    <!-- Modal Add Question -->
                    <div class="modal fade" id="addQuestionModal" tabindex="-1" aria-labelledby="addQuestionModal"
                         aria-hidden="true">
                        <div class="modal-dialog modal-fullscreen">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="addQuestionModal">Add Question</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                            aria-label="Close"></button>
                                </div>
                                <div class="modal-body py-3 bg-light" style="padding-left: 240px; padding-right: 240px;">
                                    <div class="mb-3">
                                        <label for="Question" class="form-label fw-bold">Question Content</label>
                                        <input type="text" class="form-control">
                                    </div>
                                    <div id="AnswerList">

                                        <label for="Answer" class="form-label fw-bold">Answer</label>

                                        <!-- <div class="card card-body w-50 mb-3 bg-danger text-white">
                                            Answer1
                                        </div> -->
                                        <div class="mb-3">
                                            <div class="card card-body w-50 bg-success text-white d-inline-block">
                                                Answer1
                                            </div>
                                            <div class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#editAnswerModal" onclick="editAnswer($(this).prev())">Edit</div>
                                            <div class="btn btn-danger d-inline-block" onclick="remove(this.parentNode)">Remove</div>
                                        </div>

                                    </div>
                                    <div class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addAnswerModal">Add
                                        Answer</div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                    <button type="button" class="btn btn-primary">Save changes</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Modal Add Question -->


                    <!-- Modal Add Answer -->
                    <div class="modal fade" id="addAnswerModal" tabindex="-1" aria-labelledby="addAnswerModal"
                         aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="addQuestionModal">Add Answer</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                            aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <div class="mb-3">
                                        <label for="" class="form-label">Answer Content</label>
                                        <textarea name="" id="addAnswer" style="height: 180px;" class="form-control"></textarea>
                                    </div>
                                    <div class="form-check">
                                        <input type="checkbox" class="form-check-input" id="isAnswer">
                                        <label for="isAnswer" class="form-check-label">Is Answer ?</label>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                    <button type="button" class="btn btn-primary" onclick="addAnswer()">Save changes</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Modal Add Answer -->

                    <!-- Modal Edit Question -->
                    <div class="modal fade" id="editQuestionModal" tabindex="-1" aria-labelledby="editQuestionModal"
                         aria-hidden="true">
                        <div class="modal-dialog modal-fullscreen">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title">Edit Question</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                            aria-label="Close"></button>
                                </div>
                                <div class="modal-body py-3 bg-light" style="padding-left: 240px; padding-right: 240px;">
                                    <div class="mb-3">
                                        <label for="Question" class="form-label fw-bold">Question Content</label>
                                        <input type="text" class="form-control">
                                    </div>
                                    <div id="EditAnswerList">
                                        <label for="Answer" class="form-label fw-bold">Answer</label>
                                        <!-- <div class="card card-body w-50 mb-3 bg-danger text-white">
                                            Answer1
                                        </div> -->
                                        <div class="card card-body w-50 mb-3 bg-success text-white">
                                            Answer1
                                        </div>
                                    </div>
                                    <div class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addAnswerModal">Add
                                        Answer</div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                    <button type="button" class="btn btn-primary">Save changes</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Modal Edit Question -->

                    <!-- Modal Edit Answer -->
                    <div class="modal fade" id="editAnswerModal" tabindex="-1" aria-labelledby="editAnswerModal"
                         aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="">Edit Answer</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                            aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <div class="mb-3">
                                        <label for="" class="form-label">Answer Content</label>
                                        <textarea name="" id="editAnswer" style="height: 180px;" class="form-control"></textarea>
                                    </div>
                                    <div class="form-check">
                                        <input type="checkbox" class="form-check-input" id="editIsAnswer">
                                        <label for="isAnswer" class="form-check-label">Is Answer ?</label>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                    <button type="button" class="btn btn-primary" onclick="saveEditAnswer()">Save changes</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Modal Edit Answer -->
                </div>
            </section>
            <!-- End: Create Course -->

            <!-- Begin: Footer -->
            <!-- End: Footer -->
        </div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="assets/js/create_video_lesson.js"></script>
        <script src="https://kit.fontawesome.com/7562df3d9f.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
        <script src="assets/js/home_page.js"></script>
    </body>

</html>