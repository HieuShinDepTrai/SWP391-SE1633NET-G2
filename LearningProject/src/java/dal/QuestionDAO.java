/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Model.Answer;
import Model.Question;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author vuman
 */
public class QuestionDAO extends DBContext {

    public ArrayList<Question> getQuestionsOfQuiz(int quizId) {
        ArrayList<Question> questionlist = new ArrayList<Question>();
        try ( ResultSet rs = executeQuery("SELECT [QuestionID], [QuestionContent] FROM [dbo].[Question] WHERE [QuizID] = ?", quizId)) {
            while (rs.next()) {
                questionlist.add(new Question(rs.getInt("QuestionID"), rs.getNString("QuestionContent"), quizId));
            }
            return questionlist;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public Question getQuestionAndAnswer(int questionID) {
        Question q = new Question();
        try {
            ResultSet rs = executeQuery("select q.QuestionID, q.QuestionContent,a.AnswerContent, a.isCorrect from dbo.Question q\n"
                    + "join Answer a on q.QuestionID = a.QuestionID\n"
                    + "where q.QuestionID = ?", questionID);
            ArrayList<Answer> answers = new ArrayList<>();
            boolean status = false;
            while (rs.next()) {
                if (status == false) {
                    q.setQuestionId(rs.getInt("QuestionID"));
                    q.setQuestionContent(rs.getString("QuestionContent"));
                    status = true;
                }
                answers.add(new Answer(0, rs.getString("AnswerContent"), 0, rs.getBoolean("isCorrect")));
            }
            q.setAnswers(answers);
        } catch (Exception e) {
            System.out.println("getQuestionAndAnswer: ");
            e.printStackTrace();
        }
        return q;
    }

    public int addQuestion(Question question) {
        try {
            ResultSet rs = executeQuery("SELECT IDENT_CURRENT('Question')\n"
                    + "insert into Question\n"
                    + "values(?, ?) ", question.getQuestionContent(), question.getQuizId());
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println("addQuestion: ");
            e.printStackTrace();
        }
        return -1;
    }

}
