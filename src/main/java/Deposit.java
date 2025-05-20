import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.*;

@WebServlet("/Deposit")
public class Deposit extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String account = req.getParameter("accountNumber");
        String amountStr = req.getParameter("money");

        try {
            double depositAmount = Double.parseDouble(amountStr);

            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/paytm", "root", "ijustDh53@");

            // Get current balance and mobile number
            PreparedStatement ps = con.prepareStatement("SELECT balence, mobile FROM user WHERE account = ?");
            ps.setString(1, account);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                double currentBalance = rs.getDouble("balence");
                String mobile = rs.getString("mobile");

                if (depositAmount > 0) {
                    double newBalance = currentBalance + depositAmount;

                    // Update balance
                    PreparedStatement update = con.prepareStatement("UPDATE user SET balence = ? WHERE account = ?");
                    update.setDouble(1, newBalance);
                    update.setString(2, account);
                    update.executeUpdate();

                    // Redirect to Accessaccount servlet with user's mobile number
                    res.sendRedirect("Accessaccount?mobile=" + mobile);
                    return;
                } else {
                    req.setAttribute("msg", "Deposit amount must be greater than zero.");
                }
            } else {
                req.setAttribute("msg", "Account not found.");
            }

            req.getRequestDispatcher("getstarted.jsp").forward(req, res);

        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("msg", "Something went wrong during deposit.");
            req.getRequestDispatcher("getstarted.jsp").forward(req, res);
        }
    }
}
