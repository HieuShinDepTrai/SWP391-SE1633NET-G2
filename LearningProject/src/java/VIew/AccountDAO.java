/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package VIew;

import java.sql.ResultSet;

/**
 *
 * @author vuman
 */
public class AccountDAO extends DBContext{
    public boolean checkLogin(String username, String password) {
        try ( ResultSet rs = executeQuery("SELECT * FROM Account WHERE UserName = ? AND Password = ?", username, password)) {
            return rs.next();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public boolean isAccountExist(String username) {
        try ( ResultSet rs = executeQuery("SELECT * FROM Account WHERE UserName = ?", username)) {
            return rs.next();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public String getRoleByUsername(String username) {
        try ( ResultSet rs = executeQuery("SELECT * FROM Account WHERE UserName = ?", username)) {
            if (rs.next()) {
                return rs.getString("RoleName");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
