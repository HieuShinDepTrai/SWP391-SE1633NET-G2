/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Model.Question;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author vuman
 */
public class QuestionDAO extends DBContext{
    public ArrayList<Question> getQuestionsOfQuiz(int quizId){
        ArrayList<Question> questionlist = new ArrayList<Question>();
        try(ResultSet rs = executeQuery("SELECT [QuestionID], [QuestionContent] FROM [dbo].[Question] WHERE [QuizID] = ?", quizId)){
            while(rs.next()){
                questionlist.add(new Question(rs.getInt("QuestionID"), rs.getNString("QuestionContent"), quizId));
            }
            return questionlist;
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return null;
    }
}
