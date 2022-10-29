/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.Answer;
import Model.Question;
import Model.User;
import dal.AnswerDAO;
import dal.QuestionDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.util.ArrayList;

/**
 *
 * @author vuman
 */
public class QuizResultReviewController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            
            User user = (User)session.getAttribute("user");
            if (user != null) {
                QuestionDAO quesdao = new QuestionDAO();
                AnswerDAO ad = new AnswerDAO();
                Timestamp time = (Timestamp)request.getAttribute("time");
                int quizId = Integer.parseInt((String)request.getAttribute("quizid"));
                ArrayList<Question> quesList = quesdao.getQuestionsOfQuiz(quizId);
                ArrayList<Answer> answerList = ad.getAnswersOfQuiz(quizId);
                ArrayList<Answer> correctAnswerList = ad.getCorrectAnswersOfQuiz(quizId);
                
                request.setAttribute("queslist", quesList);
                request.setAttribute("answerlist", answerList);
                request.setAttribute("correctanswerlist", correctAnswerList);
                
                request.getRequestDispatcher("QuizResultController.jsp").forward(request, response);
                
            }
        } catch (Exception e) {
            request.getRequestDispatcher("ErrorPage.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        super.doPost(request, response);
    }

}
