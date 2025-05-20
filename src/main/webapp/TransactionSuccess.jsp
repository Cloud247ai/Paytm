<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Transaction Success - Paytm Clone</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap + Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">

    <style>
        html, body {
            height: 100%;
        }
        body {
            margin: 0;
            display: flex;
            flex-direction: column;
            background-color: #f1f9ff;
            font-family: 'Segoe UI', sans-serif;
        }
        main {
            flex: 1;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 2rem;
            position: relative;
            overflow: hidden;
        }

        .success-box {
            background: #ffffff;
            padding: 2rem;
            border-radius: 20px;
            text-align: center;
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 600px;
            animation: zoomFade 0.8s ease;
            z-index: 2;
        }

        .success-animation img {
            width: 120px;
            height: 120px;
            animation: popIn 0.8s ease-in-out;
        }

        .success-box h3 {
            color: #28a745;
            font-weight: bold;
            margin-top: 20px;
            opacity: 0;
            animation: fadeIn 0.5s ease forwards;
            animation-delay: 0.8s;
        }

        .success-box .amount,
        .success-box .details,
        .success-box .btn-group {
            opacity: 0;
            animation: fadeIn 0.5s ease forwards;
        }

        .amount {
            margin: 15px 0;
            font-size: 1.4rem;
            color: #444;
            animation-delay: 1.2s;
        }

        .details {
            text-align: left;
            color: #666;
            margin-top: 10px;
            padding: 0 1rem;
            animation-delay: 1.6s;
        }

        .btn-group {
            margin-top: 25px;
            animation-delay: 2s;
        }

        footer {
            background-color: #17a2b8;
            color: white;
            padding: 12px 0;
            text-align: center;
        }

        @keyframes zoomFade {
            from { opacity: 0; transform: scale(0.8); }
            to { opacity: 1; transform: scale(1); }
        }

        @keyframes popIn {
            from { transform: scale(0); opacity: 0; }
            to { transform: scale(1); opacity: 1; }
        }

        @keyframes fadeIn {
            to { opacity: 1; }
        }

        canvas.confetti-canvas {
            position: absolute;
            top: 0;
            left: 0;
            pointer-events: none;
            z-index: 1;
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

<!-- Main Content -->
<main>
    <!-- Confetti Canvas -->
    <canvas class="confetti-canvas" id="confettiCanvas"></canvas>

    <div class="success-box">
        <!-- Animation -->
        <div class="success-animation">
            <img src="https://cdn-icons-png.flaticon.com/512/845/845646.png" alt="Success">
        </div>

        <!-- Title -->
        <h3>Transaction Completed Successfully</h3>

        <!-- Amount -->
        <div class="amount">
            ₹<strong><%= request.getAttribute("amount") %></strong> transferred
        </div>

        <!-- Details -->
        <div class="details">
            <p><strong>From Account:</strong> <%= request.getAttribute("sender") %></p>
            <p><strong>To Account:</strong> <%= request.getAttribute("receiver") %></p>
        </div>

        <!-- Buttons -->
        <div class="btn-group d-flex justify-content-center gap-3">
            <a href="getstarted.jsp" class="btn btn-outline-primary px-4">
                <i class="bi bi-arrow-clockwise"></i> New Transaction
            </a>
            <a href="accessaccount.jsp" class="btn btn-outline-success px-4">
                <i class="bi bi-person-lines-fill"></i> View My Account
            </a>
        </div>
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

<!-- Confetti JS (via CDN) -->
<script src="https://cdn.jsdelivr.net/npm/canvas-confetti@1.6.0/dist/confetti.browser.min.js"></script>
<script>
    // Trigger confetti once DOM loads
    window.addEventListener("load", () => {
        const duration = 2 * 1000;
        const animationEnd = Date.now() + duration;
        const defaults = { startVelocity: 25, spread: 360, ticks: 60, zIndex: 0 };

        const interval = setInterval(function () {
            const timeLeft = animationEnd - Date.now();

            if (timeLeft <= 0) {
                return clearInterval(interval);
            }

            const particleCount = 50 * (timeLeft / duration);
            confetti(Object.assign({}, defaults, {
                particleCount,
                origin: { x: Math.random(), y: Math.random() - 0.2 }
            }));
        }, 250);
    });
</script>

<!-- Payment Sound -->
<audio id="successSound" autoplay>
    <source src="assets/paytm_payment_tune.mp3" type="audio/mpeg">
</audio>
<script>
    const sound = document.getElementById("successSound");
    sound.play().catch(() => {
        document.body.addEventListener("click", () => sound.play(), { once: true });
    });
</script>

</body>
</html>
