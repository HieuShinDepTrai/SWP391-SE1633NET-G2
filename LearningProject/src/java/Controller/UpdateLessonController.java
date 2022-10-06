/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.Docs;
import Model.Lesson;
import Model.Quiz;
import Model.Section;
import Model.Video;
import dal.CourseDAO;
import dal.DocsDAO;
import dal.LessonDAO;
import dal.QuizDAO;
import dal.SectionDAO;
import dal.VideoDAO;
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
        VideoDAO vd = new VideoDAO();
        DocsDAO dd = new DocsDAO();
        QuizDAO qd = new QuizDAO();

        int courseId = Integer.parseInt(request.getParameter("courseid"));
        int sectionId = Integer.parseInt(request.getParameter("sectionid"));
        Section section = sd.getAllSectionInformation(sectionId);

        ArrayList<Lesson> lessonlist = ld.getAllLessonOfSection(sectionId);
        ArrayList<Video> videolist = new ArrayList<Video>();
        ArrayList<Docs> docslist = new ArrayList<Docs>();
        ArrayList<Quiz> quizlist = new ArrayList<Quiz>();

        for (Lesson lesson : lessonlist) {
            if (lesson.getType().equals("Video")) {
                videolist.add(vd.getVideoOfLesson(lesson.getLessonId()));
            } else if (lesson.getType().equals("Docs")) {
                docslist.add(dd.getDocsOfLesson(lesson.getLessonId()));
            } else {
                quizlist.add(qd.getQuizOfLesson(lesson.getLessonId()));
            }

        }

        request.setAttribute("videolist", videolist);
        request.setAttribute("docslist", docslist);
        request.setAttribute("courseid", courseId);
        request.setAttribute("section", section);
        request.setAttribute("lessonlist", lessonlist);

        request.getRequestDispatcher("UpdateLesson.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        LessonDAO ld = new LessonDAO();
        CourseDAO cd = new CourseDAO();

        if (request.getParameter("button") != null) {
            if (request.getParameter("button").equals("Delete")) {
                int sectionId = Integer.parseInt(request.getParameter("sectionid"));
                int courseId = Integer.parseInt(request.getParameter("courseid"));
                int lessonId = Integer.parseInt(request.getParameter("lessonid"));
                ld.disableLesson(lessonId);

                response.sendRedirect("updatelesson?courseid=" + courseId + "&sectionid=" + sectionId);
            }
            if (request.getParameter("button").equals("Update video")) {
                int sectionId = Integer.parseInt(request.getParameter("sectionid"));
                int courseId = Integer.parseInt(request.getParameter("courseid"));
                int lessonId = Integer.parseInt(request.getParameter("LessonVideoId"));
                String lessonName = request.getParameter("LessonVideoName");
                String videoLink = request.getParameter("VideoLink");
                int time = Integer.parseInt(request.getParameter("time_duration"));

                ld.updateLessonVideo(lessonName, videoLink, lessonId, time);

                response.sendRedirect("updatelesson?courseid=" + courseId + "&sectionid=" + sectionId);
            }
            if (request.getParameter("button").equals("Update document")) {
                int sectionId = Integer.parseInt(request.getParameter("sectionid"));
                int courseId = Integer.parseInt(request.getParameter("courseid"));
                int lessonId = Integer.parseInt(request.getParameter("LessonDocsId"));
                String lessonName = request.getParameter("LessonDocsName");
                int time = Integer.parseInt(request.getParameter("Time"));
                String docsContent = request.getParameter("DocsContent");

                ld.updateLessonDocs(lessonName, time, docsContent, lessonId);

                response.sendRedirect("updatelesson?courseid=" + courseId + "&sectionid=" + sectionId);
            }
            if (request.getParameter("button").equals("Add video")) {
                int sectionId = Integer.parseInt(request.getParameter("sectionid"));
                int courseId = Integer.parseInt(request.getParameter("courseid"));
                String lessonName = request.getParameter("lessonvideoname");
                String videoURL = request.getParameter("videolink");
                int duration = Integer.parseInt(request.getParameter("duration"));

                ld.addLessonVideo(sectionId, lessonName, lessonName, videoURL, duration);

                response.sendRedirect("updatelesson?courseid=" + courseId + "&sectionid=" + sectionId);
            }
            if (request.getParameter("button").equals("Add document")) {
                int sectionId = Integer.parseInt(request.getParameter("sectionid"));
                int courseId = Integer.parseInt(request.getParameter("courseid"));
                String lessonName = request.getParameter("lessondocsname");
                int time = Integer.parseInt(request.getParameter("time"));
                String docsContent = request.getParameter("lessondocscontent");

                response.sendRedirect("updatelesson?courseid=" + courseId + "&sectionid=" + sectionId);

                ld.addLessonDoc(sectionId, lessonName, time, docsContent);
            }
            if (request.getParameter("button").equals("Save changes")) {
                int courseId = Integer.parseInt(request.getParameter("courseid"));
                cd.enableCourse(courseId);

                response.sendRedirect("home");
            }
        }
    }

}
