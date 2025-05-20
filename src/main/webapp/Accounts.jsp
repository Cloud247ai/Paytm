<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.NumberFormat" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Accounts - Paytm Clone</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background-color: #f4f9ff;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }
        main {
            flex: 1;
            padding: 2rem 1rem;
        }
        .success-banner {
            background: #e6ffed;
            border-left: 6px solid #28a745;
            padding: 20px;
            margin: 2rem auto 1rem;
            border-radius: 10px;
            max-width: 900px;
            animation: slideIn 0.6s ease-in-out;
        }
        @keyframes slideIn {
            from { transform: translateY(-10px); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }
        .table-container {
            max-width: 1000px;
            margin: auto;
            background: #fff;
            border-radius: 12px;
            box-shadow: 0 6px 25px rgba(0,0,0,0.08);
            padding: 30px;
        }
        .table th, .table td {
            vertical-align: middle;
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

<main>
<%
    String sender = request.getParameter("sender");
    String receiver = request.getParameter("receiver");
    String amount = request.getParameter("amount");
%>

<% if(sender != null && receiver != null && amount != null) { %>
    <div class="success-banner">
        <h5 class="text-success mb-2">✅ Transaction Completed Successfully</h5>
        <p class="mb-0">
            ₹<strong><%= amount %></strong> transferred from 
            <span class="fw-semibold text-dark">Account <%= sender %></span> 
            to <span class="fw-semibold text-dark">Account <%= receiver %></span>.
        </p>
    </div>
<% } %>

<!-- Account Table -->
<div class="container table-container">
    <h3 class="text-primary text-center mb-4">All Account Details</h3>
    <table class="table table-hover table-striped align-middle">
        <thead class="table-info">
            <tr>
                <th>Acc_Id</th>
                <th>Holder Name</th>
                <th>Account No.</th>
                <th>Balance</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <%
                Connection con = null;
                PreparedStatement pr = null;
                ResultSet r = null;
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/paytm", "root", "ijustDh53@");
                    pr = con.prepareStatement("SELECT id, name, account, balence FROM user");
                    r = pr.executeQuery();
                    while (r.next()) {
                        int id = r.getInt("id");
                        String name = r.getString("name");
                        String account = r.getString("account");
                        double balance = r.getDouble("balence");
            %>
            <tr>
                <td><%= id %></td>
                <td><%= name %></td>
                <td><%= account %></td>
                <td><%= NumberFormat.getCurrencyInstance(new java.util.Locale("en", "IN")).format(balance) %></td>
                <td>
                    <a href="Deposit.jsp?account=<%= account %>" class="btn btn-sm btn-success">Deposit</a>
                    <a href="Edit.jsp?account=<%= account %>" class="btn btn-sm btn-warning">Edit</a>
                    <a href="Delete?account=<%= account %>" class="btn btn-sm btn-danger">Delete</a>
                </td>
            </tr>
            <% 
                    }
                } catch (Exception e) {
                    out.println("<tr><td colspan='5' class='text-danger text-center'>Error: " + e.getMessage() + "</td></tr>");
                } finally {
                    if (r != null) r.close();
                    if (pr != null) pr.close();
                    if (con != null) con.close();
                }
            %>
        </tbody>
    </table>
</div>
</main>

<!-- Footer -->
<footer class="bg-info text-white text-center py-3 mt-auto">
    <div class="container small">
        © 2025 <strong>Paytm Clone</strong>. All rights reserved.
    </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
