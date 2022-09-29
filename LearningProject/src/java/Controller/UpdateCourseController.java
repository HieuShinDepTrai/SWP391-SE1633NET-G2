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
        request.getRequestDispatcher("").forward(request, response);
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CourseDAO cd = new CourseDAO();
        int courseId = Integer.parseInt(request.getParameter("courseid"));
        request.setAttribute("Course", cd.getAllCourseInformation(courseId));
        if(request.getParameter("button") != null){
            if(request.getParameter("button").equals("delete")){
                cd.disableCourse(courseId);
            }
            else{
                response.sendRedirect("updatesection");
            }
        }
        doGet(request, response);
    }

}
