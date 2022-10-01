/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.Course;
import dal.CourseDAO;
import dal.LessonDAO;
import dal.SectionDAO;
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
        try {
            CourseDAO cd = new CourseDAO();
            LessonDAO pd = new LessonDAO();
            int courseId = Integer.parseInt(request.getParameter("courseid"));

            Course course = cd.getAllCourseInformation(courseId);
            
            if(course.getStatus().equals("Enabled   ")){
                cd.disableCourse(courseId);
                int newCourseId = cd.createClone(courseId);
                course = cd.getAllCourseInformation(newCourseId);
            }
            
            String tmp = course.getObjectives();
            String[] objectiveList = tmp.split("[/]+");

            request.setAttribute("course", course);
            request.setAttribute("objectivelist", objectiveList);

            request.getRequestDispatcher("UpdateCourse.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            CourseDAO cd = new CourseDAO();
            LessonDAO pd = new LessonDAO();
            
            int courseId = Integer.parseInt(request.getParameter("courseid"));
            
            if (request.getParameter("button") != null) {
                if (request.getParameter("button").equals("Add Objectives")){
                    String objective = request.getParameter("objectivename");
                    cd.insertNewObjective(objective, courseId);
                    
                    doGet(request, response);
                }
                if (request.getParameter("button").equals("Delete course")) {
                    cd.disableCourse(courseId);
                    response.sendRedirect("home");
                } else {
                    response.sendRedirect("updatesection");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
