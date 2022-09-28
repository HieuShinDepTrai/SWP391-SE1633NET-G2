package Model;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */



import java.sql.Timestamp;

/**
 *
 * @author Hieu Shin
 */
public class Course {
    private int CourseID;
    private String CourseName;
    private Timestamp DateCreate;
    private int AuthorID;
    private String Category;
    private int NumberEnrolled;
    private double CoursePrice;
    private String CourseImage;
    private boolean isDisable;
    private User Author;
    private Double CourseProgress;

    public Course() {
    }

    public Course(int CourseID, String CourseName, Timestamp DateCreate, int AuthorID, String Category, int NumberEnrolled, double CoursePrice, String CourseImage, boolean isDisable, User Author) {
        this.CourseID = CourseID;
        this.CourseName = CourseName;
        this.DateCreate = DateCreate;
        this.AuthorID = AuthorID;
        this.Category = Category;
        this.NumberEnrolled = NumberEnrolled;
        this.CoursePrice = CoursePrice;
        this.CourseImage = CourseImage;
        this.isDisable = isDisable;
        this.Author = Author;
    }

    public Course(int CourseID, String CourseName, String Category, Double CourseProgress) {
        this.CourseID = CourseID;
        this.CourseName = CourseName;
        this.Category = Category;
        this.CourseProgress = CourseProgress;
    }

    
    public boolean getIsDisable() {
        return isDisable;
    }

    public void setIsDisable(boolean isDisable) {
        this.isDisable = isDisable;
    }

    public int getCourseID() {
        return CourseID;
    }

    public void setCourseID(int CourseID) {
        this.CourseID = CourseID;
    }

    public String getCourseName() {
        return CourseName;
    }

    public void setCourseName(String CourseName) {
        this.CourseName = CourseName;
    }

    public Timestamp getDateCreate() {
        return DateCreate;
    }

    public void setDateCreate(Timestamp DateCreate) {
        this.DateCreate = DateCreate;
    }

    public int getAuthorID() {
        return AuthorID;
    }

    public void setAuthorID(int AuthorID) {
        this.AuthorID = AuthorID;
    }

    public String getCategory() {
        return Category;
    }

    public void setCategory(String Category) {
        this.Category = Category;
    }

    public int getNumberEnrolled() {
        return NumberEnrolled;
    }

    public void setNumberEnrolled(int NumberEnrolled) {
        this.NumberEnrolled = NumberEnrolled;
    }

    public double getCoursePrice() {
        return CoursePrice;
    }

    public void setCoursePrice(double CoursePrice) {
        this.CoursePrice = CoursePrice;
    }

    public String getCourseImage() {
        return CourseImage;
    }

    public void setCourseImage(String CourseImage) {
        this.CourseImage = CourseImage;
    }

    public User getAuthor() {
        return Author;
    }

    public void setAuthor(User Author) {
        this.Author = Author;
    }

    public Double getCourseProgress() {
        return CourseProgress;
    }

    public void setCourseProgress(Double CourseProgress) {
        this.CourseProgress = CourseProgress;
    }
    
}
