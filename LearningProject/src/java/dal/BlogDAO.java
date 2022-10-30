/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Model.Blog;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

/**
 *
 * @author Hieu Shin
 */
public class BlogDAO extends DBContext {

    public void addBlog(int userid, Timestamp date, String content, String tilte,
            String description, String image, String category, String status) {
        try {
            execute("INSERT INTO [Blog] \n"
                    + "	([UserID],\n"
                    + "	[BlogDate],\n"
                    + "	[BlogContent],\n"
                    + "	[BlogTilte],\n"
                    + "	[BlogDescription],\n"
                    + "	[BlogImage],\n"
                    + "	[Category],\n"
                    + "	[Status])\n"
                    + "VALUES (\n"
                    + "	?, \n"
                    + "	?, \n"
                    + "	?, \n"
                    + "	?, \n"
                    + "	?, \n"
                    + "	?, \n"
                    + "	?, \n"
                    + "	?)", userid, date, content, tilte, description, image, category, status);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public ArrayList<Blog> getBlogListReported() {
        ArrayList<Blog> blogListReport = new ArrayList();
        UserDAO udao = new UserDAO();
        try {
            ResultSet rs = executeQuery("SELECT [BlogID]\n"
                    + "      ,[UserID]\n"
                    + "      ,[BlogDate]\n"
                    + "      ,[BlogContent]\n"
                    + "      ,[BlogTitle]\n"
                    + "      ,[BlogDescription]\n"
                    + "      ,[BlogImage]\n"
                    + "      ,[Category]\n"
                    + "      ,[Status]\n"
                    + "      ,[isReported]\n"
                    + "  FROM [dbo].[Blog]\n"
                    + "  WHERE isReported = 1");
            while (rs.next()) {
                blogListReport.add(new Blog(rs.getInt("BlogID"), rs.getInt("UserID"), rs.getTimestamp("BlogDate"), rs.getString("BlogContent"), rs.getString("BlogTitle"), rs.getString("BlogDescription"), rs.getString("BlogImage"), rs.getString("Category"), rs.getString("Status")));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return blogListReport;
    }

}
