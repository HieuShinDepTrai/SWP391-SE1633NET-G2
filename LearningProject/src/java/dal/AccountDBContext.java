/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Context.DBContext;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author NamDepTraiVL
 */
public class AccountDBContext extends DBContext {
       
    public String findAccWithEmail(String email) {
        try {
            ResultSet rs = executeQuery("SELECT * FROM [User] where Email = ?", email);
            if (rs.next()) {
                return rs.getString("Email");
            }
//            String sql = "select * from Account";                                    
//            ResultSet rs = executeQuery(sql);
//            String user = rs.getString(1);
//            return user;
        } catch (Exception ex) {
            return ex.getMessage().toString();
        }
        return null;
    }

    public String findOldPassWithEmail(String email) {
        try {
            ResultSet rs = executeQuery("SELECT * FROM [User] where Email = ?", email);
            if (rs.next()) {
                return rs.getString("Password");
            }
//            String sql = "select * from Account";                                    
//            ResultSet rs = executeQuery(sql);
//            String user = rs.getString(1);
//            return user;
        } catch (Exception ex) {
            return ex.getMessage().toString();
        }
        return "Not found";
    }

    public void update(String email, String password) {
        executeUpdate("update [User] \n"
                + "set Password = ?\n"
                + "where Email = ? ", password, email);
    }
}
