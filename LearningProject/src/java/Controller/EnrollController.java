/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import Model.Course;
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
 * @author ASUS
 */
public class EnrollController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        CourseDAO cd = new CourseDAO();
        
        UserDAO u = new UserDAO();
        HttpSession ses = request.getSession();
        String username = ses.getAttribute("username").toString();
        int CourseID = Integer.parseInt(request.getParameter("courseID"));
        
        int UserID = u.getAllUserInformation(ses.getAttribute("username").toString()).getUserId();
        
        ArrayList<Course> courseList = cd.getAllUserCourse(username);
        request.setAttribute("courseList", courseList);
               
        u.insertIntoUserCourse(UserID, CourseID);
        response.sendRedirect("home");                         
    }



}
