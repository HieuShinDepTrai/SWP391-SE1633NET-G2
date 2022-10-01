/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Model.Lesson;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author vuman
 */
public class LessonDAO extends DBContext {

    public void addLessonVideo(int sectionId, String lessonName, String videoName, String videoURL) {
        try {
            execute("EXEC [sp_create_video] ?, ?, ?, ?", sectionId, lessonName, videoName, videoURL);
        } catch (Exception ex) {
            Logger.getLogger(LessonDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void addLessonDoc(int sectionId, String lessonName, int time, String content) {
        try {
            execute("EXEC [sp_create_docs] ?, ?, ?, ?", sectionId, lessonName, time, content);
        } catch (Exception ex) {
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
        try(ResultSet rs = executeQuery("SELECT [LessonID], [LessonName], [isDisable], [types], [isChecked], [Time] FROM [dbo].[Lesson] WHERE [SectionID] = ? AND [isDisable] = 0", sectionId)){
            while(rs.next()){
                lessonlist.add(new Lesson(rs.getInt("LessonID"), sectionId, rs.getNString("LessonName"), rs.getBoolean("isDisable"), rs.getString("types"), rs.getBoolean("isChecked"), rs.getInt("Time")));
            }
            return lessonlist;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}