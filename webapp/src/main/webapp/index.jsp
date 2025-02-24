<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>DevOps Learning Registration</title>

    <!-- Bootstrap CDN -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    
    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">

    <!-- Custom CSS -->
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(to right, #6a11cb, #2575fc);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        
        .card {
            width: 40%;
            padding: 20px;
            background: #fff;
            border-radius: 15px;
            box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.2);
            animation: fadeIn 1s ease-in-out;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .form-control {
            border-radius: 10px;
            padding: 12px;
        }

        .btn-custom {
            background: #2575fc;
            color: #fff;
            border-radius: 10px;
            padding: 12px;
            font-weight: bold;
            transition: 0.3s;
        }

        .btn-custom:hover {
            background: #6a11cb;
            transform: scale(1.05);
        }

        .signin {
            text-align: center;
            margin-top: 15px;
        }

        a {
            color: #2575fc;
            font-weight: bold;
        }

        h1 {
            text-align: center;
            font-weight: bold;
            color: #333;
        }
    </style>
</head>
<body>

<div class="card">
    <h1>Register for DevOps Learning</h1>
    <p class="text-center">Fill in the form to create an account.</p>
    <hr>

    <form action="registerServlet" method="post">
        <div class="mb-3">
            <label for="Name" class="form-label"><b>Enter Name</b></label>
            <input type="text" class="form-control" placeholder="Enter Full Name" name="Name" id="Name" required>
        </div>

        <div class="mb-3">
            <label for="mobile" class="form-label"><b>Enter Mobile</b></label>
            <input type="tel" class="form-control" placeholder="Enter Mobile Number" name="mobile" id="mobile" pattern="[0-9]{10}" required>
        </div>

        <div class="mb-3">
            <label for="email" class="form-label"><b>Enter Email</b></label>
            <input type="email" class="form-control" placeholder="Enter Email" name="email" id="email" required>
        </div>

        <div class="mb-3">
            <label for="psw" class="form-label"><b>Password</b></label>
            <input type="password" class="form-control" placeholder="Enter Password" name="psw" id="psw" minlength="8" required>
        </div>

        <div class="mb-3">
            <label for="psw-repeat" class="form-label"><b>Repeat Password</b></label>
            <input type="password" class="form-control" placeholder="Repeat Password" name="psw-repeat" id="psw-repeat" minlength="8" required>
        </div>

        <hr>
        <p>By creating an account you agree to our <a href="#">Terms & Privacy</a>.</p>

        <button type="submit" class="btn btn-custom w-100">Register</button>
    </form>

    <div class="signin">
        <p>Already have an account? <a href="#">Sign in</a>.</p>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
