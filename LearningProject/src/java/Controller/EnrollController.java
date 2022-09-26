/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

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
        request.getRequestDispatcher("home").forward(request, response);
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        UserDAO u = new UserDAO();
        HttpSession ses = request.getSession();
        int CourseID = Integer.parseInt(request.getParameter("courseID"));
        int UserID = u.getAllUserInformation(ses.getAttribute("username").toString()).getUserId();
        
        u.insertIntoUserCourse(UserID, CourseID);
        doGet(request, response);
        
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
