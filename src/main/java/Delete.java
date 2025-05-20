import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/Delete")
public class Delete extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String account = req.getParameter("account");

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/paytm", "root", "ijustDh53@");

            PreparedStatement pr = con.prepareStatement("DELETE FROM user WHERE account = ?");
            pr.setString(1, account);
            int i = pr.executeUpdate();

            if (i > 0) {
                // ✅ Redirect to getstarted.jsp after successful deletion
                res.sendRedirect("getstarted.jsp");
            } else {
                // Optional: Redirect with a failure message
                req.setAttribute("msg", "Account not found or already deleted.");
                req.getRequestDispatcher("Accounts.jsp").forward(req, res);
            }

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            req.setAttribute("msg", "Error occurred while deleting account.");
            req.getRequestDispatcher("Accounts.jsp").forward(req, res);
        }
    }
}
