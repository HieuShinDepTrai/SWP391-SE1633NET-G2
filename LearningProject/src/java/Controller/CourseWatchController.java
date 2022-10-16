/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.Course;
import Model.Docs;
import Model.Lesson;
import Model.Section;
import Model.Comment;
import Model.CurrentCourse;
import Model.Report;
import Model.User;
import Model.UserComment;
import Model.Video;

import dal.SectionDAO;
import dal.CommentDAO;
import dal.CourseDAO;
import dal.LessonDAO;
import dal.UserDAO;
import dal.VideoDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;

/**
 *
 * @author Dung
 */
public class CourseWatchController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CourseWatchController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CourseWatchController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        CommentDAO cmtDao = new CommentDAO();

//        int parentId = Integer.parseInt(request.getParameter("parentID"));
//        ArrayList<Comment> replyComment = cmtDao.ListAllReplyCommentByParentId(parentId);
        // ArrayList<Video> videoList = vidDAO.getAllVideo();
//        Check if user login or not
//        if (request.getSession().getAttribute("user") != null) {
        UserDAO uDao = new UserDAO();
        CommentDAO cmtDAO = new CommentDAO();
        CourseDAO cdao = new CourseDAO();
        SectionDAO sdao = new SectionDAO();
        LessonDAO ldao = new LessonDAO();

        // Get course id 
        int courseID = 0;
        int sectionID = 0;
        int lessonID = 0;

        HttpSession session = request.getSession();
        if (request.getParameter("courseID") != null) {
            courseID = Integer.parseInt(request.getParameter("courseID"));
        }
        if (courseID == 0) {
            request.getRequestDispatcher("ErrorPage.jsp").forward(request, response);
        }
        if (session.getAttribute("username") != null) {
            User user = (User) session.getAttribute("user");
            CurrentCourse currentCourse = cdao.getCurrentCourse(courseID, user.getUserId());
            if (currentCourse != null) {
                sectionID = currentCourse.getSectionID();
                lessonID = currentCourse.getLessonID();
            } else if (ldao.getFirstLessonOfCourse(courseID) != null) {
                Lesson lesson = ldao.getFirstLessonOfCourse(courseID);
                sectionID = lesson.getSectionId();
                lessonID = lesson.getLessonId();
            }
        } else {
            response.sendRedirect("login");
            return;
        }
        if (request.getParameter("sectionID") != null) {
            sectionID = Integer.parseInt(request.getParameter("sectionID"));
        }
        if (request.getParameter("lessonID") != null) {
            User user = (User) session.getAttribute("user");
            lessonID = Integer.parseInt(request.getParameter("lessonID"));
            ldao.MarkAs(lessonID, user.getUserId(), "Study");
        }

        int userId = uDao.getAllUserInformation(session.getAttribute("username").toString()).getUserId();

        ArrayList<UserComment> listUserComment = cmtDAO.getAllUserCommentByUserId(userId);

        ArrayList<Integer> userCmtId = new ArrayList<>();

        for (UserComment userComment : listUserComment) {
            userCmtId.add(userComment.getCommentId());
        }

        // Get data from dao
        Course c = cdao.getCourseInformation(courseID);
        ArrayList<Comment> parentCommentOfLesson = cmtDao.ListAllParentCommentByLessonID(lessonID);

        ArrayList<Comment> commentOfLesson = cmtDao.ListAllCommentByLessonID(lessonID);

        int count = 0;
        //list the number of comments by lessonID
        for (Comment com : commentOfLesson) {
            count++;
        }
        int numberOfComments = count;

        ArrayList<Section> listSection = sdao.getAllSectionOfCourse(courseID);
        ArrayList<Lesson> listLesson = new ArrayList<>();
        for (Section section : listSection) {
            ArrayList<Lesson> tmp = ldao.getAllLessonOfUserOFSection(section.getSectionId(), userId);
            //ArrayList<Lesson> tmp = ldao.getAllLessonOfSection(section.getSectionId());
            for (Lesson lesson : tmp) {
                listLesson.add(lesson);
            }
        }

        ArrayList<Report> listReport = cmtDAO.getAllReportByUserId(userId);

        ArrayList<Integer> userCommentIdOfReport = new ArrayList<>();

        for (Report report : listReport) {
            userCommentIdOfReport.add(report.getCommentID());
        }

        Lesson lesson = ldao.getLessonbyLessonID(lessonID);
        if (lessonID != 0) {
            lesson.setStatus(ldao.getLessonStatusOfUser(lessonID, userId));
        }

        //set arraylist ReportID by UserID
        request.setAttribute("userCommentIdOfReport", userCommentIdOfReport);
        //to get All comment of user that liked
        request.setAttribute("userCmtId", userCmtId);

        request.setAttribute("listUserComment", listUserComment);
        //number comments
        request.setAttribute("numberOfComments", numberOfComments);
        //all comment of leeson
        request.setAttribute("commentOfLesson", commentOfLesson);

        //all comment with parentID = 0
        request.setAttribute("parentComment", parentCommentOfLesson);
        // Send video list to jsp
        request.setAttribute("lesson", lesson);
        request.setAttribute("course", c);
        request.setAttribute("listSection", listSection);
        request.setAttribute("listLesson", listLesson);

        // Send id of lesson to jsp
        request.setAttribute("courseID", courseID);
        request.setAttribute("sectionID", sectionID);
        request.setAttribute("lessonID", lessonID);

        request.getRequestDispatcher("CourseWatch.jsp").forward(request, response);
//        } else {
//            // Send back to home pages
//            response.sendRedirect("home");
//        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
