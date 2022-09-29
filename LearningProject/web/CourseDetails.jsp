<%-- 
    Document   : CourseDetails
    Created on : Sep 29, 2022, 8:32:15 PM
    Author     : Dung
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Elearning</title>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
      crossorigin="anonymous"
    />
    <link rel="stylesheet" href="assets/css/header.css" />
    <link rel="stylesheet" href="assets/css/course_details.css" />
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
          <div class="header-search">
            <div class="icon-search">
              <i class="fa-solid fa-magnifying-glass"></i>
            </div>
            <input
              type="text"
              placeholder="Tìm kiếm khóa học, bài viết, video..."
            />
          </div>
          <div class="header-profile">
            <div class="header-mycourse">Khóa học của tôi</div>
            <div class="header-notification" onclick="event.stopPropagation()">
              <i class="fa-solid fa-bell"></i>
              <div
                class="notification-cotainer"
                onclick="event.stopPropagation()"
              >
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
        <!-- Begin: Side Bar -->
        <div id="side-bar-container">
          <div id="side-bar">
            <div class="bar-button button-hover" onclick="activeHome()">
              <i class="fa-solid fa-house"></i>
              <p class="button-title">Home</p>
            </div>
            <div class="bar-button" onclick="activeCourse()">
              <i class="fa-solid fa-road"></i>
              <p class="button-title">My Course</p>
            </div>
            <div class="bar-button">
              <i class="fa-solid fa-newspaper"></i>
              <p class="button-title">Blog</p>
            </div>
          </div>
        </div>
        <!-- End: Side Bar -->

        <!-- Begin: Course Details -->
        <div class="course-details-container">
          <div class="course-details">
            <div class="course-details-left">
              <h2 class="course-details-title">Kiến Thức Nhập Môn IT</h2>
              <p class="course-details-description">
                Để có cái nhìn tổng quan về ngành IT - Lập trình web các bạn nên
                xem các videos tại khóa này trước nhé.
              </p>
