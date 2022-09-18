/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Model.User;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.AbstractMap;
import java.util.ArrayList;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

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
                if (rs.getString("PhoneNumber") != null) {
                    phoneNum = rs.getString("PhoneNumber");
                }
                if (rs.getNString("Country") != null) {
                    country = rs.getNString("Country");
                }
                if (rs.getNString("City") != null) {
                    city = rs.getNString("City");
                }
                if (rs.getNString("Address") != null) {
                    address = rs.getNString("Address");
                }
                if (rs.getString("PostCode") != null) {
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

    public void updateProfile(User user) {
        try {
            executeUpdate("UPDATE [User]\n"
                    + "SET [FirstName] = ?,\n"
                    + "[LastName] = ?,\n"
                    + "[DoB] = ?,\n"
                    + "[Country] = ?,\n"
                    + "[City] = ?,\n"
                    + "[Address] = ?,\n"
                    + "[PostCode] = ?,\n"
                    + "[PhoneNumber] = ?\n"
                    + "WHERE [User].[UserID] = ?", 
                    user.getFirstName(), user.getLastName(), user.getDob(), user.getCountry()
            , user.getCity(), user.getAddress(), user.getPostCode(), user.getPhoneNumber(), 
            user.getUserId());
        } catch (Exception e) {
            e.printStackTrace();
        }
//        try {
//            String sql = "UPDATE [User]\n"
//                    + "SET [FirstName] = ?,\n"
//                    + "[LastName] = ?,\n"
//                    + "[DoB] = ?,\n"
//                    + "[Country] = ?,\n"
//                    + "[City] = ?,\n"
//                    + "[Address] = ?,\n"
//                    + "[PostCode] = ?,\n"
//                    + "[PhoneNumber] = ?\n"
//                    + "WHERE [User].[Username] = ?";
//            PreparedStatement stm = connection.prepareStatement(sql);
//            stm.setString(1, user.getFirstName());
//            stm.setString(2, user.getLastName());
//            stm.setDate(3, user.getDob());
//            stm.setString(4, user.getCountry());
//            stm.setString(5, user.getCity());
//            stm.setString(6, user.getAddress());
//            stm.setString(7, user.getPostCode());
//            stm.setString(8, user.getPhoneNumber());
//            stm.setString(9, user.getUsername());
//            stm.executeUpdate();
//        } catch (Exception ex) {
//            ex.printStackTrace();
//        }

    }
}
