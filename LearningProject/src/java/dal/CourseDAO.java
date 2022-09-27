package dal;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */


import Model.Course;
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
                    + "[C].[CourseName], [C].[NumberEnrolled],\n"
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
                + "[CourseImage] FROM [dbo].[Course] WHERE [CourseID] = ", courseId)){
            return new Course(courseId, rs.getNString("CourseName"), rs.getTimestamp("DateCreate"), rs.getInt("AuthorID"), rs.getNString("Category"), rs.getInt("NumberEnrolled"), rs.getDouble("CoursePrice"), rs.getBytes("CourseImage"), new UserDAO().getAllUserInformationByID(rs.getInt("AuthorID")));
        }catch(Exception e){
            e.printStackTrace();
        }
        return null;
    }
    
    public void disableCourse(int courseId){
        try {
            executeUpdate("UPDATE [dbo].[Course] SET WHERE [CourseID] = ? ", courseId);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public void disableSection(int courseId){
        try {
            executeUpdate("UPDATE [dbo].[Section] SET WHERE [CourseID] = ? ", courseId);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