<!--              <div class="course-objectives">
                <div class="course-objective-title">Bạn sẽ học được gì?</div>
                <div class="course-objective-list">
                  <div class="objective">
                    <i class="fa-solid fa-check"></i>
                    <p>Các kiến thức cơ bản, nền móng của ngành IT</p>
                  </div>
                  <div class="objective">
                    <i class="fa-solid fa-check"></i>
                    <p>Các kiến thức cơ bản, nền móng của ngành IT</p>
                  </div>
                  <div class="objective">
                    <i class="fa-solid fa-check"></i>
                    <p>Các kiến thức cơ bản, nền móng của ngành IT</p>
                  </div>
                  <div class="objective">
                    <i class="fa-solid fa-check"></i>
                    <p>Các kiến thức cơ bản, nền móng của ngành IT</p>
                  </div>
                </div>
              </div>-->

              <!-- Course Agenda -->
              <div class="course-agenda">
                <h3 class="course-agenda-title">Nội dung khóa học</h3>
                <div class="course-agenda-description">
                  <div class="course-agenda-left">
                    <div class="course-chapter">
                      <span class="fw-bold">4</span> Chapter
                    </div>
                    <span>.</span>
                    <div class="course-lesson">
                      <span class="fw-bold">12</span> lessons
                    </div>
                    <span>.</span>
                    <div class="course-time">
                      Time <span class="fw-bold">03 hours 26 minutes</span>
                    </div>
                  </div>
                  <div class="course-agenda-right">
                    <p>Expand all</p>
                  </div>
                </div>
                <div class="course-agenda-section">
                  <div class="section-list">
                    <!-- Course Chapter -->
                    <div class="course-section-container">
                      <div
                        class="course-section course-active d-flex justify-content-between flex-wrap"
                      >
                        <div
                          class="course-section-left d-flex justify-content-between align-items-center"
                        >
                          <i class="fa-solid fa-plus"></i>
                          <p>1. Chapter 1: Introduce HTML and CSS</p>
                        </div>
                        <div class="course-section-right">2 lessons</div>
                      </div>
                      <!-- Lesson content -->
                      <div class="course-section-content" style="display: none">
                        <div
                          class="course-content d-flex justify-content-between px-4 py-3"
                        >
                          <div
                            class="course-content-left d-flex align-items-center"
                          >
                            <i class="fa-solid fa-play me-2"></i>
                            <p>1. Lesson 1: Hello HTML</p>
                          </div>
                          <div class="course-content-right">11:02</div>
                        </div>

                        <div
                          class="course-content d-flex justify-content-between px-4 py-3"
                        >
                          <div
                            class="course-content-left d-flex align-items-center"
                          >
                            <i class="fa-solid fa-play me-2"></i>
                            <p>1. Lesson 2: Hello HTML</p>
                          </div>
                          <div class="course-content-right">11:02</div>
                        </div>

                        <div
                          class="course-content d-flex justify-content-between px-4 py-3"
                        >
                          <div
                            class="course-content-left d-flex align-items-center"
                          >
                            <i class="fa-solid fa-play me-2"></i>
                            <p>1. Lesson 3: Hello HTML</p>
                          </div>
                          <div class="course-content-right">11:02</div>
                        </div>
                      </div>
                      <!-- Lesson content -->
                    </div>
                    <!-- Course Chapter -->

                    <!-- Course Chapter -->
                    <div class="course-section-container">
                      <div
                        class="course-section course-active d-flex justify-content-between flex-wrap"
                      >
                        <div
                          class="course-section-left d-flex justify-content-between align-items-center"
                        >
                          <i class="fa-solid fa-plus"></i>
                          <p>1. Chapter 1: Introduce HTML and CSS</p>
                        </div>
                        <div class="course-section-right">2 lessons</div>
                      </div>
                      <!-- Lesson content -->
                      <div class="course-section-content" style="display: none">
                        <div
                          class="course-content d-flex justify-content-between px-4 py-3"
                        >
                          <div
                            class="course-content-left d-flex align-items-center"
                          >
                            <i class="fa-solid fa-play me-2"></i>
                            <p>1. Lesson 1: Hello HTML</p>
                          </div>
                          <div class="course-content-right">11:02</div>
                        </div>

                        <div
                          class="course-content d-flex justify-content-between px-4 py-3"
                        >
                          <div
                            class="course-content-left d-flex align-items-center"
                          >
                            <i class="fa-solid fa-play me-2"></i>
                            <p>1. Lesson 1: Hello HTML</p>
                          </div>
                          <div class="course-content-right">11:02</div>
                        </div>

                        <div
                          class="course-content d-flex justify-content-between px-4 py-3"
                        >
                          <div
                            class="course-content-left d-flex align-items-center"
                          >
                            <i class="fa-solid fa-play me-2"></i>
                            <p>1. Lesson 1: Hello HTML</p>
                          </div>
                          <div class="course-content-right">11:02</div>
                        </div>
                      </div>
                      <!-- Lesson content -->
                    </div>
                    <!-- Course Chapter -->
                  </div>
                </div>
              </div>
              <!-- Course Agenda -->
            </div>
            <div class="course-details-right">
              <div class="course-details-right-content">
                <div class="course-details-thumbnail">
                  <img src="assets/img/htmlcss.avif" alt="" />
                </div>
                <div class="course-details-price my-2">Free</div>
                <a href="#" class="enroll-button my-1">Enroll</a>
                <div class="course-details-description">
                  <div class="description">
                    <i class="fa-solid fa-signal"></i>
                    Beginner
                  </div>
                  <div class="description">
                    <i class="fa-solid fa-video"></i>
                    This course have <span class="lessons">12</span> lessons
                  </div>
                  <div class="description">
                    <i class="fa-solid fa-clock"></i>
                    This course take
                    <span class="lessons">03 hours 26 minutes</span>
                  </div>
                  <div class="description">
                    <i class="fa-solid fa-battery-full"></i>
                    Learn any time, any where
                  </div>
                </div>
              </div>
            </div>
          </div>

          <!-- Begin: Course Feedback -->
          <div class="container-fluid">
            <div class="row px-4">
              <div class="">
                <h4 class="fw-bold mb-3">Course Feedback</h4>
                <p
                  class="mb-3 btn btn-primary"
                  data-bs-toggle="modal"
                  data-bs-target="#Feedback"
                  onclick="rating()"
                >
                  Post Feedback
                </p>
              </div>
              <!-- Begin: Feedback -->
              <div class="row col-8 mb-4">
                <div class="col-1">
                  <img
                    src="assets/img/f8-logo.png"
                    alt=""
                    class="img-fluid rounded-circle"
                  />
                </div>
                <div class="col-11">
                  <div
                    class="feed-back-content rounded-3 shadow-sm px-4 py-3"
                    style="background-color: #fff"
                  >
                    <h6 class="fw-bold mb-2">dungssj12</h6>
                    <div class="feed-back-star mb-2">
                      <i class="fa-solid fa-star"></i>
                      <i class="fa-solid fa-star"></i>
                      <i class="fa-solid fa-star"></i>
                      <i class="fa-solid fa-star"></i>
                      <i class="fa-solid fa-star"></i>
                      (5 star)
                    </div>
                    <p class="fb-content">
                      Lorem Ipsum is simply dummy text of the printing and
                      typesetting industry. Lorem Ipsum has been the industry's
                      standard dummy text ever since the 1500s, when an unknown
                      printer took a galley of type and scrambled it to make a
                      type specimen book. It has survived not only five
                      centuries, but also the leap into electronic typesetting,
                      remaining essentially unchanged. It was popularised in the
                      1960s with the release of Letraset sheets containing Lorem
                      Ipsum passages, and more recently with desktop publishing
                      software like Aldus PageMaker including versions of Lorem
                      Ipsum.
                    </p>
                  </div>
                </div>
              </div>
              <!-- End: Feedback -->

              <!-- Begin: Feedback -->
              <div class="row col-8 mb-4">
                <div class="col-1">
                  <img
                    src="assets/img/f8-logo.png"
                    alt=""
                    class="img-fluid rounded-circle"
                  />
                </div>
                <div class="col-11">
                  <div
                    class="feed-back-content rounded-3 shadow-sm px-4 py-3"
                    style="background-color: #fff"
                  >
                    <h6 class="fw-bold mb-2">dungssj12</h6>
                    <div class="feed-back-star mb-2">
                      <i class="fa-solid fa-star"></i>
                      <i class="fa-solid fa-star"></i>
                      <i class="fa-solid fa-star"></i>
                      <i class="fa-solid fa-star"></i>
                      <i class="fa-solid fa-star"></i>
                      (5 star)
                    </div>
                    <p class="fb-content">
                      Lorem Ipsum is simply dummy text of the printing and
                      typesetting industry. Lorem Ipsum has been the industry's
                      standard dummy text ever since the 1500s, when an unknown
                      printer took a galley of type and scrambled it to make a
                      type specimen book. It has survived not only five
                      centuries, but also the leap into electronic typesetting,
                      remaining essentially unchanged. It was popularised in the
                      1960s with the release of Letraset sheets containing Lorem
                      Ipsum passages, and more recently with desktop publishing
                      software like Aldus PageMaker including versions of Lorem
                      Ipsum.
                    </p>
                  </div>
                </div>
              </div>
              <!-- End: Feedback -->

              <!-- Begin: Feedback -->
              <div class="row col-8 mb-4">
                <div class="col-1">
                  <img
                    src="assets/img/f8-logo.png"
                    alt=""
                    class="img-fluid rounded-circle"
                  />
                </div>
                <div class="col-11">
                  <div
                    class="feed-back-content rounded-3 shadow-sm px-4 py-3"
                    style="background-color: #fff"
                  >
                    <h6 class="fw-bold mb-2">dungssj12</h6>
                    <div class="feed-back-star mb-2">
                      <i class="fa-solid fa-star"></i>
                      <i class="fa-solid fa-star"></i>
                      <i class="fa-solid fa-star"></i>
                      <i class="fa-solid fa-star"></i>
                      <i class="fa-solid fa-star"></i>
                      (5 star)
                    </div>
                    <p class="fb-content">
                      Lorem Ipsum is simply dummy text of the printing and
                      typesetting industry. Lorem Ipsum has been the industry's
                      standard dummy text ever since the 1500s, when an unknown
                      printer took a galley of type and scrambled it to make a
                      type specimen book. It has survived not only five
                      centuries, but also the leap into electronic typesetting,
                      remaining essentially unchanged. It was popularised in the
                      1960s with the release of Letraset sheets containing Lorem
                      Ipsum passages, and more recently with desktop publishing
                      software like Aldus PageMaker including versions of Lorem
                      Ipsum.
                    </p>
                  </div>
                </div>
              </div>
              <!-- End: Feedback -->

              <!-- Begin: Feedback -->
              <div class="row col-8 mb-4">
                <div class="col-1">
                  <img
                    src="assets/img/f8-logo.png"
                    alt=""
                    class="img-fluid rounded-circle"
                  />
                </div>
                <div class="col-11">
                  <div
                    class="feed-back-content rounded-3 shadow-sm px-4 py-3"
                    style="background-color: #fff"
                  >
                    <h6 class="fw-bold mb-2">dungssj12</h6>
                    <div class="feed-back-star mb-2">
                      <i class="fa-solid fa-star"></i>
                      <i class="fa-solid fa-star"></i>
                      <i class="fa-solid fa-star"></i>
                      <i class="fa-solid fa-star"></i>
                      <i class="fa-solid fa-star"></i>
                      (5 star)
                    </div>
                    <p class="fb-content">
                      Lorem Ipsum is simply dummy text of the printing and
                      typesetting industry. Lorem Ipsum has been the industry's
                      standard dummy text ever since the 1500s, when an unknown
                      printer took a galley of type and scrambled it to make a
                      type specimen book. It has survived not only five
                      centuries, but also the leap into electronic typesetting,
                      remaining essentially unchanged. It was popularised in the
                      1960s with the release of Letraset sheets containing Lorem
                      Ipsum passages, and more recently with desktop publishing
                      software like Aldus PageMaker including versions of Lorem
                      Ipsum.
                    </p>
                  </div>
                </div>
              </div>
              <!-- End: Feedback -->
            </div>
          </div>
          <!-- End: Course Feedback -->
        </div>
        <!-- End: Course Details -->
      </section>

      <!-- Modal Feedback-->
      <div
        class="modal fade"
        id="Feedback"
        tabindex="-1"
        aria-labelledby="Feedback"
        aria-hidden="true"
      >
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title fw-bold" id="exampleModalLabel">Feedback</h5>
              <button
                type="button"
                class="btn-close"
                data-bs-dismiss="modal"
                aria-label="Close"
              ></button>
            </div>
            <div class="modal-body">
              <div class="row">
                <div class="col-12">
                  <h5 class="mb-3">Rating</h5>
                  <!-- <select name="" id="" class="form-select" aria-label="Default select example"> 
                  <option selected>Open this select menu</option>
                  <option value="">1 star</option>
                  <option value="">2 star</option>
                  <option value="">3 star</option>
                  <option value="">4 star</option>
                  <option value="">5 star</option>
                </select> -->
                  <div class="star-rating mb-3">
                    <i class="fa-solid fa-star fs-3 star-rating-element"></i>
                    <i class="fa-solid fa-star fs-3 star-rating-element"></i>
                    <i class="fa-solid fa-star fs-3 star-rating-element"></i>
                    <i class="fa-solid fa-star fs-3 star-rating-element"></i>
                    <i class="fa-solid fa-star fs-3 star-rating-element"></i>
                  </div>
                  <input type="text" value="0" id="rate-star" class="d-none">
                  <h5 class="mb-3">Feedback</h5>
                  <textarea name="" id="" style="width: 100%; height: 200px; outline: none;"></textarea>
                </div>
              </div>
            </div>
            <div class="modal-footer">
              <button
                type="button"
                class="btn btn-secondary"
                data-bs-dismiss="modal"
              >
                Close
              </button>
              <button type="button" class="btn btn-primary">Save</button>
            </div>
          </div>
        </div>
      </div>
      <!-- Begin: Footer -->
      <!-- End: Footer -->
    </div>
    <script>
      let course_chapter = document.querySelectorAll(
        ".course-section-container"
      );
      course_chapter.forEach(function (current) {
        current.onclick = function () {
          let course_chapter = this.children[0];
          let course_icon = course_chapter.children[0].children[0];
          let course_lesson = this.children[1];
          if (course_lesson.style.display === "none") {
            course_lesson.style.display = "block";
            course_icon.classList.remove("fa-plus");
            course_icon.classList.add("fa-minus");
          } else {
            course_lesson.style.display = "none";
            course_icon.classList.remove("fa-minus");
            course_icon.classList.add("fa-plus");
          }
        };
      });

      let expand_all = document.querySelector(".course-agenda-right p");
      let course_lesson = document.querySelectorAll(".course-section-content");
      let course_section_icon = document.querySelectorAll(".course-section i");
      expand_all.onclick = function () {
        if (expand_all.innerHTML == "Hide") {
          course_lesson.forEach(function (current) {
            current.style.display = "none";
            course_section_icon.forEach(function (current) {
              current.classList.remove("fa-minus");
              current.classList.add("fa-plus");
            });
          });
          expand_all.innerHTML = "Expand all";
        } else {
          course_lesson.forEach(function (current) {
            current.style.display = "block";
            course_section_icon.forEach(function (current) {
              current.classList.remove("fa-plus");
              current.classList.add("fa-minus");
            });
          });
          expand_all.innerHTML = "Hide";
        }
      };
    </script>
    <script
      src="https://kit.fontawesome.com/7562df3d9f.js"
      crossorigin="anonymous"
    ></script>
    <script src="assets/js/home_page.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="assets/js/course_rating.js"></script>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
      crossorigin="anonymous"
    ></script>
  </body>
</html>
