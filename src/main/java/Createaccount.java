import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.Random;

@WebServlet("/Createaccount")
public class Createaccount extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        PrintWriter p = res.getWriter();
        String name = req.getParameter("accountHolderName");
        String mobile = req.getParameter("mobile");
        String email = req.getParameter("email");
        String gender = req.getParameter("gender");
        String date = req.getParameter("dob");

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/paytm", "root", "ijustDh53@");

            PreparedStatement pr = con.prepareStatement("SELECT mobile FROM user WHERE mobile = ?");
            pr.setString(1, mobile);
            ResultSet r = pr.executeQuery();

            if (r.next()) {
                String msg = "This mobile number is already registered with another account! Please use a new one.";
                req.setAttribute("msg", msg);
                RequestDispatcher rd = req.getRequestDispatcher("createaccount.jsp");
                rd.forward(req, res);
            } else {
                String demo = "910000";
                int num = generateAccountSuffix();
                String account = demo + num;

                PreparedStatement pr1 = con.prepareStatement("INSERT INTO user(name, mobile, email, gender, birthday, account) VALUES (?, ?, ?, ?, ?, ?)");
                pr1.setString(1, name);
                pr1.setString(2, mobile);
                pr1.setString(3, email);
                pr1.setString(4, gender);
                pr1.setString(5, date);
                pr1.setString(6, account);

                int i = pr1.executeUpdate();

                if (i > 0) {
                    // ✅ Redirect to getstarted.jsp after successful account creation
                    RequestDispatcher rd = req.getRequestDispatcher("getstarted.jsp");
                    rd.forward(req, res);
                } else {
                    p.println("Account creation failed!");
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

    // Helper method to generate a 4-digit account suffix
    public static int generateAccountSuffix() {
        Random ra = new Random();
        int num = ra.nextInt(10000);
        if (num < 1000) {
            num += 1000; // Ensure it’s 4 digits
        }
        return num;
    }
}
