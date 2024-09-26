package web;

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

public class deleteServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {
            String bookid = request.getParameter("idb");

            Session conn = null;
            Transaction tr = null;
            try {
                conn = new Configuration().configure().buildSessionFactory().openSession();
                tr = conn.beginTransaction();
                Query qr = conn.createQuery("DELETE FROM Books WHERE id = :ID");
                qr.setParameter("ID", Integer.parseInt(bookid));
                int rows = qr.executeUpdate();
                tr.commit();

                if (rows > 0) {
                    response.setStatus(HttpServletResponse.SC_OK);
                    out.print("{\"success\": true}");
                } else {
                    response.setStatus(HttpServletResponse.SC_NOT_FOUND);
                    out.print("{\"success\": false, \"error\": \"Book not found\"}");
                }
            } catch (Exception e) {
                if (tr != null) {
                    tr.rollback();
                }
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                out.print("{\"success\": false, \"error\": \"Delete failed: " + e.getMessage() + "\"}");
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
        return "Servlet to delete books";
    }
}
