/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.Answer;
import Model.User;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.google.gson.annotations.JsonAdapter;
import dal.QuizDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author Dung
 */
public class DoQuizController extends HttpServlet {

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
            out.println("<title>Servlet DoQuizController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DoQuizController at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
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
        QuizDAO qzdao = new QuizDAO();
        if (request.getParameter("jsonQuestions") != null) {
            int quizID = 0;
            if(request.getParameter("quizID") != null) {
                quizID = Integer.parseInt(request.getParameter("quizID"));
            }
            HashMap<Integer, ArrayList<Integer>> data = new HashMap<>();
            
            String JsonData = request.getParameter("jsonQuestions");
            JsonArray json = new JsonParser().parse(JsonData).getAsJsonArray();
            for (JsonElement jsonElement : json) {
                JsonObject question = jsonElement.getAsJsonObject();
                String questionID = question.get("ques").getAsJsonArray().get(0).getAsJsonObject().get("questionID").getAsString();
                JsonArray answers =  question.get("ans").getAsJsonArray();
                ArrayList<Integer> answerList = new ArrayList();
                for (JsonElement answerJsonElement : answers) {
                    JsonObject answer = answerJsonElement.getAsJsonObject();
                    int answerID = Integer.parseInt(answer.get("ansID").getAsString());
                    boolean isChecked = answer.get("isCorrect").getAsBoolean();
                    
                    if(isChecked) {
                        answerList.add(answerID);
                    }
                }
                
                data.put(Integer.parseInt(questionID), answerList);
                
            }
            
            // Lay tu db
            HashMap<Integer, ArrayList<Integer>> dataOnDB = qzdao.getAnswers(quizID);
            
            int numberOfRightQuestion = 0;
            for (Map.Entry<Integer, ArrayList<Integer>> entry : data.entrySet()) {
                Object quesIdUser = entry.getKey();
                Object ansIdUser = entry.getValue();
                for (Map.Entry<Integer, ArrayList<Integer>> entry1 : dataOnDB.entrySet()) {
                    Object quesIdDB = entry1.getKey();
                    Object ansIdDB = entry1.getValue();
                    if(quesIdUser.equals(quesIdDB)) {
                        if(ansIdUser.equals(ansIdDB)) {
                            numberOfRightQuestion++;
                        }
                    }
                }
            }
            
            // Tinh diem
            double mark = numberOfRightQuestion / data.size();
            User u = (User) request.getSession().getAttribute("user");
            Date date = new Date();
            Timestamp doDate = new Timestamp(date.getTime());
            // Add DB
            qzdao.insertUserQuiz(u.getUserId(), quizID, mark, numberOfRightQuestion, doDate);
            // return user quizID
            int userQuizID = qzdao.getUserQuizID(doDate, u.getUserId());   
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

}