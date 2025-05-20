<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Get Started - Paytm Clone</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        html, body {
            height: 100%;
        }
        body {
            display: flex;
            flex-direction: column;
        }
        main {
            flex: 1;
        }

        .card:hover {
            transform: translateY(-5px);
            transition: 0.3s ease-in-out;
        }

        .service-icon {
            width: 90px;
            height: 90px;
            background-color: #f1f1f1;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 20px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }

        .service-icon img {
            max-width: 50px;
        }

        .section-header {
            margin-bottom: 40px;
        }

        .faq-question {
            font-weight: 500;
        }
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-info sticky-top shadow-sm">
    <div class="container">
        <a class="navbar-brand fw-bold text-white" href="#">Paytm</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item"><a class="nav-link text-white" href="index.jsp">Home</a></li>
                <li class="nav-item"><a class="nav-link text-white" href="createaccount.jsp">Create Account</a></li>
                <li class="nav-item"><a class="nav-link text-white" href="accessaccount.jsp">Access Account</a></li>
            </ul>
        </div>
    </div>
</nav>

<!-- Main Content -->
<main class="container my-5">
    <!-- Hero -->
    <div class="text-center mb-5">
        <h2 class="fw-bold text-primary">Get Started with Paytm Services</h2>
        <p class="text-muted">Secure, fast, and seamless transactions at your fingertips</p>
    </div>

    <!-- Services -->
    <div class="row g-4 justify-content-center mb-5">
        <!-- Bank Transfer -->
        <div class="col-md-5">
            <div class="card text-center p-4 shadow-sm border-0 h-100">
                <div class="service-icon">
                    <img src="https://cdn-icons-png.flaticon.com/512/4128/4128176.png" alt="Bank Transfer">
                </div>
                <h4 class="text-primary fw-bold">Bank Transfer</h4>
                <p class="text-muted">Send money to any bank account instantly and securely with just a few clicks.</p>
                <a href="BankTransfer.jsp" class="btn btn-warning fw-bold">Send</a>
            </div>
        </div>

        <!-- Scan and Pay -->
        <div class="col-md-5">
            <div class="card text-center p-4 shadow-sm border-0 h-100">
                <div class="service-icon">
                    <img src="https://cdn-icons-png.flaticon.com/512/10471/10471389.png" alt="Scan and Pay">
                </div>
                <h4 class="text-primary fw-bold">Scan and Pay</h4>
                <p class="text-muted">Use QR codes to make quick payments directly from your wallet or account.</p>
                <a href="#" class="btn btn-warning fw-bold">Send</a>
            </div>
        </div>
    </div>

    <!-- Why Us -->
    <div class="row justify-content-center text-center mb-5">
        <div class="col-md-10">
            <h4 class="text-primary fw-bold mb-3">Why Choose Paytm Clone?</h4>
            <p class="text-muted">Experience seamless, real-time payments with our secure and trusted platform — built to empower modern digital finance.</p>
        </div>
    </div>

    <!-- FAQ Section -->
    <div class="row justify-content-center">
        <div class="col-md-10">
            <h4 class="text-primary text-center mb-4 fw-bold">Frequently Asked Questions</h4>
            <div class="accordion" id="faqAccordion">
                <!-- Q1 -->
                <div class="accordion-item">
                    <h2 class="accordion-header" id="headingOne">
                        <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#faq1" aria-expanded="true">
                            Is Paytm Clone secure for transactions?
                        </button>
                    </h2>
                    <div id="faq1" class="accordion-collapse collapse show" data-bs-parent="#faqAccordion">
                        <div class="accordion-body">
                            Yes, our platform uses top-level encryption to keep your financial data safe and secure.
                        </div>
                    </div>
                </div>
                <!-- Q2 -->
                <div class="accordion-item">
                    <h2 class="accordion-header" id="headingTwo">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#faq2">
                            How fast are bank transfers?
                        </button>
                    </h2>
                    <div id="faq2" class="accordion-collapse collapse" data-bs-parent="#faqAccordion">
                        <div class="accordion-body">
                            All transfers are completed in real-time using our integrated banking network.
                        </div>
                    </div>
                </div>
                <!-- Q3 -->
                <div class="accordion-item">
                    <h2 class="accordion-header" id="headingThree">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#faq3">
                            Do I need an account to scan and pay?
                        </button>
                    </h2>
                    <div id="faq3" class="accordion-collapse collapse" data-bs-parent="#faqAccordion">
                        <div class="accordion-body">
                            No, just open the app, scan any valid QR code, and pay without hassle.
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>

<!-- Footer -->
<footer class="bg-info text-white py-4 mt-auto">
    <div class="container text-center">
        <p class="mb-0">© 2025 Paytm Clone. All rights reserved.</p>
    </div>
</footer>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
