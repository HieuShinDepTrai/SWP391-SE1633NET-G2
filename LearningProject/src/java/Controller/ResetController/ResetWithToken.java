/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.ResetController;

import Utils.HMACSHA256;
import dal.AccountDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author NamDepTraiVL
 */
public class ResetWithToken extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String token = request.getParameter("token");
            Base64.Decoder decoder = Base64.getDecoder();
            String encode = new String(decoder.decode(token));
            response.getWriter().println(encode);
            String[] decode = encode.split(";");
            String sig = decode[1];
            //dXNlcjonaHVvbmdwcm93YXInIGV4OicxNjYzMzAzMDM2MzI5Jw==_ceca7a3e2f6634c7c1ceda63433ecb58a87aa31300ea93a3da1e56644627c833         for (int i = 0; i < decode.length; i++) {
            String payload = new String(decoder.decode(decode[0]));
            String sig2 = HMACSHA256.hmacWithJava(payload, "cc7d8c88fe977b1a8d5d4182b79462a834965d7e445ffe948c67a5b813b8617b");
            if(sig2.equals(sig)){
                response.getWriter().println("khop vl");
            }
            else {
                response.getWriter().println("Ko khop");
            }
            String[] sarray = payload.split("\\s");           
            //String check = HMACSHA256.hmacWithJava(user, ex);
                        
            response.getWriter().println("Sig: " + sig);
            response.getWriter().println("Sig2: " + sig2);            
        } catch (Exception ex) {
            response.getWriter().print(ex);
        } 

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
