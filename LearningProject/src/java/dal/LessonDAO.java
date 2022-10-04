/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Model.Lesson;
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

    public void addLessonVideo(int sectionId, String lessonName, String videoName, String videoURL, int duration) {
        try {
            execute("EXEC [sp_create_video] ?, ?, ?, ?, ?", sectionId, lessonName, videoName, videoURL, duration);
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

    public void disableLesson(int lessonId) {
        try {
            executeUpdate("UPDATE [dbo].[Lesson] SET [isDisable] = 1 WHERE [LessonID] = ? ", lessonId);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public ArrayList<Lesson> getAllLessonOfSection(int sectionId) {
        ArrayList<Lesson> lessonlist = new ArrayList<Lesson>();
        try ( ResultSet rs = executeQuery("SELECT [LessonID],"
                + " [LessonName],"
                + " [isDisable],"
                + " [types],"
                + " [Time] FROM [dbo].[Lesson] WHERE [SectionID] = ? AND [isDisable] = 0", sectionId)) {
            while (rs.next()) {
                lessonlist.add(new Lesson(rs.getInt("LessonID"),
                        sectionId,
                        rs.getNString("LessonName"),
                        rs.getBoolean("isDisable"),
                        rs.getString("types"),
                        rs.getInt("Time")));
            }
            return lessonlist;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public Lesson getLessonbyLessonID(int lessonid) {
        try {
            ResultSet rs = executeQuery("SELECT [SectionID]\n"
                    + "      ,[LessonName]\n"
                    + "      ,[isDisable]\n"
                    + "      ,[types]\n"
                    + "      ,[Time]\n"
                    + "      ,[VideoLink]\n"
                    + "      ,[Content]\n"
                    + "  FROM [Lesson] FULL OUTER JOIN [Video]\n"
                    + "  ON [Lesson].[LessonID] = [Video].[LessonID]\n"
                    + "  FULL OUTER JOIN [Docs]\n"
                    + "  ON [Lesson].[LessonID] = [Docs].[LessonID]\n"
                    + "  WHERE [Lesson].[LessonID] = ? AND [isDisable] = 0", lessonid);
            if (rs.next()) {
                return new Lesson(lessonid, rs.getInt("SectionID"),
                        rs.getNString("LessonName"),
                        false, rs.getString("types"), rs.getInt("Time"),
                        rs.getString("VideoLink"), rs.getString("Content"));               
            }
        } catch (SQLException ex) {
            Logger.getLogger(LessonDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
