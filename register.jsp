<%@ page session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>REGISTRATION - ShailKing</title>
    <style>
        /* Modern Reset & Smooth Background Gradient */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        body {
            background: radial-gradient(circle at top left, #feeda2, #efeff4);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }

        /* Continuous Scrolling Header (Replacement for legacy marquee) */
        .marquee-container {
            width: 100%;
            max-width: 850px;
            position: absolute;
            top: 40px;
            text-align: center;
        }
        .marquee-text {
            font-size: 2.2rem;
            color: #b20202;
            font-weight: 800;
            text-transform: uppercase;
            letter-spacing: 2px;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.05);
            margin-bottom: 10px;
        }
        .line-divider {
            width: 60%;
            height: 4px;
            background: linear-gradient(to right, transparent, #ba0d07, transparent);
            margin: 0 auto;
            border: none;
            border-radius: 2px;
        }

        /* Glassmorphism Premium Card Layout */
        .register-card {
            background: #ffffff;
            width: 100%;
            max-width: 780px;
            border-radius: 24px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.08);
            border: 1px solid rgba(226, 232, 240, 0.8);
            display: flex;
            overflow: hidden;
            margin-top: 100px;
        }

        /* Left Side Brand/Image Panel */
        .image-panel {
            background: #00838f;
            width: 40%;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            padding: 30px;
            position: relative;
        }
        .image-panel img {
            width: 130px;
            height: 130px;
            object-fit: cover;
            border-radius: 50%;
            border: 4px solid rgba(255, 255, 255, 0.3);
            box-shadow: 0 8px 20px rgba(0,0,0,0.15);
            background-color: #fff;
        }
        .image-panel h3 {
            color: #ffffff;
            margin-top: 20px;
            font-size: 1.3rem;
            font-weight: 600;
            text-align: center;
            letter-spacing: 1px;
        }

        /* Right Side Form Panel */
        .form-panel {
            width: 60%;
            padding: 45px 40px;
            background: #ffffff;
        }
        .form-title {
            color: #00838f;
            font-size: 1.6rem;
            font-weight: 700;
            margin-bottom: 8px;
            text-transform: uppercase;
        }
        .form-subtitle {
            color: #64748b;
            font-size: 0.9rem;
            margin-bottom: 30px;
        }

        /* Input Styles */
        .input-group {
            margin-bottom: 22px;
            position: relative;
        }
        .input-group label {
            display: block;
            color: #334155;
            font-weight: 600;
            font-size: 0.9rem;
            margin-bottom: 8px;
        }
        .input-group input {
            width: 100%;
            padding: 12px 16px;
            border: 1.5px solid #cbd5e1;
            border-radius: 10px;
            font-size: 1rem;
            color: #1e293b;
            transition: all 0.3s ease;
            background: #f8fafc;
        }
        .input-group input:focus {
            outline: none;
            border-color: #00838f;
            background: #ffffff;
            box-shadow: 0 0 0 4px rgba(0, 131, 143, 0.15);
        }

        /* Modern Button Row */
        .btn-row {
            display: flex;
            gap: 15px;
            margin-top: 30px;
            margin-bottom: 25px;
        }
        .btn {
            flex: 1;
            padding: 12px 20px;
            font-size: 1rem;
            font-weight: 600;
            border-radius: 50px;
            cursor: pointer;
            transition: all 0.2s ease;
            border: none;
        }
        .btn-submit {
            background: #00838f;
            color: #ffffff;
            box-shadow: 0 4px 12px rgba(0, 131, 143, 0.2);
        }
        .btn-submit:hover {
            background: #006064;
            transform: translateY(-1px);
        }
        .btn-reset {
            background: #f1f5f9;
            color: #475569;
            border: 1px solid #cbd5e1;
        }
        .btn-reset:hover {
            background: #e2e8f0;
        }

        /* Footer Link */
        .footer-link {
            text-align: center;
            display: block;
            margin-top: 15px;
            color: #00838f;
            text-decoration: none;
            font-weight: 600;
            font-size: 0.95rem;
            transition: color 0.2s;
        }
        .footer-link:hover {
            color: #b20202;
            text-decoration: underline;
        }
    </style>
    
    <script type="text/javascript">
        function validate() {
            var userId = document.forms["regForm"]["userid"].value;
            var password = document.forms["regForm"]["pass"].value;
            
            if (userId.trim() == "") {
                alert("Please enter a User ID.");
                document.forms["regForm"]["userid"].focus();
                event.preventDefault();
                return false;
            }
            if (password.trim() == "") {
                alert("Please enter a Password.");
                document.forms["regForm"]["pass"].focus();
                event.preventDefault();
                return false;
            }
            return true;
        }
    </script>
</head>
<body>

<div class="marquee-container">
    <div class="marquee-text">Welcome to ShailKing</div>
    <hr class="line-divider">
</div>

<div class="register-card">
    <div class="image-panel">
        <img src="images/login.jpg" alt="Login Icon" onerror="this.src='https://cdn-icons-png.flaticon.com/512/5087/5087579.png';">
        <h3>Secure Dashboard</h3>
    </div>

    <div class="form-panel">
        <h2 class="form-title">Registration Form</h2>
        <p class="form-subtitle">Enter your credential details to set up your account</p>
        
        <form name="regForm" method="POST" action="RegisterData.jsp" onSubmit="return validate()">
            <div class="input-group">
                <label for="userid">Enter User ID:</label>
                <input type="text" id="userid" name="userid" placeholder="e.g. JSP1234">
            </div>
            
            <div class="input-group">
                <label for="pass">Enter Password:</label>
                <input type="password" id="pass" name="pass" placeholder="12345678">
            </div>
            
            <div class="btn-row">
                <input type="submit" name="Submit" value="Registered" class="btn btn-submit">
                <input type="reset" name="Reset" value="Reset" class="btn btn-reset">
            </div>
            
            <a href="Login1.jsp" class="footer-link">Already Registered? Login now</a>
        </form>
    </div>
</div>

</body>
</html>















