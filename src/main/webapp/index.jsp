<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Paytm Clone</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        html {
            scroll-behavior: smooth;
        }

        .effect {
            transition: all 0.3s ease;
        }

        .effect:hover {
            transform: translateY(-3px);
            cursor: pointer;
            box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.1);
        }

        .section {
            padding: 80px 0;
        }

        .bg-lightblue {
            background-color: #e6f7ff;
        }

        .btn-custom {
            background-color: #00baf2;
            color: white;
            border-radius: 25px;
        }

        .btn-custom:hover {
            background-color: #0079a5;
        }

        .rounded-icon {
            width: 60px;
            height: 60px;
            border-radius: 50%;
            background: #e0f7ff;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 15px;
        }
        
        .card, .shadow-sm {
  transition: transform 0.3s ease, box-shadow 0.3s ease;
}
.card:hover, .shadow-sm:hover {
  transform: translateY(-5px);
  box-shadow: 0 1rem 2rem rgba(0,0,0,0.1);
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
                    <li class="nav-item"><a class="nav-link text-white" href="#home">Home</a></li>
                    <li class="nav-item"><a class="nav-link text-white" href="#services">Services</a></li>
                    <li class="nav-item"><a class="nav-link text-white" href="#payments">Payments</a></li>
                    <li class="nav-item"><a class="nav-link text-white" href="#offers">Offers</a></li>
                    <li class="nav-item"><a class="nav-link text-white" href="#contact">Contact</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Hero Section -->
<section id="home" class="section bg-light d-flex align-items-center" style="min-height: 100vh;">
  <div class="container">
    <div class="row align-items-center justify-content-between">

      <!-- Left Content -->
      <div class="col-lg-6 mb-5 mb-lg-0 text-center text-lg-start">
        <h1 class="display-4 fw-bold mb-3">
          <span class="text-primary">Fast & Secure</span> Digital Payments <br>
          <small class="text-dark">at Your Fingertips</small>
        </h1>
        <p class="lead text-muted mb-4">
          Recharge, transfer money, and pay bills in seconds — all within a single, secure mobile app.
        </p>
        <div class="d-flex flex-column flex-md-row align-items-center gap-3">
          <a href="getstarted.jsp" class="btn btn-primary btn-lg px-4 py-2 d-flex align-items-center">
            <img src="https://cdn-icons-png.flaticon.com/512/942/942748.png" alt="" width="24" class="me-2">
            Get Started
          </a>
          <a href="#contact" class="btn btn-outline-dark btn-lg px-4 py-2 d-flex align-items-center">
            <i class="bi bi-chat-left-text me-2"></i> Contact Us
          </a>
        </div>
      </div>

      <!-- Right Image Content -->
      <div class="col-lg-5 text-center">
        <div class="position-relative">
          <img src="./assets/upi.webp" alt="App Preview"
               class="img-fluid rounded shadow-lg" style="max-height: 450px; border-radius: 2rem;">
          <span class="badge bg-success position-absolute top-0 start-0 m-3 p-2 px-3 rounded-pill shadow-sm">
            🔒 UPI Secured
          </span>
        </div>
      </div>

    </div>
  </div>
</section>



    <!-- Services -->
<section id="services" class="py-5" style="background-color: #f0faff;">
  <div class="container">
    <div class="text-center mb-5">
      <h2 class="display-5 fw-bold text-dark">What We Offer</h2>
      <p class="text-muted">Our top features to power your digital payments journey</p>
    </div>

    <div class="row g-4">
      <div class="col-md-4">
        <div class="card border-0 rounded-4 shadow-sm p-4 h-100">
          <div class="icon-box mb-4 mx-auto" style="background: linear-gradient(135deg, #c2f0ff, #a3e6ff); width: 70px; height: 70px; border-radius: 50%; display: flex; align-items: center; justify-content: center;">
            <img src="https://payveda.com/kcfinder/upload/images/3014BankitRechargeImage.png" width="50px" height="50px" alt="Recharge">
          </div>
          <h5 class="fw-bold text-center">Mobile Recharge</h5>
          <p class="text-muted text-center">Top-up any mobile instantly with smooth and secure payments.</p>
        </div>
      </div>

      <div class="col-md-4">
        <div class="card border-0 rounded-4 shadow-sm p-4 h-100">
          <div class="icon-box mb-4 mx-auto" style="background: linear-gradient(135deg, #d1f3ff, #b2ebf2); width: 70px; height: 70px; border-radius: 50%; display: flex; align-items: center; justify-content: center;">
            <img src="https://blogassets.airtel.in/wp-content/uploads/2022/01/What-are-the-types-of-Utility-Bill.jpg" width="50px" height="50px" alt="Bill Pay">
          </div>
          <h5 class="fw-bold text-center">Bill Payments</h5>
          <p class="text-muted text-center">Pay your bills instantly with multi-service integration.</p>
        </div>
      </div>

      <div class="col-md-4">
        <div class="card border-0 rounded-4 shadow-sm p-4 h-100">
          <div class="icon-box mb-4 mx-auto" style="background: linear-gradient(135deg, #c5f7e7, #a3f3d2); width: 70px; height: 70px; border-radius: 50%; display: flex; align-items: center; justify-content: center;">
            <img src="https://cdn-icons-png.flaticon.com/128/1034/1034141.png" width="36" alt="Money Transfer">
          </div>
          <h5 class="fw-bold text-center">Money Transfer</h5>
          <p class="text-muted text-center">Transfer funds to any bank securely and in real time.</p>
        </div>
      </div>
    </div>
  </div>
</section>


   <!-- Payments -->
<section id="payments" class="py-5" style="background-color: #ffffff;">
  <div class="container">
    <div class="text-center mb-5">
      <h2 class="display-5 fw-bold text-dark">Payments Made Simple</h2>
      <p class="lead text-muted">QR, UPI, wallet or bank – choose your way to pay instantly and securely.</p>
    </div>

    <div class="row g-4 text-center">
      <div class="col-md-4">
        <div class="p-4 bg-light rounded-4 shadow-sm h-100">
          <img src="https://m.economictimes.com/thumb/msid-74960608,width-1200,height-900,resizemode-4,imgsize-49172/upi-twitter.jpg" width="60" class="mb-3" alt="UPI">
          <h6 class="fw-bold">Pay with UPI</h6>
          <p class="text-muted small">Send/receive funds securely using UPI addresses.</p>
        </div>
      </div>

      <div class="col-md-4">
        <div class="p-4 bg-light rounded-4 shadow-sm h-100">
          <img src="https://offercdn.paytm.com/blog/2022/02/scan/scan-banner.png" width="60" class="mb-3" alt="QR">
          <h6 class="fw-bold">Scan & Pay</h6>
          <p class="text-muted small">Scan merchant or user QR codes for fast payments.</p>
        </div>
      </div>

      <div class="col-md-4">
        <div class="p-4 bg-light rounded-4 shadow-sm h-100">
          <img src="https://m.economictimes.com/thumb/msid-57371236,width-1200,height-900,resizemode-4,imgsize-9448/paytm-wallet-reaches-200-million-users.jpg" width="60" class="mb-3" alt="Wallet">
          <h6 class="fw-bold">Paytm Wallet</h6>
          <p class="text-muted small">Use wallet balance anywhere — online and offline.</p>
        </div>
      </div>
    </div>
  </div>
</section>


<!-- Offers -->
<section id="offers" class="py-5" style="background: linear-gradient(to right, #f5fcff, #e2faff);">
  <div class="container">
    <div class="text-center mb-5">
      <h2 class="display-5 fw-bold text-dark">Exclusive Offers</h2>
      <p class="lead text-muted">Get more with every payment — cashback, rewards, and referrals.</p>
    </div>

    <div class="row g-4 align-items-stretch">
      <div class="col-md-4">
        <div class="bg-white p-4 rounded-4 shadow-sm h-100 text-center">
          <img src="https://cdn-icons-png.flaticon.com/128/2921/2921823.png" width="60" class="mb-3" alt="Cashback">
          <h6 class="fw-bold">Cashback Deals</h6>
          <p class="text-muted small">Earn instant cashback on everyday transactions.</p>
        </div>
      </div>

      <div class="col-md-4">
        <div class="bg-white p-4 rounded-4 shadow-sm h-100 text-center">
          <img src="https://cdn-icons-png.flaticon.com/128/9901/9901094.png" width="60" class="mb-3" alt="Referral">
          <h6 class="fw-bold">Refer & Earn</h6>
          <p class="text-muted small">Get rewards when you invite friends to join and use the app.</p>
        </div>
      </div>

      <div class="col-md-4">
        <div class="bg-white p-4 rounded-4 shadow-sm h-100 text-center">
          <img src="https://cdn-icons-png.flaticon.com/128/2972/2972552.png" width="60" class="mb-3" alt="Promo Codes">
          <h6 class="fw-bold">Promo Codes</h6>
          <p class="text-muted small">Apply promo codes for special discounts & cashback.</p>
        </div>
      </div>
    </div>
  </div>
</section>


    <!-- Contact -->
<!-- Contact -->
<section id="contact" class="section bg-light">
  <div class="container">
    <h2 class="fw-bold mb-3 text-center display-6">Need Help? Contact Us</h2>
    <p class="lead text-muted text-center">We're based in Hyderabad – reach us anytime for support or queries.</p>

    <div class="row mt-4 align-items-stretch">
      <!-- Contact Details -->
      <div class="col-md-6 mb-4">
        <div class="bg-white p-4 rounded-4 shadow-sm h-100">
          <h5 class="fw-semibold mb-3">Get in Touch</h5>
          <p><strong>Email:</strong> <a href="mailto:support@paytmclone.com" class="text-decoration-none text-info">support@paytmclone.com</a></p>
          <p><strong>Phone:</strong> <a href="tel:+911800000000" class="text-decoration-none text-info">1800-000-000</a></p>
          <p><strong>Location:</strong> Madhapur, Hyderabad, India</p>
          <a href="mailto:support@paytmclone.com" class="btn btn-custom px-4 py-2 mt-3">Email Support</a>
        </div>
      </div>

      <!-- Embedded Map -->
      <div class="col-md-6 mb-4">
        <div class="rounded-4 overflow-hidden shadow-sm h-100">
          <iframe
            src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3806.265476620787!2d78.3870623751203!3d17.444065102131378!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3bcb93f8494033ed%3A0x8ed5dcf2171d7a2b!2sMadhapur%2C%20Hyderabad%2C%20Telangana!5e0!3m2!1sen!2sin!4v1681190501874!5m2!1sen!2sin"
            width="100%" height="100%" style="border:0; min-height: 300px;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade">
          </iframe>
        </div>
      </div>
    </div>
  </div>
</section>



    <!-- Footer -->
    <footer class="bg-info text-white py-4">
        <div class="container text-center">
            <p class="mb-0">© 2025 Paytm Clone. All rights reserved.</p>
        </div>
    </footer>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
