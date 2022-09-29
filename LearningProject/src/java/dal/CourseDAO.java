package dal;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
import Model.Course;
import Model.Section;
import Model.User;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

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
    
    public Course getAllCourseInformation(int courseId){
        try(ResultSet rs = executeQuery("SELECT [CourseName],"
                + "[DateCreate],"
                + "[AuthorID],"
                + "[Category],"
                + "[NumberEnrolled],"
                + "[CoursePrice],"
                + "[CourseImage],"
                + "[isDisable] FROM [dbo].[Course] WHERE [CourseID] = ", courseId)){
            return new Course(courseId, rs.getNString("CourseName"), rs.getTimestamp("DateCreate"), rs.getInt("AuthorID"), rs.getNString("Category"), rs.getInt("NumberEnrolled"), rs.getDouble("CoursePrice"), rs.getString("CourseImage"), rs.getBoolean("isDisable"), new UserDAO().getAllUserInformationByID(rs.getInt("AuthorID")));
        }catch(Exception e){
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
                + "[isDisable] FROM [dbo].[Course] WHERE [CourseID] = " + courseId;
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            Course c = new Course();
            if (rs.next()) {
                c.setCourseImage(rs.getNString("CourseName"));
                c.setDateCreate(rs.getTimestamp("DateCreate"));
                c.setAuthorID(rs.getInt("AuthorID"));
                c.setCategory(rs.getString("Category"));
                c.setNumberEnrolled(rs.getInt("NumberEnrolled"));
                c.setCoursePrice(rs.getDouble("CoursePrice"));
                c.setCourseImage(rs.getString("CourseImage"));
                c.setIsDisable(rs.getBoolean("isDisable"));
            }
            return c;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public void disableCourse(int courseId){
        try {
            executeUpdate("UPDATE [dbo].[Course] SET [isDisable] = 0 WHERE [CourseID] = ? ", courseId);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public void createClone(int courseId){
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
            executeUpdate("INSERT INTO [dbo].[Course] VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", courseId * -1, course.getCourseName(), course.getDateCreate(), course.getAuthorID(), course.getCategory(), course.getNumberEnrolled(), course.getCoursePrice(), course.getCourseImage(), 0);
            for (Section section : sectionlist) {
                executeUpdate("INSERT INTO [dbo].[Section] VALUES(?, ?, ?, ?)", section.getSectionId() * (-1), courseId * (-1), section.getSectionName(), 0);
            }
        } catch (Exception e) {
        }
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
}
