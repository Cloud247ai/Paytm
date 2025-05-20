import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.*;

@WebServlet("/Update")
public class Update extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String accountNumber = req.getParameter("accountNumber");
        String name = req.getParameter("accountHolderName");
        String gender = req.getParameter("age");
        String email = req.getParameter("email");
        String mobile = req.getParameter("phoneNumber");

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/paytm", "root", "ijustDh53@");

            // Update user details
            PreparedStatement pr = con.prepareStatement("UPDATE user SET name=?, gender=?, email=?, mobile=? WHERE account=?");
            pr.setString(1, name);
            pr.setString(2, gender);
            pr.setString(3, email);
            pr.setString(4, mobile);
            pr.setString(5, accountNumber);
            pr.executeUpdate();

            // Redirect to individual account using updated mobile
            res.sendRedirect("Accessaccount?mobile=" + mobile);

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            req.setAttribute("msg", "Something went wrong during update.");
            req.getRequestDispatcher("Edit.jsp?account=" + accountNumber).forward(req, res);
        }
    }
}
