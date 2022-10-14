/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.Answer;
import Model.Lesson;
import Model.Question;
import Model.User;
import dal.AnswerDAO;
import dal.LessonDAO;
import dal.QuestionDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

/**
 *
 * @author Dung
 */
@WebServlet(name = "QuizQuestionController", urlPatterns = "/QuizQuestion")
public class QuizQuestionController extends HttpServlet {

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
            out.println("<title>Servlet QuizQuestionController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet QuizQuestionController at " + request.getContextPath() + "</h1>");
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

        LessonDAO ldao = new LessonDAO();
        QuestionDAO qdao = new QuestionDAO();
        AnswerDAO ansdao = new AnswerDAO();
        // Check Mentor role
        if (u.getRole().equals("Mentor")) {
            if (request.getParameter("lessonID") != null) {
                int lessonID = Integer.parseInt(request.getParameter("lessonID"));
                int quizID = ldao.getQuizID(lessonID);
                ArrayList<Question> questionList = qdao.getQuestionsOfQuiz(quizID);
                ArrayList<Answer> answerList = new ArrayList<>();
                for (Question question : questionList) {
                    ArrayList<Answer> temp = ansdao.getAnswersOfQuestion(question.getQuestionId());
                    for (Answer answer : temp) {
                        answerList.add(answer);
                    }

                }
                
                Lesson ls = ldao.getLessonbyLessonID(lessonID);

                request.setAttribute("lesson", ls);
                request.setAttribute("lessonID", lessonID);
                request.setAttribute("quizID", quizID);
                request.setAttribute("questionList", questionList);
                request.setAttribute("answerList", answerList);

                request.getRequestDispatcher("QuizQuestion.jsp").forward(request, response);
            }

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
//        PrintWriter out = response.getWriter();
//        String mode = request.getParameter("mode");
//        switch (mode) {
//            case "ViewQuestion":
//                viewQuestion(request, out);
//                break;
//        }

        User u = (User) request.getSession().getAttribute("user");

        LessonDAO ldao = new LessonDAO();
        QuestionDAO qdao = new QuestionDAO();
        AnswerDAO ansdao = new AnswerDAO();
        // Check Mentor role
        if (u.getRole().equals("Mentor")) {
            // Check if type equal add action

            if (request.getParameter("type") != null) {

                // Get question content
                String questionContent = request.getParameter("questionContent");
                int quizID = Integer.parseInt(request.getParameter("quizID"));
                // Add question to DB and get question ID
                int questionID = qdao.addQuestion(new Question(0, questionContent, quizID)) + 1;

                String[] answers = request.getParameterValues("answer");
                for (String answer : answers) {
                    String[] answerSplit = answer.split("[-]");
                    String answerContent = answerSplit[0];
                    String isAnswerString = answerSplit[1];
                    ansdao.addAnswer(new Answer(0, answerContent, questionID, isAnswerString.equals("true")));
                }

                int lessonID = Integer.parseInt(request.getParameter("lessonID"));
                response.sendRedirect("QuizQuestion?lessonID=" + lessonID);
            }

            if (request.getParameter("delete") != null) {
                int lessonID = Integer.parseInt(request.getParameter("lessonID"));
                int quesitonID = Integer.parseInt(request.getParameter("questionID"));
                qdao.deleteQuestion(quesitonID);
                response.sendRedirect("QuizQuestion?lessonID=" + lessonID);
            }
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

//    private void viewQuestion(HttpServletRequest request, PrintWriter out) {
//        int id = Integer.parseInt(request.getParameter("id"));
//        QuestionDAO qdao = new QuestionDAO();
//        Question q = qdao.getQuestionAndAnswer(id);
//        
//    }
}
