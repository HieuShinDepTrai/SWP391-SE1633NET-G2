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
    private int userId;
    private String firstName;
    private String lastName;
    private String email;
    private String phone;
    private String country;
    private String city;
    private String address;
    private Date dob;
    private String postCode;
    private float balance;
    private byte[] avatar;
    private String userName;
    private String password;
    private String role;
    
    public User() {
    }

    public User(String firstName, String lastName, Date dob, String userName, String password, String role) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.dob = dob;
        this.userName = userName;
        this.password = password;
        this.role = role;
    }

    public User(int userId, String firstName, String lastName, String email, String phone, String country, String city, String address, Date dob, String postCode, float balance, byte[] avatar, String userName, String password, String role) {
        this.userId = userId;
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.phone = phone;
        this.country = country;
        this.city = city;
        this.address = address;
        this.dob = dob;
        this.postCode = postCode;
        this.balance = balance;
        this.avatar = avatar;
        this.userName = userName;
        this.password = password;
        this.role = role;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
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
<<<<<<< HEAD
        return avatar;
    }

    public void setAvatar(byte[] avatar) {
        this.avatar = avatar;
=======
        return Avatar;
    }

    public void setAvatar(byte[] Avatar) {
        this.Avatar = Avatar;
>>>>>>> d91f407cb3703d21d02b53fd7a34cf4221484546
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
