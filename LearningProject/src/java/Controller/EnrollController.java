/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import Model.UserCourse;
import dal.CourseDAO;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author ASUS
 */
public class EnrollController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
        //Enroll in Course Detail
        CourseDAO cDAO = new CourseDAO();
         UserDAO u = new UserDAO();
         HttpSession ses = request.getSession();
        //enroll in course detail
        String op = request.getParameter("op");
        int CourseID = Integer.parseInt(request.getParameter("id"));
        
       if (op.equals("Enroll") && ses.getAttribute("username") != null ) {
            int UserID = u.getAllUserInformation(ses.getAttribute("username").toString()).getUserId();
            u.insertIntoUserCourse(UserID, CourseID);
            request.getRequestDispatcher("CourseDetails").forward(request, response);
       }    else {
           response.sendRedirect("login");
       }
        
        
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
        //Enroll in home page
        UserDAO u = new UserDAO();
        HttpSession ses = request.getSession();
        int CourseID = Integer.parseInt(request.getParameter("courseID"));        
        String op = request.getParameter("op");
        
        if (op.equals("Enroll") && ses.getAttribute("username") != null ) {
            int UserID = u.getAllUserInformation(ses.getAttribute("username").toString()).getUserId();
        
            u.insertIntoUserCourse(UserID, CourseID);
            response.sendRedirect("home");
            
        } else {
            response.sendRedirect("login");
        }
        
                                
    }



}
