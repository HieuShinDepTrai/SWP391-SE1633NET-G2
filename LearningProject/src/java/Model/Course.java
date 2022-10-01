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
    private String Category;
    private int NumberEnrolled;
    private double CoursePrice;
    private String CourseImage;
    private String Status;
    private User Author;
    private Double CourseProgress;
    private String description;
    private String objectives;
    private String difficulty;

    public Course() {
    }

    public Course(int CourseID, String CourseName, Timestamp DateCreate, String Category, int NumberEnrolled, double CoursePrice, String CourseImage, String Status, User Author, Double CourseProgress) {
        this.CourseID = CourseID;
        this.CourseName = CourseName;
        this.DateCreate = DateCreate;
        this.Category = Category;
        this.NumberEnrolled = NumberEnrolled;
        this.CoursePrice = CoursePrice;
        this.CourseImage = CourseImage;
        this.Status = Status;
        this.Author = Author;
        this.CourseProgress = CourseProgress;
    }

    public Course(int CourseID, String CourseName, Timestamp DateCreate, String Category, int NumberEnrolled, double CoursePrice, String CourseImage, String Status, User Author, Double CourseProgress, String description, String objectives, String difficulty) {
        this.CourseID = CourseID;
        this.CourseName = CourseName;
        this.DateCreate = DateCreate;
        this.Category = Category;
        this.NumberEnrolled = NumberEnrolled;
        this.CoursePrice = CoursePrice;
        this.CourseImage = CourseImage;
        this.Status = Status;
        this.Author = Author;
        this.CourseProgress = CourseProgress;
        this.description = description;
        this.objectives = objectives;
        this.difficulty = difficulty;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getObjectives() {
        return objectives;
    }

    public void setObjectives(String objectives) {
        this.objectives = objectives;
    }

    public String getDifficulty() {
        return difficulty;
    }

    public void setDifficulty(String difficulty) {
        this.difficulty = difficulty;
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

    public String getStatus() {
        return Status;
    }

    public void setStatus(String Status) {
        this.Status = Status;
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
