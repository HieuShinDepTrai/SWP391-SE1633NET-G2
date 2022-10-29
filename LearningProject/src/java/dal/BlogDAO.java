/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

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
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }
}
