/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package VIew;

import Model.Account;
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
    public void addUser(User u, Account a) {
        execute("EXEC [sp_create_account] ?, ?, ?, ?, ? ,?",
                a.getUserName(),
                a.getPassword(),
                u.getFirstName(),
                u.getLastName(),
                u.getDob(),
                a.getRoleName()
        );
    }
    
    public User getUserInforByUsername(String username) {
        try ( ResultSet rs = executeQuery("SELECT [User].UserID, [User].FirstName, [User].LastName, [User].Email, [User].PhoneNumber, [User].Country, [User].City, [User].Address, [User].DoB, [User].PostCode, [User].Balance, [User].Avatar FROM [User], Account WHERE [User].UserID = Account.UserID AND [Account].UserName = ?", username)) {
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
                
                return new User(userId, firstName, lastName,  email, phoneNum, country, city, address, dob, postCode, balance, avatar);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public User getUserInforByUsername1(String username) {
        try ( ResultSet rs = executeQuery("SELECT [User].UserID, [User].FirstName, [User].LastName, [User].DoB FROM [User], Account WHERE [User].UserID = Account.UserID AND Account.UserName = ?", username)) {
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

}
