/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Model.Lesson;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author vuman
 */
public class LessonDAO extends DBContext {

    public void addLessonVideo(Lesson lesson) {
        try {
            String sql = "INSERT INTO [dbo].[Lesson] \n"
                    + "([SectionID], [LessonName], [isDisable], [types], [isChecked]) \n"
                    + "VALUES (?, ?, 0, Video, 0)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, lesson.getSectionId());
            stm.setString(2, lesson.getLessonName());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(LessonDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void addLessonDoc(Lesson lesson) {
        try {
            String sql = "INSERT INTO [dbo].[Lesson] \n"
                    + "([SectionID], [LessonName], [isDisable], [types], [isChecked]) \n"
                    + "VALUES (?, ?, 0, Docs, 0)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, lesson.getSectionId());
            stm.setString(2, lesson.getLessonName());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(LessonDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void disableLesson(int sectionId) {
        try {
            executeUpdate("UPDATE [dbo].[Lesson] SET [isDisable] = 0 WHERE [SectionID] = ? ", sectionId);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public ArrayList<Lesson> getAllLessonOfSection(int sectionId) {
        ArrayList<Lesson> lessonlist = new ArrayList<Lesson>();
        try(ResultSet rs = executeQuery("SELECT [LessonID], [LessonName], [isDisable], [types], [Time] FROM [dbo].[Lesson] WHERE [SectionID] = ? AND [isDisable] = 0", sectionId)){
            while(rs.next()){
                lessonlist.add(new Lesson(rs.getInt("LessonID"), sectionId, rs.getNString("LessonName"), rs.getBoolean("isDisable"), rs.getString("types"), true, rs.getInt("Time")));
            }
            return lessonlist;
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return null;
    }
}
