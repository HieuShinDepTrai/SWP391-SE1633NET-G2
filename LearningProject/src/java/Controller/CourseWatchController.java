/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.Course;
import Model.Docs;
import Model.Lesson;
import Model.Section;
import Model.Comment;
import dal.CourseDAO;
import dal.LessonDAO;
import dal.SectionDAO;
import dal.CommentDAO;
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
public class CourseWatchController extends HttpServlet {

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
            out.println("<title>Servlet CourseWatchController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CourseWatchController at " + request.getContextPath() + "</h1>");
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
       
        CommentDAO cmtDao = new CommentDAO();
              
        ArrayList<Comment> commentList = cmtDao.ListAllComment();



        
        request.setAttribute("commentList", commentList);
        request.getRequestDispatcher("CourseWatch.jsp").forward(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
            throws ServletException, IOException {
        // Check if user login or not
//        if (request.getSession().getAttribute("user") != null) {

            // Get course id 
            int courseID = 0;
            int sectionID = 0;
            int lessonID = 0;
            if(request.getParameter("courseID") != null) {
                courseID = Integer.parseInt(request.getParameter("courseID"));                
            }
            if(request.getParameter("sectionID") != null) {
                sectionID = Integer.parseInt(request.getParameter("sectionID"));                
            } 
            if(request.getParameter("lessonID") != null) {
                lessonID = Integer.parseInt(request.getParameter("lessonID"));                
            }
            CourseDAO cdao = new CourseDAO();
            SectionDAO sdao = new SectionDAO();
            LessonDAO ldao = new LessonDAO();

            // Get data from dao
            Course c = cdao.getCourseInformation(courseID);
            ArrayList<Section> listSection = sdao.getAllSectionOfCourse(courseID);
            ArrayList<Lesson> listLesson = new ArrayList<>();
            for (Section section : listSection) {
                ArrayList<Lesson> tmp = ldao.getAllLessonOfSection(section.getSectionId());
                for (Lesson lesson : tmp) {
                    listLesson.add(lesson);
//                    if (lesson.getType().compareTo("Video") == 0) {
//                        VideoDAO vdao = new VideoDAO();
//                        Video v = vdao.getVideoOfLesson(lesson.getLessonId());
//                        request.setAttribute("video", v);
//                        request.getRequestDispatcher("WatchCourse?courseID=" + courseID + 
//                                "&sectionID=" + section.getSectionId() + 
//                                "&lessonID=" + lesson.getLessonId()).forward(request, response);
//                    }
//                    if (lesson.getType().compareTo("Docs") == 0) {
//                        DocsDAO docdao = new DocsDAO();
//                        Docs docs = docdao.getDocsOfLesson(lesson.getLessonId());
//                        request.setAttribute("docs", docs);
//                        request.getRequestDispatcher("WatchCourse?lessonID=" + lesson.getLessonId()).forward(request, response);
//                    }
                }
            }
            
            Lesson lesson = ldao.getLessonbyLessonID(lessonID);

            // Send video list to jsp
            request.setAttribute("course", c);
            request.setAttribute("listSection", listSection);
            request.setAttribute("listLesson", listLesson);
            request.setAttribute("lesson", lesson);

            // Send id of lesson to jsp
            request.setAttribute("courseID", courseID);
            request.setAttribute("sectionID", sectionID);
            request.setAttribute("lessonID", lessonID);
            
            request.getRequestDispatcher("CourseWatch.jsp").forward(request, response);
//        } else {
//            // Send back to home pages
//            response.sendRedirect("home");
//        }
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
        processRequest(request, response);
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
