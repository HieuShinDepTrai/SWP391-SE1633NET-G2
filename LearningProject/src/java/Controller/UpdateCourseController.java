/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import dal.CourseDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author vuman
 */
public class UpdateCourseController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("UpdateCourse.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            CourseDAO cd = new CourseDAO();
            int courseId = Integer.parseInt(request.getParameter("courseid"));
            cd.disableCourse(courseId);
            cd.createClone(courseId);
            request.setAttribute("Course", cd.getAllCourseInformation(courseId * (-1)));
            if (request.getParameter("button") != null) {
                if (request.getParameter("button").equals("delete")) {
                    cd.disableCourse(courseId);
                    response.sendRedirect("home");
                } else {
                    response.sendRedirect("updatesection");
                }
            }
            doGet(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
