<%@ page session="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Failed</title>
    <style>
        /* Base Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            /* Wahi smooth premium gradient background */
            background: linear-gradient(135deg, #e4ecfa 0%, #f4f7f6 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }

        /* Error Container Card */
        .error-card {
            background: #ffffff;
            width: 100%;
            max-width: 450px;
            padding: 40px 30px;
            border-radius: 16px;
            box-shadow: 0 10px 25px rgba(220, 38, 38, 0.08); /* Light reddish shadow for error */
            border: 1px solid rgba(220, 38, 38, 0.1);
            text-align: center;
        }

        /* Modern Warning Icon Concept using pure CSS */
        .error-icon {
            width: 64px;
            height: 64px;
            background-color: #fee2e2; /* Soft red background */
            color: #dc2626; /* Deep crimson red */
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 2rem;
            font-weight: bold;
            margin: 0 auto 24px auto;
        }

        h1 {
            color: #1e293b; /* Clean Dark Slate */
            font-size: 1.5rem;
            font-weight: 700;
            line-height: 1.4;
            margin-bottom: 12px;
        }

        p {
            color: #64748b;
            font-size: 0.95rem;
            margin-bottom: 30px;
        }

        /* Back to Login Button matching your main theme */
        .btn-back {
            display: inline-block;
            width: 100%;
            padding: 14px;
            background-color: #00838f; /* Royal Blue */
            color: white;
            text-decoration: none;
            border-radius: 8px;
            font-size: 1rem;
            font-weight: 600;
            transition: all 0.3s ease;
            box-shadow: 0 4px 6px rgba(30, 64, 175, 0.15);
        }

        .btn-back:hover {
            background-color: #006064;/* Electric Blue hover */
            transform: translateY(-1px);
            box-shadow: 0 6px 12px rgba(30, 64, 175, 0.25);
        }
    </style>
</head>
<body>

    <div class="error-card">
        <!-- Pure CSS Warning/Exclamation Mark Icon -->
        <div class="error-icon">!</div>

        <!-- Heading Text -->
        <h1>Login Failed</h1>
        
        <!-- Detailed Subtext -->
        <p>You entered a wrong Username or Password. Please check your details and try again.</p>

        <!-- Main Button Redirecting to Login -->
        <a href="front.jsp" class="btn-back">Go To Login Page</a>
    </div>

</body>
</html>