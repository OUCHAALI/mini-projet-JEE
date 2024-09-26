package web;

import dao.Books;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

public class addServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {
            String title = request.getParameter("bookTitle");
            String author = request.getParameter("author");
            String desc = request.getParameter("bookDesc");
            BigDecimal price = new BigDecimal(request.getParameter("price"));
            String dateString = request.getParameter("publishedDate");

            SimpleDateFormat sdfInput = new SimpleDateFormat("yyyy-MM-dd");
            Date pd = null;
            try {
                pd = sdfInput.parse(dateString);
            } catch (ParseException e) {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                out.print("{\"success\": false, \"error\": \"Invalid date format\"}");
                return;
            }

            Books book = new Books();
            book.setTitle(title);
            book.setAuthor(author);
            book.setPrice(price);
            book.setDescription(desc);
            book.setPublishedDate(pd);

            Session conn = null;
            Transaction tr = null;
            try {
                conn = new Configuration().configure().buildSessionFactory().openSession();
                tr = conn.beginTransaction();
                conn.save(book);
                tr.commit();

                response.setStatus(HttpServletResponse.SC_OK);
                out.print("{\"success\": true}");
            } catch (Exception e) {
                if (tr != null) {
                    tr.rollback();
                }
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                out.print("{\"success\": false, \"error\": \"Add failed: " + e.getMessage() + "\"}");
            } finally {
                if (conn != null) {
                    conn.close();
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
        return "Servlet to add books";
    }
}
