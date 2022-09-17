/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Model.User;
import java.sql.Date;
import java.sql.ResultSet;
import java.util.AbstractMap;
import java.util.ArrayList;
import java.util.Map;

/**
 *
 * @author vuman
 */
public class UserDAO extends DBContext {

    public void addUser(User u) {
        execute("EXEC [sp_create_account] ?, ?, ?, ?, ? ,?, ?",
                u.getUsername(),
                u.getPassword(),
                u.getFirstName(),
                u.getLastName(),
                u.getDob(),
                "User",
                0
        );
    }

    public User getAllUserInformation(String username) {
        try ( ResultSet rs = executeQuery("SELECT UserID,"
                + " FirstName,"
                + " LastName,"
                + " Email,"
                + " PhoneNumber, Country, City, Address, DoB, PostCode, Balance, Avatar, Password, Role FROM [User] WHERE [User].Username = ?", username)) {
            if (rs.next()) {
                int userId = rs.getInt("UserID");
                String firstName = rs.getNString("FirstName");
                String lastName = rs.getNString("LastName");
                String email = "";
                String phoneNum = "";
                String country = "";
                String city = "";
                String address = "";
                String postCode = "";
                byte[] avatar = rs.getBytes("Avatar");
                if (rs.getString("Email") != null) {
                    email = rs.getString("Email");    
                }
                if(rs.getString("PhoneNumber") != null){
                    phoneNum = rs.getString("PhoneNumber");
                }
                if(rs.getNString("Country") != null){
                    country = rs.getNString("Country");
                }
                if(rs.getNString("City") != null){
                    city = rs.getNString("City");
                }
                if(rs.getNString("Address") != null){
                    address = rs.getNString("Address");
                }
                if(rs.getString("PostCode") != null){
                    postCode = rs.getString("PostCode");
                }
                Date dob = rs.getDate("DoB");
                float balance = rs.getFloat("Balance");
                String password = rs.getString("Password");
                String role = rs.getNString("Role");

                return new User(userId, firstName, lastName, email, phoneNum, country, city, address, dob, postCode, balance, avatar, username, password, role);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean checkLogin(String username, String password) {
        try ( ResultSet rs = executeQuery("SELECT * FROM [User] WHERE Username = ? AND Password = ?", username, password)) {
            return rs.next();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean isAccountExist(String username) {
        try ( ResultSet rs = executeQuery("SELECT * FROM [User] WHERE Username = ?", username)) {
            return rs.next();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public String getRoleByUsername(String username) {
        try ( ResultSet rs = executeQuery("SELECT * FROM [User] WHERE Username = ?", username)) {
            if (rs.next()) {
                return rs.getString("Role");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public void changePassword(String username, String password) {
        try {
            executeUpdate("UPDATE [User] SET [Password] = ? WHERE [Username] = ?", password, username);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
