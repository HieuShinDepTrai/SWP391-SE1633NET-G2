/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import Model.Report;
import dal.CommentDAO;
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
 * @author ASUS
 */
public class ReportController extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ReportController</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ReportController at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
        UserDAO uDAO = new UserDAO();
        CommentDAO cmtDAO = new CommentDAO();
        
        HttpSession ses = request.getSession();
        
        int UserId = uDAO.getAllUserInformation(ses.getAttribute("username").toString()).getUserId();
        int cmtId = Integer.parseInt(request.getParameter("CommentID"));
        
        String op = request.getParameter("op");
        
        ArrayList<Report> listReport = cmtDAO.getAllReportByUserId(UserId);
        
        ArrayList<Integer> userCommentIdOfReport = new ArrayList<>();
        
        for (Report report : listReport) {
            userCommentIdOfReport.add(report.getCommentID());
        }
       
        if (op.equals("Report")) {
            cmtDAO.insertIntoReport(UserId, cmtId);
        } else if (op.equals("Reported")) {
            cmtDAO.deleteIntoReport(UserId, cmtId);
        }
        
        request.setAttribute("userCommentIdOfReport", userCommentIdOfReport);
        response.sendRedirect("WatchCourse?courseID=" + request.getParameter("courseID") 
                + "&sectionID=" + request.getParameter("sectionID") 
                + "&lessonID=" + request.getParameter("lessonID"));
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
