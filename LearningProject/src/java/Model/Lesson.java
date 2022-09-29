/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author vuman
 */
public class Lesson {
    private int lessonId;
    private int sectionId;
    private String lessonName;
    private byte isDisable;
    private String type;

    public Lesson() {
    }

    public Lesson(int lessonId, int sectionId, String lessonName, byte isDisable, String type) {
        this.lessonId = lessonId;
        this.sectionId = sectionId;
        this.lessonName = lessonName;
        this.isDisable = isDisable;
        this.type = type;
    }

    public int getLessonId() {
        return lessonId;
    }

    public void setLessonId(int lessonId) {
        this.lessonId = lessonId;
    }

    public int getSectionId() {
        return sectionId;
    }

    public void setSectionId(int sectionId) {
        this.sectionId = sectionId;
    }

    public String getLessonName() {
        return lessonName;
    }

    public void setLessonName(String lessonName) {
        this.lessonName = lessonName;
    }

    public byte getIsDisable() {
        return isDisable;
    }

    public void setIsDisable(byte isDisable) {
        this.isDisable = isDisable;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
    
    
}
