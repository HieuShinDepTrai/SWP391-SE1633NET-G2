<%-- 
    Document   : header
    Created on : Oct 2, 2022, 3:03:17 PM
    Author     : NamDepTraiVL
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
  
        <header>
            <div class="header-content">
                <div class="logo">
                    <a href="home"><img src="assets/img/Logo-FPT.webp" alt=""></a>
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
                    <a href="recharge" class="header-mycourse" style="text-decoration: none;color: #707070;">
                        Nạp tiền vào tài khoản
                    </a>
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
                    <c:if test="${user==null}">
                        <button class="btn btn-info"><a href="login" class="text-white fw-bold">Login</a></button>
                    </c:if>
                    <c:if test="${user!=null}">
                        <div class="avatar" onclick="event.stopPropagation()">
                            <c:if test="${user.getAvatar() != null}">
                                <img src="${user.getAvatar()}" alt="" style="width: 32px; height: 32px; object-fit: cover; border-radius: 50%;">                                
                            </c:if>
                            <c:if test="${user.getAvatar() == null}">
                                <img src="assets/img/user.png">
                            </c:if>
                            <div class="account-menu">
                                <div class="menu-content">
                                    <div class="menu-element">
                                        <i class="fa-solid fa-user"></i>
                                        <a href="AccountProfile" class="menu-title">Trang cá nhân</a>
                                    </div>
                                    <div class="menu-element">
                                        <i class="fa-solid fa-list"></i>
                                        <a href="userdashboard" class="menu-title">Khóa học của tôi</a>
                                    </div>
                                    <div class="menu-element">
                                        <i class="fa-solid fa-gear"></i>
                                        <a href="" class="menu-title">Cài đặt</a>
                                    </div>
                                    <div class="line">

                                    </div>
                                    <div class="menu-element">
                                        Account Balance:
                                        <a href="" class="menu-title"><fmt:formatNumber value="${user.getBalance()}" type="number" maxFractionDigits ="3"/>đ </a>
                                    </div>
                                    <div class="menu-element menu-logout">
                                        <i class="fa-solid fa-right-from-bracket"></i>
                                        <a href="logout" class="menu-title">Đăng xuất</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:if>

                </div>
            </div>
        </header>    


