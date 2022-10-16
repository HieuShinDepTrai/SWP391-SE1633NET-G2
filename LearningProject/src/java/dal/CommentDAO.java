/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Model.Comment;
import Model.Report;
import Model.User;
import Model.UserComment;
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
        UserDAO userDAO = new UserDAO();
        try ( ResultSet rs = executeQuery("SELECT [CommentID], "
                + "[VideoID],"
                + "[UserID],"
                + "[ParentID],"
                + "[CommentContent],"
                + "[CommentDate], "
                + "[Likes], "
                + "[isReported] FROM [Comment] WHERE CommentID = ? AND UserID = ?", commentId, userId)) {

            if (rs.next()) {
                int cmtId = rs.getInt("CommentID");
                int videoId = rs.getInt("VideoID");
                User user = userDAO.getAllUserInformationByID(rs.getInt("UserID"));
                int pId = rs.getInt("ParentID");
                String cmtContent = rs.getString("CommentContent");
                Date cmtDate = rs.getDate("CommentDate");
                int likes = rs.getInt("Likes");
                boolean isReport = rs.getBoolean("isReported");

                return new Comment(cmtId, videoId, user, pId, commentId, cmtContent, cmtDate, likes, isReport);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public UserComment getUserComment(int cmtId, int userId) {
        try (ResultSet rs = executeQuery("SELECT [CommentID],[UserID],[isLiked] FROM User_Comment where CommentID = ? AND UserID = ?", cmtId,userId)){
            if (rs.next()) {
                int commentId = rs.getInt("CommentID");
                int uId = rs.getInt("UserID");
                boolean isLked = rs.getBoolean("isLiked");
                
                return new UserComment(commentId, uId, isLked);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

     
    public void insertIntoCommentContentReply(String content, int videoId, int userId, int parentId) {
        try {
            executeUpdate("INSERT INTO [Comment](CommentContent, VideoID, UserID, ParentID, isReported) VALUES (?, ?, ?, ?, 0)", content, videoId, userId, parentId);
        } catch (Exception e) {
        }
    }
    
    public void insertIntoUserComment(int commentId, int userId, int isLiked) {
        try {
            executeUpdate("INSERT INTO [User_Comment](CommentID, UserID, isLiked) VALUES (? , ?, ?)", commentId, userId, isLiked);
        } catch (Exception e) {
        }
    }
    
    public void insertIntoReport(int UserId, int CommentId) {
        try {
            executeUpdate("INSERT INTO [Report](UserID, CommentID) VALUES (? , ?) ", UserId, CommentId);
        } catch (Exception e) {
        }
    } 
    
    public void deleteIntoUserComment(int commentId, int userId) {
        try {
            executeUpdate("DELETE FROM [User_Comment] WHERE [CommentID] = ? AND [UserID] = ?", commentId, userId);
        } catch (Exception e) {
        }
    }
    
    public void deleteIntoReport(int UserId, int CommentId) {
        try {
            executeUpdate("DELETE FROM [Report] WHERE [UserID] = ? AND [CommentID] = ?", UserId, CommentId);
        } catch (Exception e) {
        }
    }
    
    public void updateCommentContentByCommentId(String cmtContent, int cmtId) {
        try {
            executeUpdate("UPDATE [Comment] SET [CommentContent] = ? WHERE [CommentID] = ? ", cmtContent, cmtId);
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

    public  ArrayList<UserComment> getAllUserCommentByUserId(int UserId) {
        ArrayList<UserComment> ucmt = new ArrayList<>();
        try (ResultSet rs = executeQuery("SELECT [CommentID],[UserID],[isLiked] FROM [User_Comment] WHERE UserID = ?", UserId)){
            
            while (rs.next()) {
                UserComment uc = new UserComment();
                uc.setCommentId(rs.getInt("CommentID"));
                uc.setUserID(rs.getInt("UserID"));
                uc.setIsLiked(rs.getBoolean("isLiked"));
                
                ucmt.add(uc);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ucmt;
    }
    
    public ArrayList<Comment> ListAllParentCommentByLessonID(int lessonID) {
        ArrayList<Comment> cmt = new ArrayList<>();
        UserDAO userDAO = new UserDAO();
        
        try ( ResultSet rs = executeQuery("SELECT cmt.[CommentID]\n"
                + "               ,cmt.[VideoID]\n"
                + "               ,cmt.[UserID]\n"
                + "               , cmt.[ParentID]\n"
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
                c.setUser(userDAO.getAllUserInformationByID(rs.getInt("UserID")));
                c.setCommentContent(rs.getNString("CommentContent"));
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
        UserDAO userDAO = new UserDAO();
        try ( ResultSet rs = executeQuery("SELECT cmt.[CommentID]\n"
                + "               ,cmt.[VideoID]\n"
                + "               ,cmt.[UserID]\n"
                + "               , cmt.[ParentID]\n"
                + "               ,cmt.[CommentContent]\n"
                + "               ,cmt.[CommentDate]\n"
                + "               ,cmt.[Likes]\n"
                + "               ,cmt.[isReported] FROM [Comment] cmt INNER JOIN [Video] v \n"
                + "                ON cmt.VideoID = v.VideoID WHERE LessonID = ?", lessonID)) {

            while (rs.next()) {
                Comment c = new Comment();

                c.setCommentId(rs.getInt("CommentID"));
                c.setVideoId(rs.getInt("VideoID"));
                c.setUser(userDAO.getAllUserInformationByID(rs.getInt("UserID")));
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
        UserDAO userDAO = new UserDAO();
        try ( ResultSet rs = executeQuery("SELECT cmt.[CommentID]\n"
                + "               ,cmt.[VideoID]\n"
                + "               ,cmt.[UserID]\n"
                + "               , cmt.[ParentID]\n"
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
                c.setUser(userDAO.getAllUserInformationByID(rs.getInt("UserID")));
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
    
    public  ArrayList<Report> getAllReportByUserId(int UserId) {
        ArrayList<Report> listReport = new ArrayList<>();
        try (ResultSet rs = executeQuery("SELECT [ReportID],[UserID],[CommentID],[ReportContent] FROM [Report] WHERE UserID = ?", UserId)){
            
            while (rs.next()) {
                Report rp = new Report();
                rp.setReportID(rs.getInt("ReportID"));
                rp.setUserID(rs.getInt("UserID"));
                rp.setCommentID(rs.getInt("CommentID"));
                rp.setReportContent(rs.getNString("ReportContent"));
                
                listReport.add(rp);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listReport;
    }

}
