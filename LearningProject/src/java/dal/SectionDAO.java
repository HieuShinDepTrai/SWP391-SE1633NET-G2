/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Model.Section;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

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

    public Section getSectionBySectionID(int sectionID) {
        try {
            ResultSet rs = executeQuery("SELECT [CourseID],[SectionName]\n"
                    + "  FROM [dbo].[Section]\n"
                    + "  Where [SectionID] = ?", sectionID);
            if (rs.next()) {
                return new Section(sectionID, rs.getInt("CourseID"), rs.getNString("SectionName"), false);
            }
        } catch (SQLException ex) {
            Logger.getLogger(SectionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
