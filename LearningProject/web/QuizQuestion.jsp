<%-- 
    Document   : QuizQuestion.jsp
    Created on : Oct 13, 2022, 3:01:54 PM
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
        <style>
            @import url("https://fonts.googleapis.com/css2?family=Lato:wght@300;400;700;900&family=Montserrat:wght@400;500;600;700;800;900&display=swap");
        </style>
    </head>

    <body style="font-family: 'Montserrat', sans-serif;">
        <div class="py-5" style="padding-left: 120px; padding-right: 120px;">
            <div class="row">
                <div class="col-8 d-flex justify-content-between align-items-center">
                    <div>
                        <h4 class="fw-bolder mb-2">Quiz Question</h4>
                        <nav style="--bs-breadcrumb-divider: '>'" aria-label="breadcrumb">
                            <ol class="breadcrumb" style="font-size: 13px">
                                <li class="breadcrumb-item"><a href="#">Home</a></li>
                                <li class="breadcrumb-item"><a href="CreateSection?courseID=${courseID}">Create Course</a>
                                </li>
                                <li class="breadcrumb-item" aria-current="page">
                                    <a href="CreateSection?courseID=${courseID}">Create Lesson</a>
                                </li>
                                <li class="breadcrumb-item active" aria-current="page">
                                    Quiz Question
                                </li>
                            </ol>
                        </nav>
                        <p class="mb-2" style="color: rgba(0, 0, 0, 0.5); font-size: 15px;">Create
                            your quiz
                            below</p>
                    </div>
                    <div>
                        <button class="btn btn-primary" type="button" data-bs-toggle="collapse"
                                data-bs-target=".multi-collapse" aria-expanded="false">Show/Hide</button>
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
                            <c:forEach items="${questionList}" var="question" varStatus="index"> 
                                <!--Begin Question -->
                                <tr>
                                    <td>${index.count}</td>
                                    <td>
                                        <div class="card mb-2" style="border-radius: 8px;">
                                            <div class="card-body" data-bs-toggle="collapse" href="#test${index.count}" role="button"
                                                 aria-expanded="false" aria-controls="test${index.count}">
                                                <div class="question-name fw-bold">${question.getQuestionContent()}</div>
                                                <div class="collapse multi-collapse mt-3" id="test${index.count}">
                                                    <c:forEach items="${answerList}" var="ans">
                                                        <c:if test = "${ans.getQuestionId() == question.getQuestionId()}">
                                                            <c:if test="${ans.isIsCorrect() == true}">
                                                                <div class="card card-body mb-2 bg-success text-white">
                                                                    ${ans.getAnswerContent()}
                                                                </div> 
                                                            </c:if>
                                                            <c:if test="${ans.isIsCorrect() == false}">
                                                                <div class="card card-body mb-2">
                                                                    ${ans.getAnswerContent()}
                                                                </div> 
                                                            </c:if>
                                                        </c:if>
                                                    </c:forEach>
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                        <form action="QuizQuestion?delete='delete'&lessonID=${lessonID}&questionID='${question.getQuestionId()}" method="post">
                                            <input type="submit" href="QuizQuestion?delete='delete'&lessonID=${lessonID}&questionID='${question.getQuestionId()}'" class="btn btn-outline-danger" value="Delete">
                                            
                                        </form>
                                        <div class="btn btn-outline-primary" 
                                             data-bs-target="#editQuestionModal" index="${question.getQuestionId()}" onclick="sendParameter(this)">Edit</div>
                                    </td>
                                </tr>
                                <!-- End Question -->
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="col-4">
                    <div class="card w-100 shadow-sm" style="border-radius: 16px;">
                        <div class="card-body px-0">
                            <div class="p-3">
                                <label for="lessonTime" class="form-label" style="font-weight: 600; font-size: 15px;">Quiz
                                    Title</label>
                                <input type="text" class="form-control" id="lessonTime" disabled>
                            </div>
                            <div class="p-3">
                                <label for="lessonTime" class="form-label" style="font-weight: 600; font-size: 15px;">Lesson
                                    Time</label>
                                <input type="text" class="form-control" id="lessonTime" disabled>
                            </div>

                        </div>
                    </div>
                    <div class="btn btn-danger mt-3" data-bs-toggle="modal" data-bs-target="#addQuestionModal">Add Question
                    </div>
                </div>
            </div>

            <!-- Modal Add Question -->
            <form action="QuizQuestion?type='add'&quizID=${quizID}&lessonID=${lessonID}" method="post">                
                <div class="modal fade" id="addQuestionModal" tabindex="-1" aria-labelledby="addQuestionModal"
                     aria-hidden="true">
                    <div class="modal-dialog modal-fullscreen">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="addQuestionModal">Add Question</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body py-3 bg-light" style="padding-left: 240px; padding-right: 240px;">
                                <div class="mb-3">
                                    <label for="Question" class="form-label fw-bold">Question Content</label>
                                    <textarea class="form-control" name="questionContent"></textarea>
                                </div>
                                <div id="AnswerList">
                                    <label for="Answer" class="form-label fw-bold">Answer</label>
                                    <div class="mb-3">
                                        <div class="card card-body w-50 bg-success text-white d-inline-block">
                                            Answer1
                                            <input type="hidden" name="answer" value="Answer1-true">
                                        </div>
                                        <div class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#editAnswerModal"
                                             onclick="editAnswer($(this).prev())">Edit</div>
                                        <div class="btn btn-danger d-inline-block" onclick="remove(this.parentNode)">Remove
                                        </div>
                                    </div>

                                </div>
                                <div class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addAnswerModal">Add
                                    Answer</div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                <input type="submit" class="btn btn-primary" value="Save changes">
                            </div>
                        </div>
                    </div>
                </div>
            </form>
            <!-- Modal Add Question -->

            <!-- Modal Add Answer -->
            <div class="modal fade" id="addAnswerModal" tabindex="-1" aria-labelledby="addAnswerModal" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="addQuestionModal">Add Answer</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
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
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
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
            <div class="modal fade" id="editAnswerModal" tabindex="-1" aria-labelledby="editAnswerModal" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="">Edit Answer</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
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
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
            
            <script src="assets/js/create_lesson_quiz.js"></script>
            <script src="https://kit.fontawesome.com/7562df3d9f.js" crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                    integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"></script>
    </body>

</html>