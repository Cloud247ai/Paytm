<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Account - Paytm Clone</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        html, body {
            height: 100%;
        }
        body {
            display: flex;
            flex-direction: column;
            background-color: #f8f9fa;
            font-family: 'Segoe UI', sans-serif;
        }
        main {
            flex: 1;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 2rem 1rem;
        }
        .edit-card {
            background: #fff;
            padding: 2rem;
            border-radius: 15px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 600px;
        }
        .form-label {
            font-weight: 500;
        }
        .btn-update {
            background-color: #007bff;
            font-weight: 600;
        }
        .btn-update:hover {
            background-color: #0056b3;
        }
        footer {
            background-color: #17a2b8;
            color: white;
            text-align: center;
            padding: 12px 0;
        }
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-info sticky-top shadow-sm">
    <div class="container">
        <a class="navbar-brand fw-bold text-white" href="#">Paytm</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarScroll">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarScroll">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item"><a class="nav-link text-white" href="index.jsp">Home</a></li>
                <li class="nav-item"><a class="nav-link text-white" href="createaccount.jsp">Create Account</a></li>
                <li class="nav-item"><a class="nav-link text-white" href="accessaccount.jsp">Access Account</a></li>
            </ul>
        </div>
    </div>
</nav>

<!-- Main Section -->
<main>
    <div class="edit-card">
        <%
            String number = request.getParameter("account");
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/paytm", "root", "ijustDh53@");
            PreparedStatement pr = con.prepareStatement("SELECT * FROM user WHERE account=?");
            pr.setString(1, number);
            ResultSet rs = pr.executeQuery();
            while (rs.next()) {
                String account = rs.getString("account");
                String name = rs.getString("name");
                String mobile = rs.getString("mobile");
                String email = rs.getString("email");
                String gender = rs.getString("gender");
        %>

        <h4 class="mb-3 text-primary text-center">Edit Account Details</h4>
        <form action="Update" method="get">
            <div class="mb-3">
                <label class="form-label">Account Number</label>
                <input type="text" class="form-control" name="accountNumber" value="<%= account %>" readonly>
            </div>

            <div class="mb-3">
                <label class="form-label">Account Holder Name</label>
                <input type="text" class="form-control" name="accountHolderName" value="<%= name %>">
            </div>

            <div class="row mb-3">
                <div class="col-md-6">
                    <label class="form-label">Gender</label>
                    <input type="text" class="form-control" name="age" value="<%= gender %>">
                </div>
                <div class="col-md-6">
                    <label class="form-label">Email</label>
                    <input type="email" class="form-control" name="email" value="<%= email %>">
                </div>
            </div>

            <div class="mb-4">
                <label class="form-label">Phone Number</label>
                <input type="tel" class="form-control" name="phoneNumber" value="<%= mobile %>">
            </div>

            <div class="d-grid">
                <button type="submit" class="btn btn-update btn-lg">Update</button>
            </div>
        </form>
        <% } %>
    </div>
</main>

<!-- Footer -->
<footer>
    © 2025 Paytm Clone. All rights reserved.
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
