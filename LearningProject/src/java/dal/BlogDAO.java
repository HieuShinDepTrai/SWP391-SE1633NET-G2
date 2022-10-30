/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Model.Blog;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

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
                    + "	[BlogTitle],\n"
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

    public ArrayList<Blog> ListAllBlogs() {
        try {
            ArrayList<Blog> blogs = new ArrayList<>();
            ResultSet rs = executeQuery("SELECT \n"
                    + "	[BlogID],\n"
                    + "	[UserID],\n"
                    + "	[BlogDate],\n"
                    + "	[BlogContent],\n"
                    + "	[BlogTitle],\n"
                    + "	[BlogDescription],\n"
                    + "	[BlogImage],\n"
                    + "	[Category]\n"
                    + "FROM [Blog]\n"
                    + "WHERE [Status] = 'Enabled'");
            while (rs.next()) {
                blogs.add(new Blog(rs.getInt("BlogID"), rs.getInt("UserID"),
                        rs.getTimestamp("BlogDate"), rs.getNString("BlogContent"),
                        rs.getNString("BlogTitle"), rs.getNString("BlogDescription"),
                        rs.getString("BlogImage"), rs.getString("Category"), "Enabled"));
            }
            return blogs;
        } catch (SQLException ex) {
            Logger.getLogger(BlogDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Blog> ListAllBlogsByCategory(String category) {
        try {
            ArrayList<Blog> blogs = new ArrayList<>();
            ResultSet rs = executeQuery("SELECT \n"
                    + "	[BlogID],\n"
                    + " [UserID],\n"
                    + "	[BlogDate],\n"
                    + "	[BlogContent],\n"
                    + "	[BlogTitle],\n"
                    + "	[BlogDescription],\n"
                    + "	[BlogImage],\n"
                    + "	[Category]\n"
                    + "FROM [Blog]\n"
                    + "WHERE [Category] = ?\n"
                    + "AND [Status] = 'Enabled'", category);
            while (rs.next()) {
                blogs.add(new Blog(rs.getInt("BlogID"), rs.getInt("UserID"),
                        rs.getTimestamp("BlogDate"), rs.getNString("BlogContent"),
                        rs.getNString("BlogTitle"), rs.getNString("BlogDescription"),
                        rs.getString("BlogImage"), rs.getString("Category"), "Enabled"));
            }
            return blogs;
        } catch (SQLException ex) {
            Logger.getLogger(BlogDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
