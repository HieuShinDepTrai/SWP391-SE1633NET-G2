/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Model.Blog;
import java.sql.ResultSet;
import java.sql.Timestamp;

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
    
    public void deleteBlog(int blogId){
        try {
            executeUpdate("DELETE FROM [dbo].[Blog] WHERE [BlogID] = ?", blogId);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public Blog getBlogInformation(int blogId){
        try {
            ResultSet rs = executeQuery("SELECT [UserID], [BlogDate], [BlogContent], [BlogTilte], [BlogDescription], [BlogImage], [Category], [Status] "
                    + "FROM [dbo].[Blog] WHERE [BlogID] = ?", blogId);
            
            if(rs.next()){
                return new Blog(blogId, 
                        rs.getInt("UserID"), 
                        rs.getTimestamp("BlogDate"), 
                        rs.getNString("BlogContent"), 
                        rs.getNString("BlogTilte"), 
                        rs.getNString("BlogDescription"), 
                        rs.getString("BlogImage"), 
                        rs.getString("Category"), 
                        rs.getString("Status"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public void updateBlog(String content, String tilte, String description, String image, String category, int blogId) {
        try {
            executeUpdate("UPDATE [dbo].[Blog] "
                    + "SET [BlogContent] = ?,"
                    + "[BlogTilte] = ?,"
                    + "[BlogDescription] = ?,"
                    + "[BlogImage] = ?,"
                    + "[Category] = ? "
                    + "WHERE [BlogID] = ?", content, tilte, description, image, category, blogId);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
