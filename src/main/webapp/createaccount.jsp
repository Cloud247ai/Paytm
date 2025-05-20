<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Create Account - Paytm Clone</title>
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
            background-color: #fff;
            font-family: 'Segoe UI', sans-serif;
        }
        main {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 2rem 1rem;
        }
        .form-card {
            background: #fff;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.15);
            width: 100%;
            max-width: 600px;
            animation: fadeInUp 0.6s ease-in-out;
        }
        .form-card h2 {
            color: #007bff;
            font-weight: 700;
            margin-bottom: 25px;
        }
        .form-control:focus {
            border-color: #007bff;
            box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25);
        }
        .btn-submit {
            background-color: #007bff;
            font-weight: 600;
        }
        .btn-submit:hover {
            background-color: #0056b3;
        }
        @keyframes fadeInUp {
            from { opacity: 0; transform: translateY(30px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>

<%
    String msg = (String) request.getAttribute("msg");
%>

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

<!-- Main Content -->
<main>
    <div class="form-card">
        <% if (msg != null) { %>
            <div class="alert alert-info text-center" role="alert">
                <%= msg %>
            </div>
        <% } %>

        <h2 class="text-center">Create Account</h2>
        <form action="Createaccount" method="get">
            <div class="mb-3">
                <label for="accountHolderName" class="form-label">Account Holder's Name</label>
                <input type="text" class="form-control" id="accountHolderName" name="accountHolderName" required>
            </div>

            <div class="row mb-3">
                <div class="col-md-6">
                    <label for="dob" class="form-label">Date of Birth</label>
                    <input type="text" class="form-control" id="dob" name="dob" required placeholder="Eg: 2002-01-27">
                </div>
                <div class="col-md-6">
                    <label for="gender" class="form-label">Gender</label>
                    <select class="form-select" id="gender" name="gender" required>
                        <option value="" disabled selected>Select gender</option>
                        <option value="male">Male</option>
                        <option value="female">Female</option>
                        <option value="other">Other</option>
                    </select>
                </div>
            </div>

            <div class="mb-3">
                <label for="mobile" class="form-label">Mobile</label>
                <input type="text" class="form-control" id="mobile" name="mobile" required>
            </div>

            <div class="mb-4">
                <label for="email" class="form-label">Email</label>
                <input type="email" class="form-control" id="email" name="email" required>
            </div>

            <div class="d-grid">
                <button type="submit" class="btn btn-submit btn-lg">Submit</button>
            </div>
        </form>
    </div>
</main>

<!-- Footer -->
<footer class="bg-info text-white text-center py-3">
    <div class="container small">
        © 2025 Paytm Clone. All rights reserved.
    </div>
</footer>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
