<%-- 
    Document   : WithdrawPage
    Created on : Oct 14, 2022, 1:44:42 AM
    Author     : NamDepTraiVL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="assets/css/header.css">
        <title>Admin Manage Account</title>
    </head>

    <body style="font-family: 'Montserrat', sans-serif;">
        <%@include file="header.jsp" %>
        <div class="container-fluid w-100" style="margin-top: 66px;">
            <div class="row py-3 px-4">
                <div class="col-lg-12">
                    <h4 class="fw-bold">Admin Manage Account</h4>
                </div>
                <div class="col-lg-12">
                    <div class="card card-body shadow-sm" style="border-radius: 12px;">
                        <div class="row">
                            <div class="col-6">
                                <h6 class="fw-bold">New Course Request</h6>
                                <c:set var="count" value="${0}"></c:set>
                                <c:forEach items="${withdrawList}" var="payment">
                                    <c:set var="count" value="${count+1}"></c:set>    
                                </c:forEach>
                                <p style="color: rgba(0, 0, 0, 0.6)">Have ${count} new course request</p>
                            </div>
                            <div class="col-6">
                                <div class="d-flex justify-content-end" style="position: relative;">
                                    <i class="fa-solid fa-magnifying-glass" style="position: absolute; left: 12px; top: 50%; transform: translateY(-50%);"></i>
                                    <input class="w-100 form-control" type="text" style="border-radius: 30px; padding-left: 32px;">
                                </div>
                            </div>
                            <div class="col-12">
                                <form action="withdrawmanagement" method="POST">
                                    <table class="table table-borderless">
                                        <thead>
                                        <th>Account</th>
                                        <th>TransactionID</th>
                                        <th>Account Bank</th>
                                        <th>Account Number</th>
                                        <th>Amount</th>
                                        <th>Status</th>
                                        </thead>
                                        <tbody>                                                                                
                                            <c:forEach items="${withdrawList}" var="payment">
                                                <tr>
                                                    <td style="max-width: 180px">
                                                        <div class="d-flex align-items-center">
                                                            <img src="assets/img/f8-logo.png" alt=""
                                                                 style="width: 40px; height: 40px; object-fit: cover; border-radius: 50%;">
                                                            <div class="ms-2">
                                                                <div class="fw-bold">${payment.getUser().getUserName()}</div>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div>
                                                            <div
                                                                style="background-color: #4dd4ac; border-radius: 32px; padding: 4px 8px; color: white; width: fit-content; font-weight: 500;">
                                                                ${payment.paymentID}</div>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div style="font-weight: 600">${payment.getUser().getBankName()}</div>
                                                    </td>
                                                    <td>
                                                        <div>
                                                            <div
                                                                style="font-weight: 500;">
                                                                ${payment.getUser().getBankNum()}</div>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div>
                                                            <div
                                                                style="background-color: #ccc; border-radius: 32px; padding: 4px 8px; color: white; width: fit-content; font-weight: 500;">
                                                                ${-payment.amount}đ</div>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div>
                                                            <a class="bg-success"
                                                               style="border-radius: 32px; padding: 4px 8px; color: white; width: fit-content; font-weight: 500;">Mark as success</a>
                                                            <input type="checkbox" name="${payment.paymentID}" value="Success">
                                                        </div>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                    <div class="d-flex justify-content-center">
                                        <button class="btn btn-success" type="submit">Save</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://kit.fontawesome.com/7562df3d9f.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
    </body>
</html>
