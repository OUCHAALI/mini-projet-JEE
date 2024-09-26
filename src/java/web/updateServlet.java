package web;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

public class updateServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            int id = Integer.parseInt(request.getParameter("bookID"));
            String title = request.getParameter("bookTitle");
            String author = request.getParameter("author");
            String desc = request.getParameter("bookDesc");
            BigDecimal price = new BigDecimal(request.getParameter("price"));
            String dateString = request.getParameter("publishedDate");

            SimpleDateFormat sdfInput = new SimpleDateFormat("yyyy-MM-dd");
            Date pd = null;
            try {
                pd = sdfInput.parse(dateString);
            } catch (ParseException ex) {
                Logger.getLogger(updateServlet.class.getName()).log(Level.SEVERE, null, ex);
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                out.print("{\"error\": \"Error parsing date: " + ex.getMessage() + "\"}");
                return; // Stop processing if date parsing fails
            }

            Session conn = null;
            Transaction tr = null;
            try {
                conn = new Configuration().configure().buildSessionFactory().openSession();
                tr = conn.beginTransaction();
                Query qr = conn.createQuery("UPDATE Books SET title = :title, author = :author, description = :desc, price = :price, published_date = :pd WHERE id = :id");
                qr.setParameter("title", title);
                qr.setParameter("author", author);
                qr.setParameter("desc", desc);
                qr.setParameter("price", price);
                qr.setParameter("pd", pd);
                qr.setParameter("id", id);
                qr.executeUpdate(); // Execute the update query
                tr.commit(); // Commit the transaction

                response.setStatus(HttpServletResponse.SC_OK);
                out.print("{\"success\": true}");
            } catch (Exception e) {
                if (tr != null) {
                    tr.rollback(); // Rollback the transaction in case of error
                }
                Logger.getLogger(updateServlet.class.getName()).log(Level.SEVERE, null, e);
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                out.print("{\"error\": \"Update failed: " + e.getMessage() + "\"}");
            } finally {
                if (conn != null) {
                    conn.close(); // Close the session
                }
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Servlet for updating book information";
    }
}
