<%-- 
    Document   : AccountTransactionHistory
    Created on : Oct 10, 2022, 12:49:10 PM
    Author     : Dung
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
        <%@include file="header.jsp"%>
        <!-- Begin: Account Profile Section -->
        <section>
            <div class="account-profile-container">
                <div class="account-profile-menu">
                    <div class="menu-header">
                        Account
                    </div>
                    <div class="menu-list">
                        <div class="menu">
                            <i class="fa-solid fa-user"></i>
                            <a href="#" class="menu-title">Personal Information</a>
                        </div>
                        <div class="menu  menu-active">
                            <i class="fa-solid fa-money-bill"></i>
                            <a href="#" class="menu-title">Transaction History</a>
                        </div>
                        <div class="menu">
                            <i class="fa-solid fa-lock menu-security"></i>
                            <a href="changepassword" class="menu-title">Change Password</a>
                        </div>
                        <div class="menu">
                            <i class="fa-solid fa-right-from-bracket menu-logout"></i>
                            <a href="logout" class="menu-title">Log Out</a>
                        </div>
                    </div>
                </div>

                <div class="account-profile-content link-profile active">
                    <!-- Begin: Profile Information -->
                    <div class="content-container">
                        <div class="content-header">
                            Personal Information
                        </div>
                        <div class="w-100 bg-white">
                            <table class="table table-bordered">
                                <thead>
                                    <th>#</th>
                                    <th>Transaction Date</th>
                                    <th>Ammount</th>
                                    <th>Transaction Type</th>
                                    <th>Status</th>
                                </thead>
                                <tbody>
                                    <td>1</td>
                                    <td>25/12/2002</td>
                                    <td>100.000đ</td>
                                    <td>Banking</td>
                                    <td><div class="btn btn-danger">Successful</div></td>
                                </tbody>
                            </table>
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

