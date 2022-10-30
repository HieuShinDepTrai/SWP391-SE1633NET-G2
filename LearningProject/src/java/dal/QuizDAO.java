/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Model.Quiz;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;

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

    public HashMap<Integer, ArrayList<Integer>> getAnswers(int quizID) {
        HashMap<Integer, ArrayList<Integer>> data = new HashMap<>();
        try {
            ResultSet rs = executeQuery("select q.QuestionID, a.AnswerID "
                    + "from Question q, Answer a\n"
                    + "where q.QuizID = ? and q.QuestionID = a.QuestionID and a.isCorrect = 1 "
                    + "order by QuestionID asc ,AnswerID asc", quizID);
            while (rs.next()) {
                if (!data.containsKey(rs.getInt("QuestionID"))) {
                    data.put(rs.getInt("QuestionID"), new ArrayList<>());
                }
                data.get(rs.getInt("QuestionID")).add(rs.getInt("AnswerID"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return data;
    }

    public void insertUserQuiz(int userId, int quizID, double mark, int numberOfRightQuestion, Timestamp doDate) {
        try {
            executeUpdate("INSERT INTO [dbo].[User_Quiz]\n"
                    + "           ([UserID]\n"
                    + "           ,[QuizID]\n"
                    + "           ,[Mark]\n"
                    + "           ,[NumberOfRightQuestion]\n"
                    + "           ,[Date])\n"
                    + "     VALUES\n"
                    + "           (?"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?)",
                    userId, quizID, mark, numberOfRightQuestion, doDate);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public int getUserQuizID(Timestamp doDate, int userID) {
        try {
            ResultSet rs = executeQuery("select UserQuizID from dbo.[User_Quiz]\n"
                    + "where [Date] = ? and UserID = ?", doDate, userID);
            while (rs.next()) {
                return rs.getInt("UserQuizID");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }
}
