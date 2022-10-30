/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.User;
import Model.UserQuiz;
import dal.QuestionDAO;
import dal.QuizDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.util.ArrayList;

/**
 *
 * @author vuman
 */
public class QuizResultController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        try {
            if (request.getSession().getAttribute("user") != null) {
                QuizDAO quizdao = new QuizDAO();
                QuestionDAO quesdao = new QuestionDAO();

                User user = (User) request.getSession().getAttribute("user");
                int quizId = Integer.parseInt(request.getParameter("quizid"));

                ArrayList<UserQuiz> quizHistoryList = quizdao.getQuizHistory(user.getUserId(), quizId);

                if (quizHistoryList != null) {
                    request.setAttribute("quizhislist", quizHistoryList);
                    request.setAttribute("numofques", quesdao.getNumberQuesOfQuiz(quizId));
                    request.getRequestDispatcher("QuizResult.jsp").forward(request, response);
                    return;
                } else {

                }
            } else {
                response.sendRedirect("home");
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
