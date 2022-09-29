/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Model.Section;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author vuman
 */
public class SectionDAO extends DBContext{
    public void disableSection(int sectionId){
        try {
            executeUpdate("UPDATE [dbo].[Section] SET [isDisable] = 0 WHERE [CourseID] = ? ", sectionId);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public ArrayList<Section> getAllSectionOfCourse(int courseid){
        ArrayList<Section> sectionlist = new ArrayList<Section>();
        try(ResultSet rs = executeQuery("SELECT [SectionID], [SectionName], [isDisable] FROM [dbo].[Section] WHERE [CourseID] = ? AND [isDisable] = 0", courseid)){
            while(rs.next()){
                sectionlist.add(new Section(rs.getInt("SectionID"), courseid, rs.getNString("SectionName"), rs.getBoolean("isDisable")));
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return null;
    }
}
