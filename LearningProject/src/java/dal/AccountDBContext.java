/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Context.DBContext;
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

    public String findAcc(String username) {
        try {
            ResultSet rs = executeQuery("SELECT * FROM Account where UserName = ?", username);
            if (rs.next()) {
                return rs.getString("UserName");
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
    
    public String findOldPass(String username) {
        try {
            ResultSet rs = executeQuery("SELECT * FROM Account where UserName = ?", username);
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
}
