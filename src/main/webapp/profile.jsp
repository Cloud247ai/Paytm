<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.text.NumberFormat" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>User Profile - Paytm Clone</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        html, body {
            height: 100%;
        }
        body {
            display: flex;
            flex-direction: column;
            background-color: #f1f6fb;
            font-family: 'Segoe UI', sans-serif;
        }
        main {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 2rem 1rem;
        }
        .profile-card {
            background: #fff;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.15);
            width: 100%;
            max-width: 800px;
            animation: fadeInUp 0.5s ease-in-out;
        }
        .profile-card h3 {
            color: #007bff;
            font-weight: 700;
        }
        .profile-details p {
            margin-bottom: 8px;
            font-size: 16px;
        }
        .label {
            font-weight: 600;
            color: #333;
        }
        .btn-group {
            display: flex;
            justify-content: center;
            gap: 15px;
            margin-top: 25px;
        }
        @keyframes fadeInUp {
            from { opacity: 0; transform: translateY(30px); }
            to { opacity: 1; transform: translateY(0); }
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

<!-- Profile Section -->
<main>
    <div class="profile-card">
        <h3 class="text-center mb-4">
            <i class="bi bi-person-circle me-2"></i>Account Profile
        </h3>
        <div class="row profile-details">
            <div class="col-md-6">
                <p><span class="label">Name:</span> <%= request.getAttribute("name") %></p>
                <p><span class="label">Gender:</span> <%= request.getAttribute("gender") %></p>
                <p><span class="label">DOB:</span> <%= request.getAttribute("dob") %></p>
            </div>
            <div class="col-md-6">
                <p><span class="label">Mobile:</span> <%= request.getAttribute("mobile") %></p>
                <p><span class="label">Email:</span> <%= request.getAttribute("email") %></p>
                <p><span class="label">Account Number:</span> <%= request.getAttribute("account") %></p>
                <p><span class="label">Balance:</span> <%= NumberFormat.getCurrencyInstance(new java.util.Locale("en", "IN")).format(request.getAttribute("balance")) %></p>
            </div>
        </div>

        <div class="btn-group">
            <a href="Deposit.jsp?account=<%= request.getAttribute("account") %>" class="btn btn-success">Deposit</a>
            <a href="Edit.jsp?account=<%= request.getAttribute("account") %>" class="btn btn-warning">Edit</a>
            <a href="Delete?account=<%= request.getAttribute("account") %>" class="btn btn-danger">Delete</a>
        </div>
    </div>
</main>

<!-- Footer -->
<footer class="bg-info text-white text-center py-3">
    <div class="container small">
        © 2025 <strong>Paytm Clone</strong>. All rights reserved.
    </div>
</footer>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<!-- Bootstrap Icons -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

</body>
</html>
