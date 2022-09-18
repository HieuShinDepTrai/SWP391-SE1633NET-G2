/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import dal.UserDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import utils.SHA256;

/**
 *
 * @author vuman
 */
public class ChangePasswordController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("ChangePassword.jsp").forward(request, response);
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserDAO userDAO = new UserDAO();
        
        HttpSession session = request.getSession();
        String username = (String)session.getAttribute("username");
        
        String oldPassword = request.getParameter("old-password");
        String newPassword = request.getParameter("new-password");
        
        String hashedPassword = userDAO.getAllUserInformation(username).getPassword();

        if (hashedPassword.equals(SHA256.SHA256(oldPassword))) {
            userDAO.changePassword(username, SHA256.SHA256(newPassword));
            request.setAttribute("result", "Change password successfully");
        } else {
            request.setAttribute("result", "Wrong old password");
        }
        
        doGet(request, response);
    }

}
