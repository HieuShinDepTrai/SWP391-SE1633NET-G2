/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.Comment;
import Model.Video;
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
public class PostVideoCommentController extends HttpServlet {

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
            out.println("<title>Servlet PostCommentVideoController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PostCommentVideoController at " + request.getContextPath() + "</h1>");
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

        UserDAO userDAO = new UserDAO();
        CommentDAO cmtDao = new CommentDAO();

        ArrayList<Comment> commentList = cmtDao.ListAllComment();
        HttpSession ses = request.getSession();

        //get all comment to display into screen
        String username = (String) ses.getAttribute("username");
        int userId = userDAO.getAllUserInformation(username).getUserId();

        int getLessonId = Integer.parseInt(request.getParameter("lessonID"));
        Video video = cmtDao.getVideoIdByLessonId(getLessonId);
        int videoId = video.getVideoId();

        //cmtList for comment      
        try {
            String comment = request.getParameter("comment");
            String op = request.getParameter("op");

            if (op.equals("Comment")) {
                cmtDao.insertIntoCommentContentReply(comment, videoId, userId, 0);
            } else if (op.equals("Reply")) {
                //insert reply comment and the parent id
                String repComment = request.getParameter("repComment");
                int pId = Integer.parseInt(request.getParameter("pId"));
                //insert into comment that is a reply comment
                cmtDao.insertIntoCommentContentReply(repComment, videoId, userId, pId);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("commentList", commentList);
        //request.getRequestDispatcher("WatchCourse").forward(request, response);
        response.sendRedirect("WatchCourse?courseID=" + request.getParameter("courseID") + "&sectionID=" + request.getParameter("sectionID") + "&lessonID=" + request.getParameter("lessonID"));
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }
}
