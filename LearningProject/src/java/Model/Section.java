/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author vuman
 */
public class Section {
    private int sectionId;
    private int courseId;
    private String sectionName;
    private byte isDisable;

    public Section() {
    }

    public Section(int sectionId, int courseId, String sectionName, byte isDisable) {
        this.sectionId = sectionId;
        this.courseId = courseId;
        this.sectionName = sectionName;
        this.isDisable = isDisable;
    }

    public int getSectionId() {
        return sectionId;
    }

    public void setSectionId(int sectionId) {
        this.sectionId = sectionId;
    }

    public int getCourseId() {
        return courseId;
    }

    public void setCourseId(int courseId) {
        this.courseId = courseId;
    }

    public String getSectionName() {
        return sectionName;
    }

    public void setSectionName(String sectionName) {
        this.sectionName = sectionName;
    }

    public byte getIsDisable() {
        return isDisable;
    }

    public void setIsDisable(byte isDisable) {
        this.isDisable = isDisable;
    }
    
    
}
