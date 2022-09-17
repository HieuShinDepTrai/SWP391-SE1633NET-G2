/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package Model;

import java.sql.Date;

/**
 *
 * @author Hieu Shin
 */
public class User {
    private int UserID;
    private String FirstName;
    private String LastName;
    private String Email;
    private String PhoneNumber;
    private String Country;
    private String City;
    private String Address;
    private Date Dob;
    private String PostCode;
    private float Balance;
    private byte[] Avatar;
    private String Username;
    private String Password;
    private String Role;

    public User() {
    }

    public User(String FirstName, String LastName, Date Dob, String Username, String Password, String Role) {
        this.FirstName = FirstName;
        this.LastName = LastName;
        this.Dob = Dob;
        this.Username = Username;
        this.Password = Password;
        this.Role = Role;
    }

    public User(int UserID, String FirstName, String LastName, String Email, String PhoneNumber, String Country, String City, String Address, Date Dob, String PostCode, float Balance, byte[] Avatar, String Username, String Password, String Role) {
        this.UserID = UserID;
        this.FirstName = FirstName;
        this.LastName = LastName;
        this.Email = Email;
        this.PhoneNumber = PhoneNumber;
        this.Country = Country;
        this.City = City;
        this.Address = Address;
        this.Dob = Dob;
        this.PostCode = PostCode;
        this.Balance = Balance;
        this.Avatar = Avatar;
        this.Username = Username;
        this.Password = Password;
        this.Role = Role;
    }
    
    public int getUserID() {
        return UserID;
    }

    public void setUserID(int UserID) {
        this.UserID = UserID;
    }

    public String getFirstName() {
        return FirstName;
    }

    public void setFirstName(String FirstName) {
        this.FirstName = FirstName;
    }

    public String getLastName() {
        return LastName;
    }

    public void setLastName(String LastName) {
        this.LastName = LastName;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public String getPhoneNumber() {
        return PhoneNumber;
    }

    public void setPhoneNumber(String PhoneNumber) {
        this.PhoneNumber = PhoneNumber;
    }

    public String getCountry() {
        return Country;
    }

    public void setCountry(String Country) {
        this.Country = Country;
    }

    public String getCity() {
        return City;
    }

    public void setCity(String City) {
        this.City = City;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String Address) {
        this.Address = Address;
    }

    public Date getDob() {
        return Dob;
    }

    public void setDob(Date Dob) {
        this.Dob = Dob;
    }

    public String getPostCode() {
        return PostCode;
    }

    public void setPostCode(String PostCode) {
        this.PostCode = PostCode;
    }

    public float getBalance() {
        return Balance;
    }

    public void setBalance(float Balance) {
        this.Balance = Balance;
    }

    public byte[] getAvatar() {
        return Avatar;
    }

    public void setAvatar(byte[] Avatar) {
        this.Avatar = Avatar;
    }

    public String getUsername() {
        return Username;
    }

    public void setUsername(String Username) {
        this.Username = Username;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String Password) {
        this.Password = Password;
    }

    public String getRole() {
        return Role;
    }

    public void setRole(String Role) {
        this.Role = Role;
    }
    
}
