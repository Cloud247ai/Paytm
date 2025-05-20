import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.*;

@WebServlet("/BankTransfer")
public class BankTransfer extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        String senderAccount = req.getParameter("senderAccount");
        String receiverAccount = req.getParameter("receiverAccount");
        String amountParam = req.getParameter("amount");

        double amount;

        try {
            amount = Double.parseDouble(amountParam);
        } catch (NumberFormatException e) {
            req.setAttribute("errorMsg", "Invalid amount entered.");
            req.getRequestDispatcher("BankTransfer.jsp").forward(req, res);
            return;
        }

        try {
            Class.forName("com.mysql.jdbc.Driver");
            try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/paytm", "root", "ijustDh53@")) {

                if (!accountExists(con, senderAccount)) {
                    req.setAttribute("errorMsg", "Sender's account number does not exist.");
                    req.getRequestDispatcher("BankTransfer.jsp").forward(req, res);
                    return;
                }

                if (!accountExists(con, receiverAccount)) {
                    req.setAttribute("errorMsg", "Receiver's account number does not exist.");
                    req.getRequestDispatcher("BankTransfer.jsp").forward(req, res);
                    return;
                }

                double senderBalance = 0;
                double receiverBalance = 0;

                PreparedStatement ps = con.prepareStatement("SELECT account, balence FROM user WHERE account IN (?, ?)");
                ps.setString(1, senderAccount);
                ps.setString(2, receiverAccount);
                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
                    String acc = rs.getString("account");
                    double bal = rs.getDouble("balence");

                    if (acc.equals(senderAccount)) senderBalance = bal;
                    else if (acc.equals(receiverAccount)) receiverBalance = bal;
                }

                if (senderBalance < amount) {
                    req.setAttribute("errorMsg", "Insufficient balance in sender's account.");
                    req.getRequestDispatcher("BankTransfer.jsp").forward(req, res);
                    return;
                }

                // Begin transaction
                con.setAutoCommit(false);

                PreparedStatement ps1 = con.prepareStatement("UPDATE user SET balence = ? WHERE account = ?");
                ps1.setDouble(1, senderBalance - amount);
                ps1.setString(2, senderAccount);
                ps1.executeUpdate();

                PreparedStatement ps2 = con.prepareStatement("UPDATE user SET balence = ? WHERE account = ?");
                ps2.setDouble(1, receiverBalance + amount);
                ps2.setString(2, receiverAccount);
                ps2.executeUpdate();

                con.commit();

                // Set transaction summary attributes
                req.setAttribute("amount", amount);
                req.setAttribute("sender", senderAccount);
                req.setAttribute("receiver", receiverAccount);

                RequestDispatcher rd = req.getRequestDispatcher("TransactionSuccess.jsp");
                rd.forward(req, res);

            } catch (SQLException sqlEx) {
                sqlEx.printStackTrace();
                req.setAttribute("errorMsg", "A database error occurred. Transaction failed.");
                req.getRequestDispatcher("BankTransfer.jsp").forward(req, res);
            }

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            req.setAttribute("errorMsg", "Driver not found.");
            req.getRequestDispatcher("BankTransfer.jsp").forward(req, res);
        }
    }

    private boolean accountExists(Connection con, String accountNumber) throws SQLException {
        PreparedStatement check = con.prepareStatement("SELECT 1 FROM user WHERE account = ?");
        check.setString(1, accountNumber);
        ResultSet rs = check.executeQuery();
        return rs.next();
    }
}
