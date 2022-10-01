/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.Course;
import Model.Section;
import dal.CourseDAO;
import dal.SectionDAO;
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
public class CreateSectionController extends HttpServlet {

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
            out.println("<title>Servlet CreateSectionController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CreateSectionController at " + request.getContextPath() + "</h1>");
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
        SectionDAO sdao = new SectionDAO();
        CourseDAO cdao = new CourseDAO();

        int courseId = 0;
        if (request.getParameter("courseId") != null) {
            courseId = Integer.parseInt(request.getParameter("courseId"));
            Course c = cdao.getCourseInformation(courseId);
            ArrayList<Section> listSection = sdao.getAllSectionOfCourse(courseId);

            request.setAttribute("listSection", listSection);
            request.setAttribute("courseID", courseId);
            request.setAttribute("course", c);

            request.getRequestDispatcher("CreateSection.jsp").forward(request, response);
            return;
        }
        response.sendRedirect("CreateSection.jsp");
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
        SectionDAO sdao = new SectionDAO();
        int courseId = Integer.parseInt(request.getParameter("courseId"));
        String sectionName = request.getParameter("SectionName");
        sdao.addSection(new Section(0, courseId, sectionName, false));
        response.sendRedirect("CreateSection?courseId=" + courseId);
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
