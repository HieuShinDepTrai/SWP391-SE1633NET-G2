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
public class SectionDAO extends DBContext {

    public void disableSection(int courseId) {
        try {
            executeUpdate("UPDATE [dbo].[Section] SET [isDisable] = 0 WHERE [CourseID] = ? ", courseId);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void deleteSection(int sectionId) {
        try {
            execute("DELETE FROM [dbo].[Section]\n"
                    + "      WHERE SectionID = ?", sectionId);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void updateSectionName(Section s) {
        try {
            executeUpdate("UPDATE [dbo].[Section]\n"
                    + "   SET [SectionName] = ?\n"
                    + " WHERE [SectionID] = ?", 
                    s.getSectionName(), s.getSectionName());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public ArrayList<Section> getAllSectionOfCourse(int courseid) {
        ArrayList<Section> sectionlist = new ArrayList<Section>();
        try ( ResultSet rs = executeQuery("SELECT [SectionID], [SectionName], [isDisable] FROM [dbo].[Section] WHERE [CourseID] = ? AND [isDisable] = ?", courseid, 0)) {
            while (rs.next()) {
                sectionlist.add(new Section(rs.getInt("SectionID"), courseid, rs.getNString("SectionName"), rs.getBoolean("isDisable")));
            }
            return sectionlist;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public void addSection(Section section) {
        try {
            executeUpdate("INSERT INTO [dbo].[Section]\n"
                    + "           ([CourseID]\n"
                    + "           ,[SectionName]\n"
                    + "           ,[isDisable])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?)", section.getCourseId(), section.getSectionName(), section.isIsDisable());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
