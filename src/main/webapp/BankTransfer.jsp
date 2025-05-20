<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Bank Transfer - Paytm Clone</title>
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
            background-color: #f9f9f9;
        }
        main {
            flex: 1;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 2rem;
        }
        .transfer-card {
            background: #fff;
            padding: 2.5rem 2rem;
            border-radius: 15px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15);
            max-width: 500px;
            width: 100%;
            position: relative;
            animation: fadeIn 0.6s ease-in-out;
        }
        .transfer-card h3 {
            color: #007bff;
            font-weight: bold;
            margin-bottom: 25px;
        }
        .btn-transfer {
            background-color: #007bff;
            color: white;
            font-weight: 600;
        }
        .btn-transfer:hover {
            background-color: #0056b3;
        }
        .spinner-overlay {
            position: absolute;
            top: 0;
            left: 0;
            height: 100%;
            width: 100%;
            background: rgba(255,255,255,0.8);
            display: flex;
            align-items: center;
            justify-content: center;
            display: none;
            z-index: 10;
        }
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
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

<!-- Main -->
<main>
    <div class="transfer-card position-relative">
        <h3 class="text-center">Bank Transfer</h3>
        <form action="BankTransfer" method="get" onsubmit="showLoader()">
            <div class="mb-3">
                <label class="form-label">Sender's Account Number</label>
                <input type="text" class="form-control" name="senderAccount" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Receiver's Account Number</label>
                <input type="text" class="form-control" name="receiverAccount" required>
            </div>
            <div class="mb-4">
                <label class="form-label">Amount</label>
                <input type="number" class="form-control" name="amount" required>
            </div>
            <button type="submit" class="btn btn-transfer w-100">Send Money</button>
        </form>

        <!-- Spinner Overlay -->
        <div class="spinner-overlay" id="spinner">
            <div class="spinner-border text-primary" role="status">
                <span class="visually-hidden">Processing...</span>
            </div>
        </div>
    </div>
</main>

<!-- Footer -->
<footer class="bg-info text-white text-center py-3">
    <div class="container small">
        © 2025 <strong>Paytm Clone</strong>. All rights reserved.
    </div>
</footer>

<!-- JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script>
    function showLoader() {
        document.getElementById('spinner').style.display = 'flex';
    }
</script>

</body>
</html>
