/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Model.Lesson;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author vuman
 */
public class LessonDAO extends DBContext{
    public void disableLesson(int sectionId){
        try {
            executeUpdate("UPDATE [dbo].[Lesson] SET [isDisable] = 0 WHERE [SectionID] = ? ", sectionId);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public ArrayList<Lesson> getAllLessonOfSection(int sectionId){
        ArrayList<Lesson> lessonlist = new ArrayList<Lesson>();
        try(ResultSet rs = executeQuery("SELECT [LessonID], [LessonName], [isDisable], [type], [isChecked] FROM [dbo].[Lesson] WHERE [SectionID] = ? AND [isDisable] = 0", sectionId)){
            while(rs.next()){
                lessonlist.add(new Lesson(rs.getInt("LessonID"), sectionId, rs.getNString("LessonName"), rs.getByte("isDisable"), rs.getString("types"), rs.getBoolean("isChecked")));
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return null;
    }
}
