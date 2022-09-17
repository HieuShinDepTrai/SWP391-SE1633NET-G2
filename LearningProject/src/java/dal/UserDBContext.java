/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Model.User;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Hieu Shin
 */
public class UserDBContext extends DBContext {

    public User getUserByUsername(String username) {
        try {
            String sql = "SELECT \n"
                    + "[User].[FirstName], [User].[LastName], [User].[DoB],\n"
                    + "[User].[Country], [User].[City], [User].[PostCode],\n"
                    + "[User].[PhoneNumber], [User].[Balance]\n"
                    + "FROM [User]\n"
                    + "WHERE [User].[Username] = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                User user = new User();
                user.setFirstName(rs.getString("FirstName"));
                user.setLastName(rs.getString("LastName"));
                user.setDob(rs.getDate("DoB"));
                user.setCountry(rs.getString("Country"));
                user.setCity(rs.getString("City"));
                user.setPostCode(rs.getString("PostCode"));
                user.setPhoneNumber(rs.getString("PhoneNumber"));
                user.setBalance(rs.getFloat("Balance"));
                return user;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
