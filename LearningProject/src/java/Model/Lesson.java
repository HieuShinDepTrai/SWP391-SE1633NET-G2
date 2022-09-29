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
    private boolean isDisable;
    private String type;
    private boolean isChecked;

    public Lesson() {
    }

    public Lesson(int lessonId, int sectionId, String lessonName, boolean isDisable, String type, boolean isChecked) {
        this.lessonId = lessonId;
        this.sectionId = sectionId;
        this.lessonName = lessonName;
        this.isDisable = isDisable;
        this.type = type;
        this.isChecked = isChecked;
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

    public boolean getIsDisable() {
        return isDisable;
    }

    public void setIsDisable(boolean isDisable) {
        this.isDisable = isDisable;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public boolean isIsChecked() {
        return isChecked;
    }

    public void setIsChecked(boolean isChecked) {
        this.isChecked = isChecked;
    }
    
}
