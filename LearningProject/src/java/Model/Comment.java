/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.sql.Date;

/**
 *
 * @author vuman
 */
public class Comment {
    private int commentId;
    private int videoId;
    private int UserId;
    private int ParentId;
    private String commentUser;
    private String commentContent;
    private Date commentDate;
    private int likes;
    private boolean isReported;
    

    public Comment() {
    }

    public Comment(int commentId, int videoId, int UserId, int ParentId, String commentUser, String commentContent, Date commentDate, int likes, boolean isReported) {
        this.commentId = commentId;
        this.videoId = videoId;
        this.UserId = UserId;
        this.ParentId = ParentId;
        this.commentUser = commentUser;
        this.commentContent = commentContent;
        this.commentDate = commentDate;
        this.likes = likes;
        this.isReported = isReported;
    }

    public int getCommentId() {
        return commentId;
    }

    public void setCommentId(int commentId) {
        this.commentId = commentId;
    }

    public int getVideoId() {
        return videoId;
    }

    public void setVideoId(int videoId) {
        this.videoId = videoId;
    }

    public int getUserId() {
        return UserId;
    }

    public void setUserId(int UserId) {
        this.UserId = UserId;
    }

    public int getParentId() {
        return ParentId;
    }

    public void setParentId(int ParentId) {
        this.ParentId = ParentId;
    }

    public String getCommentUser() {
        return commentUser;
    }

    public void setCommentUser(String commentUser) {
        this.commentUser = commentUser;
    }

    public String getCommentContent() {
        return commentContent;
    }

    public void setCommentContent(String commentContent) {
        this.commentContent = commentContent;
    }

    public Date getCommentDate() {
        return commentDate;
    }

    public void setCommentDate(Date commentDate) {
        this.commentDate = commentDate;
    }

    public int getLikes() {
        return likes;
    }

    public void setLikes(int likes) {
        this.likes = likes;
    }

    public boolean isIsReported() {
        return isReported;
    }

    public void setIsReported(boolean isReported) {
        this.isReported = isReported;
    }


    
    
    
}
