/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Model.Lesson;
import Model.Quiz;
import Model.QuizDetail;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
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

    public ArrayList<QuizDetail> getAllQuizInCourseID(int courseID) {
        ArrayList<QuizDetail> lessonList = new ArrayList<>();
        LessonDAO lessonDAO = new LessonDAO();
        try {
            ResultSet rs = executeQuery("select q.QuizID from Lesson l\n"
                    + "inner join Quiz q on l.LessonID = q.LessonID\n"
                    + "inner join Section s on s.SectionID = l.SectionID\n"
                    + "where l.types = 'Quiz' and CourseID = " + courseID + "");
            while (rs.next()) {
                QuizDetail quiz = getQuizDetail(rs.getInt("QuizID"));
                lessonList.add(quiz);
            }
            return lessonList;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return lessonList;
    }

    public QuizDetail getQuizDetail(int quizid) {
        LessonDAO lessonDAO = new LessonDAO();
        try {
            ResultSet rs = executeQuery("select QuizID,LessonID,\n"
                    + "(select COUNT(DISTINCT(UserID)) from User_Answer ua\n"
                    + "inner join Answer a on ua.ChooseID = a.AnswerID\n"
                    + "inner join Question q on q.QuestionID = a.QuestionID where q.QuizID = " + quizid + ") as Enrolled,\n"
                    + "(select COUNT(DISTINCT(Time)) from User_Answer ua\n"
                    + "inner join Answer a on ua.ChooseID = a.AnswerID\n"
                    + "inner join Question q on q.QuestionID = a.QuestionID where q.QuizID = " + quizid + ") as Attempt,\n"
                    + "(select CAST((\n"
                    + "select count(*) from User_Answer ua\n"
                    + "inner join Answer a on ua.ChooseID = a.AnswerID\n"
                    + "inner join Question q on q.QuestionID = a.QuestionID\n"
                    + "where a.isCorrect = 1 and QuizID = " + quizid + ") * 100 / \n"
                    + "( select count(*) from User_Answer ua\n"
                    + "inner join Answer a on ua.ChooseID = a.AnswerID\n"
                    + "inner join Question q on q.QuestionID = a.QuestionID\n"
                    + "where QuizID = " + quizid + "\n"
                    + ") as INT)) AS Accuracy  \n"
                    + "from Quiz q\n"
                    + "where QuizID = " + quizid + " ");
            if (rs.next()) {
                QuizDetail quiz = new QuizDetail();
                quiz.setQuizid(rs.getInt("QuizID"));
                quiz.setAcc(rs.getInt("Accuracy"));
                quiz.setAttempt(rs.getInt("Attempt"));
                quiz.setEnrolled(rs.getInt("Enrolled"));
                quiz.setLesson(lessonDAO.getLessonbyLessonID(rs.getInt("LessonID")));
                return quiz;
            }
        } catch (SQLException ex) {
            return new QuizDetail();
        }
        return new QuizDetail();
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
