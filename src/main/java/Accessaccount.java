import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

@WebServlet("/Accessaccount")
public class Accessaccount extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        String mobile = req.getParameter("mobile");

        try {
            // Load JDBC driver
            Class.forName("com.mysql.jdbc.Driver");
            // Establish DB connection
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/paytm", "root", "ijustDh53@");

            // Query user with provided mobile
            PreparedStatement pr = con.prepareStatement("SELECT * FROM user WHERE mobile = ?");
            pr.setString(1, mobile);
            ResultSet rs = pr.executeQuery();

            if (rs.next()) {
                // Set user data in request scope
                req.setAttribute("id", rs.getInt("id"));
                req.setAttribute("name", rs.getString("name"));
                req.setAttribute("account", rs.getString("account"));
                req.setAttribute("balance", rs.getDouble("balence"));
                req.setAttribute("email", rs.getString("email"));
                req.setAttribute("dob", rs.getString("birthday"));
                req.setAttribute("gender", rs.getString("gender"));
                req.setAttribute("mobile", rs.getString("mobile"));

                // Forward to profile.jsp
                RequestDispatcher rd = req.getRequestDispatcher("profile.jsp");
                rd.forward(req, res);
            } else {
                // Mobile not found
                req.setAttribute("msg", "This mobile number is not registered with any account!");
                RequestDispatcher rd = req.getRequestDispatcher("accessaccount.jsp");
                rd.forward(req, res);
            }

        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("msg", "An error occurred while accessing the account.");
            RequestDispatcher rd = req.getRequestDispatcher("accessaccount.jsp");
            rd.forward(req, res);
        }
    }
}
