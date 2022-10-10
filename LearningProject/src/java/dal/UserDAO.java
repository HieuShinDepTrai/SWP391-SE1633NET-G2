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
import java.sql.Timestamp;
import java.time.LocalDate;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author vuman
 */
public class UserDAO extends DBContext {

    public void addUser(User u) {
        try {
            executeUpdate("INSERT INTO [dbo].[User]([Username], [Password], [Email], [Firstname], [LastName], [DoB], [Role], [Balance], [BankNumber], [BankName], [isDisable]) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", u.getUserName(),
                    u.getPassword(),
                    u.getEmail(),
                    u.getFirstName(),
                    u.getLastName(),
                    u.getDob(),
                    u.getRole(),
                    0,
                    u.getBankNum(),
                    u.getBankName(),
                    0);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void addGoogleUser(User u) {
        execute("INSERT INTO [dbo].[User]\n"
                + "           ([FirstName]\n"
                + "           ,[LastName]\n"
                + "           ,[Email]           \n"
                + "           ,[DoB]\n"
                + "           ,[Balance]\n"
                + "           ,[Avatar]\n"
                + "           ,[Username]\n"
                + "           ,[Password]\n"
                + "           ,[Role]\n"
                + "           ,[isDisable])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?)           \n",
                u.getFirstName(),
                u.getLastName(),
                u.getEmail(),
                u.getDob(),
                0,
                u.getAvatar(),
                u.getUserName(),
                u.getPassword(),
                u.getRole(),
                0);
    }

    public User getAllUserInformation(String username) {
        try ( ResultSet rs = executeQuery("SELECT [UserID],"
                + " [FirstName],"
                + " [LastName],"
                + " [Email],"
                + " [PhoneNumber],"
                + " [Country],"
                + " [City],"
                + " [Address],"
                + " [DoB],"
                + " [PostCode],"
                + " [Balance],"
                + " [Avatar],"
                + " [Password],"
                + " [Role], "
                + "[BankNumber], "
                + "[BankName],"
                + "[isDisable] FROM [User] WHERE [Username] = ?", username)) {

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
                String avatar = "data:image/png;base64,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";
                String bankNum = "";
                String bankName = "";
                Date dob = rs.getDate("DoB");
                float balance = rs.getFloat("Balance");
                String password = rs.getString("Password");
                String role = rs.getNString("Role");
                boolean isDisable = rs.getBoolean("isDisable");
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
                if (rs.getString("Avatar") != null) {
                    avatar = rs.getString("Avatar");
                }

                return new User(userId, firstName, lastName, email, phoneNum, country, city, address, dob, postCode, balance, avatar, username, password, role, bankNum, bankName, isDisable);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public User getAllUserInformationByID(int userID) {
        try ( ResultSet rs = executeQuery("SELECT [UserName],"
                + " [FirstName],"
                + " [LastName],"
                + " [Email],"
                + " [PhoneNumber],"
                + " [Country],"
                + " [City],"
                + " [Address],"
                + " [DoB],"
                + " [PostCode],"
                + " [Balance],"
                + " [Avatar],"
                + " [Password],"
                + " [Role], "
                + "[BankNumber], "
                + "[BankName],"
                + "[isDisable] FROM [User] WHERE [UserID] = ?", userID)) {

            if (rs.next()) {
                String username = rs.getString("Username");
                String firstName = rs.getNString("FirstName");
                String lastName = rs.getNString("LastName");
                String email = "";
                String phoneNum = "";
                String country = "";
                String city = "";
                String address = "";
                String postCode = "";
                String avatar = "data:image/png;base64,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";
                String bankNum = "";
                String bankName = "";
                Date dob = rs.getDate("DoB");
                float balance = rs.getFloat("Balance");
                String password = rs.getString("Password");
                String role = rs.getNString("Role");
                boolean isDisable = rs.getBoolean("isDisable");
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
                if (rs.getString("Avatar") != null) {
                    avatar = rs.getString("Avatar");
                }

                return new User(userID, firstName, lastName, email, phoneNum, country, city, address, dob, postCode, balance, avatar, username, password, role, bankNum, bankName, isDisable);
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
                    + "[PhoneNumber] = ?,\n"
                    + "[Email] = ?\n"
                    + "WHERE [User].[UserID] = ?",
                    user.getFirstName(), user.getLastName(), user.getDob(), user.getCountry(),
                    user.getCity(), user.getAddress(), user.getPostCode(), user.getPhone(), user.getEmail(),
                    user.getUserId());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void updateAvatar(User user) {
        try {
            executeUpdate("UPDATE [User]\n"
                    + "SET [Avatar] = ?\n"
                    + "WHERE [User].[UserID] = ?",
                    user.getAvatar(),
                    user.getUserId());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void insertIntoUserCourse(int UserID, int CourseID) {
        try {
            ResultSet rs = executeQuery("SELECT [UserID], [CourseID] FROM [dbo].[User_Course] WHERE [UserID] = ? AND [CourseID] = ?", UserID, CourseID);
            if (rs.next()) {
                executeUpdate("UPDATE [dbo].[User_Course] SET [isStudoed] = ?, [isFavourite] = ? WHERE [CourseID] = ? AND [UserID] = ?", 1, 1, CourseID, UserID);
            } else {
                executeUpdate("INSERT INTO [User_Course](UserID, CourseID, isStudied, isFavourite, Progress) VALUES (? ,?, 1 ,1, 0)",
                        UserID, CourseID);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void unenrollCourse(int UserID, int CourseID) {
        try {
            executeUpdate("DELETE FROM [User_Course] WHERE UserID = ? AND CourseID = ?",
                    UserID, CourseID);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public boolean checkDupFeedback(int userId, int courseId) {
        try {
            ResultSet rs = executeQuery("SELECT [UserID] FROM [dbo].[User_Course] WHERE [UserID] = ? AND [CourseID] = ? AND [CourseFeedback] IS NOT NULL", userId, courseId);

            if (rs.next()) {
                return false;
            }
        } catch (Exception e) {
        }
        return true;
    }

    public boolean checkEnroll(int userId, int courseId) {
        try {
            ResultSet rs = executeQuery("SELECT [UserID] FROM [dbo].[User_Course] WHERE [UserID] = ? AND [CourseID] = ?", userId, courseId);

            if (rs.next()) {
                return false;
            }
        } catch (Exception e) {
        }
        return true;
    }

    public void insertFeedbackAndStar(int userId, int courseId, double rating, String feedback) {
        try {
            if (checkEnroll(userId, courseId)) {
                executeUpdate("INSERT INTO [dbo].[User_Course]([UserID],"
                        + " [CourseID],"
                        + " [isStudied],"
                        + " [CourseRating],"
                        + " [CourseFeedback],"
                        + "[isFavourite]) VALUES (?, ?, ?, ?, ?, ?)", userId, courseId, 0, rating, feedback, 0);
            } else {
                executeUpdate("UPDATE [dbo].[User_Course] SET [CourseFeedback] = ?, [CourseRating] = ? WHERE [UserID] = ? AND [CourseID] = ?", feedback, rating, userId, courseId);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public int getUserTotalTime(int userID) {
        try {
            ResultSet rs = executeQuery("select SUM(Time) as 'TotalTime' from Lesson l\n"
                    + "inner join User_Lesson ul on l.LessonID = ul.LessonID\n"
                    + "where ul.UserID = ?", userID);
            if (rs.next()) {
                return rs.getInt("TotalTime");
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }   

    public int getTotalUser() {
        try {
            ResultSet rs = executeQuery("select count(UserID) as Size from [User]\n"
                    + "where Role='User'");
            if (rs.next()) {
                return rs.getInt("Size");
            }
            return 0;
        } catch (SQLException ex) {
            return 0;
        }
    }

}
