/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;

/**
 *
 * @author vuman
 */
public class UserQuiz {
    private int userId;
    private String time;
    private ArrayList<Integer> choosedList;
    private int correctAmount;
    private double mark;

    public UserQuiz() {
    }

    public UserQuiz(int userId, String time, ArrayList<Integer> choosedList, int correctAmount, double mark) {
        this.userId = userId;
        this.time = time;
        this.choosedList = choosedList;
        this.correctAmount = correctAmount;
        this.mark = mark;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public ArrayList<Integer> getChoosedList() {
        return choosedList;
    }

    public void setChoosedList(ArrayList<Integer> choosedList) {
        this.choosedList = choosedList;
    }

    public int getCorrectAmount() {
        return correctAmount;
    }

    public void setCorrectAmount(int correctAmount) {
        this.correctAmount = correctAmount;
    }

    public double getMark() {
        return mark;
    }

    public void setMark(double mark) {
        this.mark = mark;
    }
    
    
}
