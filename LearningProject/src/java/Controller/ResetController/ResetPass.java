/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.ResetController;

import Context.DBContext;
import dal.AccountDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Date;
import Utils.HMACSHA256;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author NamDepTraiVL
 */
@WebServlet(name = "ResetPass", urlPatterns = {"/resetpass"})
public class ResetPass extends HttpServlet {

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("ResetPass.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String payload = "";
        AccountDBContext accDB = new AccountDBContext();
        if (accDB.findAcc(username) != null) {
            try {
                String password = accDB.findOldPass(username);
                response.getWriter().println(password);
                long now = new Date().getTime() + 5 * 60 * 1000;
                payload += "user: " + username + " ex: " + String.valueOf(now);
                String sig = HMACSHA256.hmacWithJava(payload, password);
                String res = Base64.getEncoder().encodeToString(payload.getBytes()) + ";" + sig;
                response.getWriter().println("Res:" + res);
                String encode = Base64.getEncoder().encodeToString(res.getBytes());
                response.getWriter().println("Encode: " + encode);    
                
                Base64.Decoder decoder = Base64.getDecoder();  
                //String decode = Base64.getDecoder().decode(encode.getBytes());
                //response.getWriter().println("Decode: " + HMACSHA256.bytesToHex(Base64.getDecoder().decode(base64.getBytes())));                
                response.getWriter().println("Decode: " + new String(decoder.decode(encode)));
            } catch (Exception ex) {
                System.out.print(ex.getMessage().toString());
            }
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
