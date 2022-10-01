package dal;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
import Model.Answer;
import Model.Course;
import Model.Docs;
import Model.Feedback;
import Model.Lesson;
import Model.Question;
import Model.Quiz;
import Model.Section;
import Model.User;
import Model.Video;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.apache.tomcat.util.net.SSLHostConfigCertificate;

/**
 *
 * @author Hieu Shin
 */
public class CourseDAO extends DBContext {
    
    public ArrayList<Course> ListAllCourses() {
        ArrayList<Course> courses = new ArrayList<>();
        try {
            String sql = "SELECT \n"
                    + "[C].[CourseName], [C].[NumberEnrolled],[C].[CourseID],\n"
                    + "[C].[CoursePrice], [U].[FirstName] \n"
                    + "FROM [Course] C INNER JOIN [User] U\n"
                    + "ON [C].[AuthorID] = [U].[UserID]";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Course course = new Course();
                User user = new User();
                course.setCourseName(rs.getString("CourseName"));
                course.setNumberEnrolled(rs.getInt("NumberEnrolled"));
                course.setCoursePrice(rs.getDouble("CoursePrice"));
                course.setCourseID(rs.getInt("CourseID"));
                user.setFirstName(rs.getString("FirstName"));
                course.setAuthor(user);
                
                courses.add(course);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CourseDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return courses;
    }

    public Course getAllCourseInformation(int courseId) {
        try ( ResultSet rs = executeQuery("SELECT [CourseName],"
                + "[DateCreate],"
                + "[AuthorID],"
                + "[Category],"
                + "[NumberEnrolled],"
                + "[CoursePrice],"
                + "[CourseImage],"
                + "[Status],"
                + "[Description],"
                + "[Objectives],"
                + "[Difficulty] FROM [dbo].[Course] WHERE [CourseID] = ?", courseId)) {
            if (rs.next()) {
                return new Course(
                        courseId,
                        rs.getNString("CourseName"),
                        rs.getTimestamp("DateCreate"),
                        rs.getNString("Category"),
                        rs.getInt("NumberEnrolled"),
                        rs.getDouble("CoursePrice"),
                        rs.getString("CourseImage"),
                        rs.getString("Status"),
                        new UserDAO().getAllUserInformationByID(rs.getInt("AuthorID")),
                        rs.getNString("Description"),
                        rs.getNString("Objectives"),
                        rs.getString("Difficulty")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public Course getCourseInformation(int courseId) {
        try {
            String sql = "SELECT [CourseName],"
                    + "[DateCreate],"
                    + "[AuthorID],"
                    + "[Category],"
                    + "[NumberEnrolled],"
                    + "[CoursePrice],"
                    + "[CourseImage],"
                    + "[Status], "
                    + "[Description], "
                    + "[Objectives],"
                    + "[Difficulty] FROM [dbo].[Course] WHERE [CourseID] = " + courseId;
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            Course c = new Course();
            if (rs.next()) {
                c.setCourseID(courseId);
                c.setCourseName(rs.getNString("CourseName"));
                c.setDateCreate(rs.getTimestamp("DateCreate"));
                c.setAuthor(new UserDAO().getAllUserInformationByID(rs.getInt("AuthorID")));
                c.setCategory(rs.getString("Category"));
                c.setNumberEnrolled(rs.getInt("NumberEnrolled"));
                c.setCoursePrice(rs.getDouble("CoursePrice"));
                c.setCourseImage(rs.getString("CourseImage"));
                c.setStatus(rs.getString("Status"));
                c.setDescription(rs.getString("Description"));
                c.setObjectives(rs.getString("Objectives"));
                c.setDifficulty(rs.getString("Difficulty"));
            }
            return c;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public void disableCourse(int courseId) {
        try {
            executeUpdate("UPDATE [dbo].[Course] SET [Status] = 'Disabled' WHERE [CourseID] = ? ", courseId);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public int createClone(int courseId) {
        int newCourseID = 0;
        try {
            Course course = getAllCourseInformation(courseId);
            SectionDAO sd = new SectionDAO();
            LessonDAO ld = new LessonDAO();
            DocsDAO dd = new DocsDAO();
            VideoDAO vd = new VideoDAO();
            QuizDAO qd = new QuizDAO();
            QuestionDAO qtd = new QuestionDAO();
            AnswerDAO ad = new AnswerDAO();

            ArrayList<Section> sectionlist = sd.getAllSectionOfCourse(courseId);

            ResultSet rs = executeQuery("SELECT IDENT_CURRENT('Course')\nINSERT INTO [dbo].[Course] VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);",
                    course.getCourseName(),
                    course.getDateCreate(),
                    course.getAuthor().getUserId(),
                    course.getCategory(),
                    course.getNumberEnrolled(),
                    course.getCoursePrice(),
                    course.getCourseImage(),
                    "Disabled",
                    course.getDescription(),
                    course.getObjectives(),
                    course.getDifficulty());
            
            if (!rs.next()) return 0;
            
            newCourseID = rs.getInt(1) + 1;

            for (Section section : sectionlist) {
                rs = executeQuery("SELECT IDENT_CURRENT('Section')\nINSERT INTO [dbo].[Section] VALUES (?, ?, ?);",
                        newCourseID,
                        section.getSectionName(),
                        0);
                
                if (!rs.next()) return 0;
                
                int newSectionID = rs.getInt(1) + 1;
                
                ArrayList<Lesson> lessonlist = ld.getAllLessonOfSection(section.getSectionId());
                for (Lesson lesson : lessonlist) {
                    rs = executeQuery("SELECT IDENT_CURRENT('Lesson')\nINSERT INTO [dbo].[Lesson] VALUES (?, ?, ?, ?, ?);",
                            newSectionID,
                            lesson.getLessonName(),
                            0,
                            lesson.getType(),
                            lesson.getTime());                
                    
                    if (!rs.next()) return 0;
                    
                    int newLessonID = rs.getInt(1) + 1;
                    
                    if (lesson.getType().equals("Doc")) {
                        Docs docs = dd.getDocsOfLesson(lesson.getLessonId());
                        executeUpdate("INSERT INTO [dbo].[Docs] VALUES (?, ?)",
                                newLessonID,
                                docs.getContent());
                    }
                    if (lesson.getType().equals("Video")) {
                        Video video = vd.getVideoOfLesson(lesson.getLessonId());
                        executeUpdate("INSERT INTO [dbo].[Video] VALUES (?, ?, ?)",
                                newLessonID,
                                video.getVideoName(),
                                video.getVideoLink());
                    }
                    if (lesson.getType().equals("Quiz")) {
                        Quiz quiz = qd.getQuizOfLesson(lesson.getLessonId());
                        rs = executeQuery("SELECT IDENT_CURRENT('Quiz')\nINSERT INTO [dbo].[Quiz] VALUES (?, ?);",
                                quiz.getMark(),
                                newLessonID);
                        
                        if (!rs.next()) return 0;
                        
                        int newQuizId = rs.getInt(1) + 1;
                        
                        ArrayList<Question> questionlist = qtd.getQuestionsOfQuiz(quiz.getQuizId());
                        for (Question question : questionlist) {
                            rs = executeQuery("SELECT IDENT_CURRENT('Question')\nINSERT INTO [dbo].[Question] VALUES (?, ?);",
                                    question.getQuestionContent(),
                                    newQuizId);
                            
                            if (!rs.next()) return 0;
                            
                            int newQuestionId = rs.getInt(1) + 1;
                            
                            ArrayList<Answer> answerlist = ad.getAnswersOfQuestion(question.getQuestionId());
                            for (Answer answer : answerlist) {
                                executeUpdate("INSERT INTO [dbo].[Answer] VALUES (?, ?, ?)",
                                        answer.getAnswerContent(),
                                        newQuestionId,
                                        answer.isIsCorrect());
                            }
                        }
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return newCourseID;
    }

    public ArrayList<Course> getAllUserCourse(String username) {
        ArrayList<Course> courseList = new ArrayList<>();
        UserDAO userDao = new UserDAO();
        try {
            ResultSet rs = executeQuery("select c.CourseID, c.CourseName, c.DateCreate, c.AuthorID, c.Category, c.NumberEnrolled, c.CoursePrice, c.CourseImage, uc.Progress\n"
                    + "from [Course] c\n"
                    + "inner join [User_Course] uc on c.CourseID=uc.CourseID\n"
                    + "inner join [User] u on u.UserID = uc.UserID\n"
                    + "where u.Username= ?", username);
            while (rs.next()) {
                Course c = new Course();
                c.setCourseID(rs.getInt("CourseID"));
                c.setCourseName(rs.getString("CourseName"));
                c.setDateCreate(rs.getTimestamp("DateCreate"));
                c.setAuthor(userDao.getAllUserInformationByID(rs.getInt("AuthorID")));
                c.setCategory(rs.getString("Category"));
                c.setNumberEnrolled(rs.getInt("NumberEnrolled"));
                c.setCoursePrice(rs.getDouble("CoursePrice"));
                c.setCourseImage(rs.getString("CourseImage"));
                c.setCourseProgress(rs.getDouble("Progress"));
                courseList.add(c);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return courseList;
    }

    public ArrayList<Course> getAllMentorCourse(int userId) {
        try {
            ArrayList<Course> list = new ArrayList<Course>();
            ResultSet rs = executeQuery("SELECT [CourseID],"
                    + " [CourseName],"
                    + " [DateCreate],"
                    + " [Category],"
                    + " [NumberEnrolled],"
                    + " [CoursePrice],"
                    + " [CourseImage],"
                    + " [Status],"
                    + " [Description],"
                    + " [Objectives],"
                    + " [Difficulty] FROM [Course] WHERE [AuthorID] = ?", userId);

            while (rs.next()) {
                list.add(new Course(rs.getInt("CourseID"),
                        rs.getString("CourseName"),
                        rs.getTimestamp("DateCreate"),
                        rs.getString("Category"),
                        rs.getInt("NumberEnrolled"),
                        rs.getDouble("CoursePrice"),
                        rs.getString("CourseImage"),
                        rs.getString("Status"),
                        new UserDAO().getAllUserInformationByID(userId),
                        rs.getNString("Description"),
                        rs.getNString("Objectives"),
                        rs.getString("Difficulty")));
            }

            return list;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public ArrayList<Feedback> getFeedBack(int courseID) {
        UserDAO userDAO = new UserDAO();
        ArrayList<Feedback> feedbackList = new ArrayList<>();
        try {
            ResultSet rs = executeQuery("select UserID, CourseRating, CourseFeedback from User_Course\n"
                    + "where CourseID = ?", courseID);
            while (rs.next()) {
                Feedback feedback = new Feedback(userDAO.getAllUserInformationByID(rs.getInt("UserID")), rs.getInt("CourseRating"), rs.getString("CourseFeedback"));
                feedbackList.add(feedback);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CourseDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return feedbackList;
    }
    
    public void addNewCourse(Course c) {
        try {
            executeUpdate("INSERT INTO [dbo].[Course]\n"
                    + "           ([CourseName]\n"
                    + "           ,[DateCreate]\n"
                    + "           ,[AuthorID]\n"
                    + "           ,[Category]\n"
                    + "           ,[NumberEnrolled]\n"
                    + "           ,[CoursePrice]\n"
                    + "           ,[CourseImage]\n"
                    + "           ,[Status]\n"
                    + "           ,[Description]\n"
                    + "           ,[Objectives]\n"
                    + "           ,[Difficulty])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?)", 
                    c.getCourseName(), c.getDateCreate(), c.getAuthor().getUserId(), 
                    c.getCategory(), c.getNumberEnrolled(), c.getCoursePrice(), 
                    c.getCourseImage(), c.getStatus(), c.getDescription(), c.getObjectives(), c.getDifficulty());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public int getNewCourseID() {
        int id = 0;
        try {
            ResultSet rs = executeQuery("SELECT IDENT_CURRENT('Course')");
            while(rs.next()) {
                id = rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return id;
    }

    public int getCourseTime(int courseID) {
        try {
            ResultSet rs = executeQuery("select SUM(Time) as totalTime from Lesson l\n"
                    + "inner join Section s on s.SectionID = l.SectionID\n"
                    + "where s.CourseID = ?", courseID);
            if (rs.next()) {
                return rs.getInt("totalTime");
            }
        } catch (SQLException ex) {
            Logger.getLogger(CourseDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }
    
    public void insertNewObjective(String objective, int courseId){
        try {
            executeUpdate("UPDATE [dbo].[Course] SET [Objectives] = CONCAT([Objectives], ?) WHERE [CourseID] = ?", "/" + objective, courseId);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

//SQL for getCurrentCourse
//select top 10 *
//from User_Lesson ul
//inner join Lesson l on l.LessonID = ul.LessonID
//inner join Section s on s.SectionID = l.SectionID
//where s.CourseID = 5 and ul.UserID = 10 
//order by ul.LessonID desc
