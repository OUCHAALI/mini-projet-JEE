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
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author SYN
 */
public class signInServlet extends HttpServlet {

    Session conn;
    Transaction tr;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String user = request.getParameter("username");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            Users u = new Users();
            u.setUsername(user);
            u.setEmail(email);
            u.setPassword(password);
            try {
                conn = new Configuration().configure().buildSessionFactory().openSession();
                Transaction tr = conn.beginTransaction();
                conn.save(u);
                tr.commit();
                conn.close();

                // Check if the user object has been assigned an ID after insertion
                if (u.getUserid() != null) {
                    // User inserted successfully
                    request.setAttribute("success", "You are registered");
                    request.getRequestDispatcher("/logIn.jsp").forward(request, response);
                } else {
                    // Set a request attribute indicating that the insertion failed
                    request.setAttribute("faild", "Reinsert your info");
                    request.getRequestDispatcher("/signIn.jsp").forward(request, response);
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
