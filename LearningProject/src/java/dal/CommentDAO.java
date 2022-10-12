/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Model.Comment;
import Model.Video;
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
                + "[VideoID],"
                + "[UserID],"
                + "[ParentID],"
                + "[CommentUser],"
                + "[CommentContent],"
                + "[CommentDate], "
                + "[Likes], "
                + "[isReported] FROM [Comment] WHERE CommentID = ? AND UserID = ?", commentId, userId)) {

            if (rs.next()) {
                int cmtId = rs.getInt("CommentID");
                int videoId = rs.getInt("VideoID");
                int uId = rs.getInt("UserID");
                int pId = rs.getInt("ParentID");
                String cUser = rs.getString("CommentUser");
                String cmtContent = rs.getString("CommentContent");
                Date cmtDate = rs.getDate("CommentDate");
                int likes = rs.getInt("Likes");
                boolean isReport = rs.getBoolean("isReported");

                return new Comment(cmtId, videoId, uId, pId, cUser, cmtContent, cmtDate, likes, isReport);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public void insertIntoCommentContentReply(String content, int videoId, int userId, int parentId, String commentUser) {
        try {
            executeUpdate("INSERT INTO [Comment](CommentContent, VideoID, UserID, ParentID,CommentUser, isReported) VALUES (?, ?, ?, ?, ?, 0)", content, videoId, userId, parentId, commentUser);
        } catch (Exception e) {
        }
    }

    public Video getVideoIdByLessonId(int LessonId) {
        try ( ResultSet rs = executeQuery("SELECT [VideoID], [LessonID], [VideoName], [VideoLink] FROM [Video] WHERE LessonID = ?", LessonId)) {

            if (rs.next()) {
                int videoId = rs.getInt("VideoID");
                int lesId = rs.getInt("LessonID");
                String videoName = rs.getNString("VideoName");
                String videoLink = rs.getString("VideoLink");
                Video video = new Video(videoId, LessonId, videoName, videoLink);
                return video;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public ArrayList<Comment> ListAllParentCommentByLessonID(int lessonID) {
        ArrayList<Comment> cmt = new ArrayList<>();

        try ( ResultSet rs = executeQuery("SELECT cmt.[CommentID]\n"
                + "               ,cmt.[VideoID]\n"
                + "               ,cmt.[UserID]\n"
                + "               , cmt.[ParentID]"
                + "               , cmt.[CommentUser]"
                + "               ,cmt.[CommentContent]\n"
                + "               ,cmt.[CommentDate]\n"
                + "               ,cmt.[Likes]\n"
                + "               ,cmt.[isReported] FROM [Comment] cmt INNER JOIN [Video] v \n"
                + "                ON cmt.VideoID = v.VideoID WHERE LessonID = ? AND ParentID = 0", lessonID)) {

            while (rs.next()) {
                Comment c = new Comment();

                c.setCommentId(rs.getInt("CommentID"));
                c.setVideoId(rs.getInt("VideoID"));
                c.setParentId(rs.getInt("ParentID"));
                c.setCommentUser(rs.getString("CommentUser"));
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

    public ArrayList<Comment> ListAllCommentByLessonID(int lessonID) {
        ArrayList<Comment> cmt = new ArrayList<>();

        try ( ResultSet rs = executeQuery("SELECT cmt.[CommentID]\n"
                + "               ,cmt.[VideoID]\n"
                + "               ,cmt.[UserID]\n"
                + "               , cmt.[ParentID]"
                + "               , cmt.[CommentUser]"
                + "               ,cmt.[CommentContent]\n"
                + "               ,cmt.[CommentDate]\n"
                + "               ,cmt.[Likes]\n"
                + "               ,cmt.[isReported] FROM [Comment] cmt INNER JOIN [Video] v \n"
                + "                ON cmt.VideoID = v.VideoID WHERE LessonID = ?", lessonID)) {

            while (rs.next()) {
                Comment c = new Comment();

                c.setCommentId(rs.getInt("CommentID"));
                c.setVideoId(rs.getInt("VideoID"));
                c.setUserId(rs.getInt("UserID"));
                c.setCommentUser(rs.getString("CommentUser"));
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

    public ArrayList<Comment> ListAllReplyCommentByOfLessonByParentId(int parentId, int lessonId) {
        ArrayList<Comment> cmt = new ArrayList<>();

        try ( ResultSet rs = executeQuery("SELECT cmt.[CommentID]\n"
                + "               ,cmt.[VideoID]\n"
                + "               ,cmt.[UserID]\n"
                + "               , cmt.[ParentID]"
                + "               , cmt.[CommentUser]"
                + "               ,cmt.[CommentContent]\n"
                + "               ,cmt.[CommentDate]\n"
                + "               ,cmt.[Likes]\n"
                + "               ,cmt.[isReported] FROM [Comment] cmt INNER JOIN [Video] v \n"
                + "                ON cmt.VideoID = v.VideoID WHERE ParentId = ? AND LessonID = ?", parentId, lessonId)) {

            while (rs.next()) {
                Comment c = new Comment();

                c.setCommentId(rs.getInt("CommentID"));
                c.setVideoId(rs.getInt("VideoID"));
                c.setParentId(rs.getInt("ParentID"));
                c.setUserId(rs.getInt("UserID"));
                c.setCommentUser(rs.getString("CommentUser"));
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
