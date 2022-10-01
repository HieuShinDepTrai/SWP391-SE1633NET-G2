/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Model.Comment;
import java.sql.Date;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author ASUS
 */
public class CommentDAO extends DBContext {

    public Comment getComment(String commentId, String userId) {
        try ( ResultSet rs = executeQuery("SELECT [CommentID], "
                + "[VideoID], "
                + "[UserID], "
                + "[ParentID], "
                + "[CommentContenr], "
                + "[CommentDate], "
                + "[Likes], "
                + "[isReported] FROM Comment WHERE CommentID = ? AND UserID = ?", commentId, userId)) {

            if (rs.next()) {
                int cmtId = rs.getInt("CommentID");
                int videoId = rs.getInt("VideoID");
                int uId = rs.getInt("UserID");
                int pId = rs.getInt("ParentID");
                String cmtContent = rs.getString("CommentContent");
                Date cmtDate = rs.getDate("CommentDate");
                int likes = rs.getInt("Likes");
                boolean isReport = rs.getBoolean("isReported");

                return new Comment(cmtId, videoId, uId, pId, cmtContent, cmtDate, likes, isReport);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public void insertIntoCommentContent(String content, int userId) {
        try {
            executeUpdate("INSERT INTO [Comment](CommentContent, VideoID, UserID, ParentID, isReported) VALUES (?, 1, ?, 0, 0)", content, userId);
        } catch (Exception e) {
        }
    }
    
    public void insertIntoCommentContentReply(String content, int userId, int parentId) {
        try {
            executeUpdate("INSERT INTO [Comment](CommentContent, VideoID, UserID, ParentID, isReported) VALUES (?, 1, ?, ?, 0)", content, userId, parentId);
        } catch (Exception e) {
        }
    }

    public ArrayList<Comment> ListAllComment() {
        ArrayList<Comment> cmt = new ArrayList<>();

        try ( ResultSet rs = executeQuery("SELECT cmt.[CommentID]\n"
                + "               ,cmt.[VideoID]\n"
                + "               ,cmt.[UserID]\n"
                + "               , cmt.[ParentID]"
                + "               ,cmt.[CommentContent]\n"
                + "               ,cmt.[CommentDate]\n"
                + "               ,cmt.[Likes]\n"
                + "               ,cmt.[isReported] FROM [Comment] cmt INNER JOIN [Video] v \n"
                + "                ON cmt.VideoID = v.VideoID")) {

            while (rs.next()) {
                Comment c = new Comment();

                c.setCommentId(rs.getInt("CommentID"));
                c.setVideoId(rs.getInt("VideoID"));
                c.setParentId(rs.getInt("ParentID"));
                c.setCommentContent(rs.getNString("CommentContent"));
                c.setCommentDate(rs.getDate("CommentDate"));
                c.setCommentDate(rs.getDate("CommentDate"));
                c.setLikes(rs.getInt("Likes"));
                c.setIsReported(rs.getBoolean("isReported"));
                

                cmt.add(c);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return cmt;
    }

}