/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.Course;
import Model.User;
import dal.CourseDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

/**
 *
 * @author Dung
 */
public class AdminManageCourseController extends HttpServlet {

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
            out.println("<title>Servlet AdminManageCourseController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminManageCourseController at " + request.getContextPath() + "</h1>");
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
        User u = (User) request.getSession().getAttribute("user");
        if (u.getRole().equals("Admin")) {
            CourseDAO cdao = new CourseDAO();
            String pendingCourseName = request.getParameter("pendingCourseName");
            if (pendingCourseName == null) {
                pendingCourseName = "";
            } else {
                pendingCourseName = request.getParameter("pendingCourseName").trim();
            }
            
            ArrayList<Course> coursePendingList = cdao.getPendingCourseByCourseName(pendingCourseName);
            request.setAttribute("coursePendingList", coursePendingList);
            
            String allCourseName = request.getParameter("allCourseName");
            if (allCourseName == null) {
                allCourseName = "";
            } else {
                allCourseName = request.getParameter("allCourseName").trim();
            }
            
            ArrayList<Course> allCourse = cdao.getAllCourseByCourseName(allCourseName);
            request.setAttribute("allCourse", allCourse);
            
            request.getRequestDispatcher("AdminManageCourse.jsp").forward(request, response);
        } else {
            response.sendRedirect("home");
        }
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
        User u = (User) request.getSession().getAttribute("user");
        if (u.getRole().equals("Admin")) {
            CourseDAO cdao = new CourseDAO();
            if (request.getParameter("Accept") != null) {
                int courseID = Integer.parseInt(request.getParameter("courseID"));
                cdao.updateCourseStatus(courseID, "Enabled");
            }
            if (request.getParameter("Denied") != null) {
                int courseID = Integer.parseInt(request.getParameter("courseID"));
                cdao.updateCourseStatus(courseID, "Denied");
            }
            
            if (request.getParameter("Enabled") != null) {
                int courseID = Integer.parseInt(request.getParameter("courseID"));
                cdao.updateCourseStatus(courseID, "Enabled");
            }
            
            if (request.getParameter("Disabled") != null) {
                int courseID = Integer.parseInt(request.getParameter("courseID"));
                cdao.updateCourseStatus(courseID, "Disabled");
            }
            response.sendRedirect("AdminManageCourse");
        } else {
            response.sendRedirect("home");
        }
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
