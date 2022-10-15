/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author ASUS
 */
public class Report {
    private int ReportID;
    private int UserID;
    private int CommentID;
    private String ReportContent;

    public Report() {
        
    }
    
    public Report(int ReportID, int UserID, int CommentID, String ReportContent) {
        this.ReportID = ReportID;
        this.UserID = UserID;
        this.CommentID = CommentID;
        this.ReportContent = ReportContent;
    }

    public int getReportID() {
        return ReportID;
    }

    public void setReportID(int ReportID) {
        this.ReportID = ReportID;
    }

    public int getUserID() {
        return UserID;
    }

    public void setUserID(int UserID) {
        this.UserID = UserID;
    }

    public int getCommentID() {
        return CommentID;
    }

    public void setCommentID(int CommentID) {
        this.CommentID = CommentID;
    }

    public String getReportContent() {
        return ReportContent;
    }

    public void setReportContent(String ReportContent) {
        this.ReportContent = ReportContent;
    }
    
    
    
    
    
    
    
}
