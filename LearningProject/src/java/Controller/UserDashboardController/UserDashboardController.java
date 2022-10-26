/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.UserDashboardController;

import Model.Course;
import Model.User;
import Model.UserCourse;
import dal.CourseDAO;
import dal.UserDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;

/**
 *
 * @author NamDepTraiVL
 */
public class UserDashboardController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        CourseDAO courseDAO = new CourseDAO();
        UserDAO userDao = new UserDAO();
        ArrayList<Course> courseList = courseDAO.getAllUserCourse(session.getAttribute("username").toString());
        User user = (User) session.getAttribute("user");
        int time = userDao.getUserTotalTime(user.getUserId());
        String totalTime = (time / 1000) / 60 / 60 % 24 + " hours " + (time / 1000) / 60 % 60 + " minutes " + (time / 1000) % 60 + " seconds ";
        ArrayList<UserCourse> usList = courseDAO.getListUserCourseOfUser(user.getUserId());
        ArrayList<Course> favCourseList = new ArrayList<Course>();
        for (UserCourse course : usList) {
            if(course.isIsFavourite()){
                favCourseList.add(courseDAO.getAllCourseInformation(course.getCourseID()));
            }
        }

        request.setAttribute("favlist", favCourseList);
        request.setAttribute("totalTime", totalTime);
        request.setAttribute("user", user);
        request.setAttribute("allUserCourse", courseList.size());
        request.setAttribute("courseList", courseList);
        request.getRequestDispatcher("UserDashboard.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            UserDAO ud = new UserDAO();
            int courseId = Integer.parseInt(request.getParameter("courseID"));
            
            if (session.getAttribute("username") != null) {
                User user = (User) session.getAttribute("user");
            
                ud.unLikeCourse(courseId, user.getUserId());
            }
            
            response.sendRedirect("userdashboard");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
