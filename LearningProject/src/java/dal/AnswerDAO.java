/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Model.Answer;
import com.oracle.wls.shaded.org.apache.xpath.operations.Bool;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author vuman
 */
public class AnswerDAO extends DBContext {

    public ArrayList<Answer> getAnswersOfQuestion(int questionId) {
        ArrayList<Answer> answerlist = new ArrayList<Answer>();
        try ( ResultSet rs = executeQuery("SELECT [AnswerID], [AnswerContent], [isCorrect] FROM [dbo].[Answer] WHERE [QuestionID] = ?", questionId)) {
            while (rs.next()) {
                answerlist.add(new Answer(rs.getInt("AnswerID"), rs.getNString("AnswerContent"), questionId, rs.getBoolean("isCorrect")));
            }

            return answerlist;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public void addAnswer(Answer answer) {
        try {
            execute("insert into Answer\n"
                    + "values(?, ?, ?)", answer.getAnswerContent(), answer.getQuestionId(), answer.isIsCorrect());
        } catch (Exception e) {
            System.out.println("addAnswer: ");
            e.printStackTrace();
        }
    }
}
