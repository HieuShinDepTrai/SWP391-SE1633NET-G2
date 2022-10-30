/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Model.Quiz;
import Model.UserQuiz;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

/**
 *
 * @author vuman
 */
public class QuizDAO extends DBContext {

    public Quiz getQuizOfLesson(int lessonId) {
        try ( ResultSet rs = executeQuery("SELECT [QuizID], [Mark] FROM [dbo].[Quiz] WHERE [LessonID] = ?", lessonId)) {
            if (rs.next()) {
                return new Quiz(rs.getInt("QuizID"), rs.getDouble("Mark"), lessonId);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public void addQuiz(int lessonID) {
        try {
            execute("insert into Quiz\n"
                    + "values(0, ?)", lessonID);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public ArrayList<UserQuiz> getQuizHistory(int userId, int quizId){
        try {
            ArrayList<UserQuiz> quizHisList = new ArrayList<UserQuiz>();
            ResultSet rs = executeQuery("SELECT [UserQuizID], [Mark], [NumberOfRightQuestion], [Date] "
                    + "FROM [dbo].[User_Quiz] "
                    + "WHERE [UserID] = ? AND [QuizID] = ?", userId, quizId);
            
            while(rs.next()){
                Timestamp time = rs.getTimestamp("Date");
                SimpleDateFormat sdf = new SimpleDateFormat("E, dd MMM yyyy, hh:mm:ss a");
                String date = sdf.format(time);
                quizHisList.add(new UserQuiz(rs.getInt("UserQuizID"), userId, quizId, rs.getInt("NumberOfRightQuestion"), rs.getInt("Mark"), date));
            }
            
            return quizHisList;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
