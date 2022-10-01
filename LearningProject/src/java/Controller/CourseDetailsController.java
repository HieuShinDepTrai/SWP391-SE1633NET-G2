/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.Course;
import Model.Feedback;
import Model.Lesson;
import Model.Section;
import Model.User;
import dal.CourseDAO;
import dal.LessonDAO;
import dal.SectionDAO;
import dal.UserDAO;
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
public class CourseDetailsController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CourseDetailsController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CourseDetailsController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        CourseDAO cdao = new CourseDAO();
        SectionDAO sectionDao = new SectionDAO();
        LessonDAO lessonDAO = new LessonDAO();

        int id = Integer.parseInt(request.getParameter("id"));

        HttpSession session = request.getSession();
        User user = new User();
        if (session.getAttribute("user") != null) {
            user = (User) session.getAttribute("user");
        }

        Course course = cdao.getCourseInformation(id);
        // Add course objectives
        String courseObjectives = course.getObjectives();
        String[] objective = courseObjectives.split("[/]+");
        request.setAttribute("objective", objective);
        ArrayList<Feedback> feedbackList = cdao.getFeedBack(id);
        ArrayList<Section> sectionList = sectionDao.getAllSectionOfCourse(id);

        ArrayList<Lesson> lessonList = new ArrayList<Lesson>();

        for (Section section : sectionList) {
            ArrayList<Lesson> tmp = lessonDAO.getAllLessonOfSection(section.getSectionId());
            for (Lesson lesson : tmp) {
                lessonList.add(lesson);
            }
        }
        request.setAttribute("feedbackList", feedbackList);
        request.setAttribute("checkDup", new UserDAO().checkDupFeedback(user.getUserId(), id));
        request.setAttribute("course", course);
        request.setAttribute("sectionList", sectionList);
        request.setAttribute("lessonList", lessonList);
        int time = cdao.getCourseTime(course.getCourseID());
        String totalTime = (time / 1000) / 60 / 60 % 24 + " hours " + (time / 1000) / 60 % 60 + " minutes " + (time / 1000) % 60 + " seconds ";
        request.setAttribute("totalTime", totalTime);
        request.getRequestDispatcher("CourseDetails.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        double star = Double.parseDouble(request.getParameter("star"));
        String feedback = request.getParameter("feedback");
        int courseid = Integer.parseInt(request.getParameter("courseid"));

        HttpSession session = request.getSession();
        User user = new User();
        if (session != null) {
            user = (User) session.getAttribute("user");
        }

        new UserDAO().insertFeedbackAndStar(user.getUserId(), courseid, star, feedback);

        response.sendRedirect("CourseDetails?id=" + courseid);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
