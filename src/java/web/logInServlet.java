/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web;

import dao.Users;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author SYN
 */
public class logInServlet extends HttpServlet {

    Session conn;
    Transaction tr; 
    Query qr;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String user = request.getParameter("username");
            String password = request.getParameter("password");
       
            try {
                conn = new Configuration().configure().buildSessionFactory().openSession();
                qr = conn.createQuery("FROM Users WHERE username = :user AND password = :password");
                qr.setParameter("user", user);
                qr.setParameter("password", password);
                Users u1 = (Users) qr.uniqueResult();

                if (u1 != null) {
                    HttpSession session = request.getSession();
                    session.setAttribute("user", u1);
                    request.getRequestDispatcher("/dashboard.jsp").forward(request, response);
                    conn.close();
                } else {
                    // Set a request attribute indicating that no user was found
                    request.setAttribute("error", "No user found with this information");
                    // Forward the request to the login page
                    request.getRequestDispatcher("/logIn.jsp").forward(request, response);
                }
            } catch (Exception e) {
                out.println("Failed " + e.toString());
            }

        }
    }

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
        processRequest(request, response);
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
        processRequest(request, response);
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
