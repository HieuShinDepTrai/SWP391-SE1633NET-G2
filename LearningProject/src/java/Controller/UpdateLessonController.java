/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import Model.Lesson;
import Model.Section;
import dal.CourseDAO;
import dal.LessonDAO;
import dal.SectionDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

/**
 *
 * @author vuman
 */
public class UpdateLessonController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        SectionDAO sd = new SectionDAO();
        LessonDAO ld = new LessonDAO();
        
        int courseId = Integer.parseInt(request.getParameter("courseid"));
        int sectionId = Integer.parseInt(request.getParameter("sectionid"));
        Section section = sd.getAllSectionInformation(sectionId);
        ArrayList<Lesson> lessonlist = ld.getAllLessonOfSection(sectionId);
        
        request.setAttribute("courseid", courseId);
        request.setAttribute("section", section);
        request.setAttribute("lessonlist", lessonlist);
        
        request.getRequestDispatcher("UpdateLesson.jsp").forward(request, response);
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        LessonDAO ld = new LessonDAO();
        if(request.getParameter("button") != null){
            if(request.getParameter("button").equals("Delete")){
                int lessonId = Integer.parseInt(request.getParameter("lessonid"));
                ld.disableLesson(lessonId);
            }
        }
        
        doGet(request, response);
    }

}
