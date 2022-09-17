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
public class UserDAO extends DBContext{
    public void addUser(User u) {
        execute("EXEC [sp_create_account] ?, ?, ?, ?, ? ,?",
                u.getUsername(),
                u.getPassword(),
                u.getFirstName(),
                u.getLastName(),
                u.getDob(),
                u.getRole()
        );
    }
    
    public User getUserInforByUsername(String username) {
        try ( ResultSet rs = executeQuery("SELECT * FROM [User] WHERE [User].Username = ?", username)) {
            if (rs.next()) {
                int userId = rs.getInt("UserID");
                String firstName = rs.getNString("FirstName");
                String lastName = rs.getNString("LastName");
                String email = rs.getString("Email");
                String phoneNum = rs.getString("PhoneNumber");
                String country = rs.getNString("Country");
                String city = rs.getNString("City");
                String address = rs.getNString("Address");
                Date dob = rs.getDate("DoB");
                String postCode = rs.getString("PostCode");
                float balance = rs.getFloat("Balance");
                String avatar = rs.getString("Avatar");
                String password = rs.getString("Password");
                String role = rs.getNString("Role");
                
                return new User(userId, firstName, lastName, email, role, country, city, address, dob, postCode, balance, avatar, username, password, role);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public User getUserInforByUsername1(String username) {
        try ( ResultSet rs = executeQuery("SELECT UserID, FirstName, LastName, DoB FROM [User] WHERE Username = ?", username)) {
            if (rs.next()) {
                int userId = rs.getInt("UserID");
                String firstName = rs.getNString("FirstName");
                String lastName = rs.getNString("LastName");               
                Date dob = rs.getDate("DoB");
                
                return new User(userId, firstName, lastName, dob);
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

}
