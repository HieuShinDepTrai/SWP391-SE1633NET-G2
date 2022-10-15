<%-- Document : AdminManageCourse Created on : Oct 11, 2022, 10:32:22 AM Author : Dung --%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
              crossorigin="anonymous">
        <link rel="stylesheet" href="assets/css/header.css">
        <title>Admin Manage Course</title>
    </head>

    <body style="font-family: 'Montserrat', sans-serif;">
        <%@include file="header.jsp" %>
        <div class="container-fluid w-100" style="margin-top: 66px;">
            <div class="row py-3 px-4">
                <div class="col-lg-12">
                    <h4 class="fw-bold">Admin Manage Course</h4>
                </div>
                <div class="col-lg-12">
                    <div class="card card-body shadow-sm" style="border-radius: 12px;">
                        <div class="row">
                            <div class="col-6">
                                <h6 class="fw-bold">Account List</h6>
                                <p style="color: rgba(0, 0, 0, 0.6)">This is list of all account</p>
                            </div>
                            <div class="col-6">
                                <div class="d-flex justify-content-end" style="position: relative;">
                                    <i class="fa-solid fa-magnifying-glass" style="position: absolute; left: 12px; top: 50%; transform: translateY(-50%);"></i>
                                    <input class="w-100 form-control" type="text" style="border-radius: 30px; padding-left: 32px;">
                                </div>
                            </div>
                            <div class="col-12">
                                <table class="table table-borderless">
                                    <thead>
                                    <th>Course Name</th>
                                    <th>Author</th>
                                    <th>Date Created</th>
                                    <th>Course Category</th>
                                    <th>Course Price</th>
                                    <th>Action</th>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${coursePendingList}" var="course"> 
                                            <tr>
                                                <td style="max-width: 180px">
                                                    <div class="d-flex">
                                                        <img src="assets/img/Asset 1.png" alt="" style="width: 48px; height: 48px; object-fit: cover; border-radius: 10px;">
                                                        <div class="ms-2">
                                                            <div class="fw-bold">${course.getCourseName()}o</div>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div>
                                                        <img src="${course.getAuthor().getAvatar()}" alt="" style="width: 32px; height: 32px; object-fit: cover; border-radius: 50%;">
                                                        <div class="d-inline-block" style="font-size: 14px; font-weight: 500;">${course.getAuthor().getUserName()}</div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div style="font-weight: 600">${course.getDateCreate()}</div>
                                                </td>
                                                <td>
                                                    <div>
                                                        <div style="background-color: #4dd4ac; border-radius: 32px; padding: 4px 8px; color: white; width: fit-content; font-weight: 500;">${course.getDateCreate()}</div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div>
                                                        <c:if test="${course.getCoursePrice() == 0}">
                                                            <div style="background-color: #ccc; border-radius: 32px; padding: 4px 8px; color: white; width: fit-content; font-weight: 500;">${course.getCategory()}</div>

                                                        </c:if>
                                                        <c:if test="${course.getCoursePrice() != 0}">
                                                            <div style="background-color: #ccc; border-radius: 32px; padding: 4px 8px; color: white; width: fit-content; font-weight: 500;">${course.getCoursePrice()}đ</div>

                                                        </c:if>    
                                                    </div>
                                                </td>
                                                <td>
                                                    <div>
                                                        <form action="AdminManageCourse?courseID=${course.getCourseID()}&Accept='true'" method="POST" class="d-inline">
                                                            <input type="submit" value="Accept" class="bg-success" style="border-radius: 32px; padding: 4px 8px; color: white; width: fit-content; font-weight: 500; outline: none; border: none;">
                                                        </form>
                                                        <form action="AdminManageCourse?courseID=${course.getCourseID()}&Denied='true'" method="POST" class="d-inline">
                                                            <input type="submit" value="Denied" class="bg-danger" style="border-radius: 32px; padding: 4px 8px; color: white; width: fit-content; font-weight: 500; outline: none; border: none;">
                                                        </form>  
                                                    </div>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        <!--                                        <tr>
                                                                                    <td style="max-width: 180px">
                                                                                        <div class="d-flex">
                                                                                            <img src="assets/img/Asset 1.png" alt="" style="width: 48px; height: 48px; object-fit: cover; border-radius: 10px;">
                                                                                            <div class="ms-2">
                                                                                                <div class="fw-bold">Course Title Front end Aadslkfjals HtML CXSS Pro</div>
                                                                                            </div>
                                                                                        </div>
                                                                                    </td>
                                                                                    <td>
                                                                                        <div>
                                                                                            <img src="assets/img/f8-logo.png" alt="" style="width: 32px; height: 32px; object-fit: cover; border-radius: 50%;">
                                                                                            <div class="d-inline-block" style="font-size: 14px; font-weight: 500;">Author name</div>
                                                                                        </div>
                                                                                    </td>
                                                                                    <td>
                                                                                        <div style="font-weight: 600">25/09/2022</div>
                                                                                    </td>
                                                                                    <td>
                                                                                        <div>
                                                                                            <div style="background-color: #4dd4ac; border-radius: 32px; padding: 4px 8px; color: white; width: fit-content; font-weight: 500;">Front-end</div>
                                                                                        </div>
                                                                                    </td>
                                                                                    <td>
                                                                                        <div>
                                                                                            <div style="background-color: #ccc; border-radius: 32px; padding: 4px 8px; color: white; width: fit-content; font-weight: 500;">100.000đ</div>
                                                                                        </div>
                                                                                    </td>
                                                                                    <td>
                                                                                        <div>
                                                                                            <a class="bg-success" style="border-radius: 32px; padding: 4px 8px; color: white; width: fit-content; font-weight: 500;">Accept</a>
                                                                                            <a class="bg-danger" style="border-radius: 32px; padding: 4px 8px; color: white; width: fit-content; font-weight: 500;">Denied</a>
                                                                                        </div>
                                                                                    </td>
                                                                                </tr>-->


                                    </tbody>
                                </table>
                                <div class="d-flex justify-content-center">
                                    <a href="#">Load More...</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="assets/js/home_page.js"></script>
        <script src="https://kit.fontawesome.com/7562df3d9f.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
    </body>

</html>