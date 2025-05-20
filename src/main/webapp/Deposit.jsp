<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Deposit Money - Paytm Clone</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        html, body {
            height: 100%;
        }
        body {
            display: flex;
            flex-direction: column;
            background-color: #f0f8ff;
            font-family: 'Segoe UI', sans-serif;
        }
        main {
            flex: 1;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 2rem;
        }
        .deposit-card {
            background: #fff;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 450px;
            animation: fadeInUp 0.6s ease-in-out;
        }
        .deposit-card h4 {
            color: #007bff;
            font-weight: bold;
            margin-bottom: 20px;
        }
        .btn-deposit {
            background-color: #007bff;
            font-weight: 600;
        }
        .btn-deposit:hover {
            background-color: #0056b3;
        }
        footer {
            background-color: #17a2b8;
            color: white;
            padding: 12px 0;
            text-align: center;
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

<!-- Deposit Form -->
<main>
    <%
        String account = request.getParameter("account");
    %>
    <div class="deposit-card">
        <h4 class="text-center">Deposit Money</h4>
        <form action="Deposit" method="get" class="needs-validation" novalidate>
            <div class="mb-3">
                <label class="form-label">Account Number</label>
                <input type="text" class="form-control" name="accountNumber" value="<%= account %>" readonly required>
            </div>
            <div class="mb-3">
                <label class="form-label">Amount</label>
                <input type="number" class="form-control" name="money" placeholder="Enter amount" required min="1">
                <div class="invalid-feedback">Please enter a valid amount.</div>
            </div>
            <div class="d-grid">
                <button type="submit" class="btn btn-deposit btn-lg">Deposit</button>
            </div>
        </form>
    </div>
</main>

<!-- Footer -->
<footer class="mt-auto">
    <div class="container small">
        © 2025 <strong>Paytm Clone</strong>. All rights reserved.
    </div>
</footer>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
