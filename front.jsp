<%@ page session="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome to ShailKing</title>
    <style>
        /* Reset and Base Styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
        background: radial-gradient(circle at top left, #feeda2 0%, #efeff4 100%);
        min-height: 100vh;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: space-between;
        padding: 20px;
        color: #2c3e50;
        }

        /* Header Section */
        header {
            text-align: center;
            margin-bottom: 30px;
        }

h1 {
    font-family: 'Playfair Display', 'Georgia', serif;
    font-size: 4rem;
    font-weight: 700;
    color: #00838f; /* Classic Metallic Gold */
    letter-spacing: 6px;
    margin-bottom: 15px;
    /* Soft premium text shadow */
    text-shadow: 1px 1px 0px #fff, 2px 2px 0px #9a7b43, 4px 4px 8px rgba(0,0,0,0.15);
}

.subtitle {
    font-size: 1.1rem;
    color: #ffffff;
    background: #00838f; /* Deep Emerald Green */
    font-weight: 600;
    letter-spacing: 2px;
    text-transform: uppercase;
    padding: 8px 24px;
    border-radius: 50px;
    box-shadow: 0 4px 15px rgba(15, 81, 50, 0.2);
    border: 2px solid #ffdf7e; /* Elegant Pale Gold Border */
}

        .subtitle::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 25%;
            width: 50%;
            height: 3px;
            background-color: #00838f;
            border-radius: 2px;
        }

        /* Main Content Container (Replacing Old Table) */
        .main-container {
            background: white;
            border-radius: 16px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            display: flex;
            flex-wrap: wrap;
            max-width: 1100px;
            width: 100%;
            overflow: hidden;
            margin-bottom: 40px;
        }

        .side-image-pane {
            flex: 1 1 350px;
            overflow: hidden;
            display: flex;
            align-items: center;
            justify-content: center;
            background: #f5f5f5;
        }

        .side-image-pane img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.5s ease;
        }

        .side-image-pane:hover img {
            transform: scale(1.05);
        }

        /* Login/Register Center Panel */
        .auth-panel {
            flex: 1 1 300px;
            padding: 40px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            background: #ffffff;
            border-left: 1px solid #eee;
            border-right: 1px solid #eee;
            text-align: center;
        }

       .auth-panel p {
       font-size: 1.1rem;
       color: #374151;
       margin-bottom: 25px;
       font-weight: 600;
       letter-spacing: 0.5px;
       }

        .btn {
            display: inline-block;
            width: 100%;
            max-width: 250px;
            padding: 12px 24px;
            margin-bottom: 15px;
            font-size: 1rem;
            font-weight: 600;
            text-decoration: none;
            border-radius: 8px;
            transition: all 0.3s ease;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        }

        .btn-login {
         background-color: #00838f;
         color: white;
        }

        .btn-login:hover {
         background-color: #006064; /* Darker Teal on hover */
         transform: translateY(-2px);
         box-shadow: 0 6px 12px rgba(0, 131, 143, 0.3);
         }

       .btn-register {
        background-color: transparent;
        color: #00838f; /* Matching Teal border & text */
        border: 2px solid #00838f;
        }

        .btn-register:hover {
         background-color: #00838f;
         color: white;
         transform: translateY(-2px);
         box-shadow: 0 6px 12px rgba(0, 131, 143, 0.2);
         }

        /* Slider / Marquee Alternative (Smooth CSS Animation) */
        .slider-wrapper {
            width: 100%;
            max-width: 1100px;
            overflow: hidden;
            background: rgba(255, 255, 255, 0.6);
            padding: 15px 0;
            border-radius: 12px;
            box-shadow: inset 0 2px 5px rgba(0,0,0,0.05);
        }

        .image-track {
            display: flex;
            width: max-content;
            animation: scroll 20s linear infinite;
        }

        .image-track img {
            width: 150px;
            height: 120px;
            object-fit: cover;
            margin: 0 15px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }

        @keyframes scroll {
            0% { transform: translateX(0); }
            100% { transform: translateX(-50%); } /* Works best when images repeat, but for simple loop this is clean */
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .main-container {
                flex-direction: column;
            }
            .side-image-pane {
                height: 200px;
            }
            .auth-panel {
                border: none;
                padding: 30px 20px;
            }
            h1 {
                font-size: 2.5rem;
            }
        }
    </style>
</head>
<body>

    <!-- Header Section -->
    <header>
        <h1>ShailKing</h1>
        <div class="subtitle">Shop Like A King</div>
    </header>

    <!-- Main Content Container -->
    <main class="main-container">
        <!-- Left Image -->
        <div class="side-image-pane">
            <img src="images/1.jpg" alt="Shopping Category Left">
        </div>

        <!-- Center Login Options -->
        <section class="auth-panel">
            <p>Select One To Go To Login</p>
            <a href="Login.jsp" class="btn btn-login">User Login</a>
            <a href="register.jsp" class="btn btn-register">New User Register</a>
        </section>

        <!-- Right Image -->
        <div class="side-image-pane">
            <img src="images/2.jpg" alt="Shopping Category Right">
        </div>
    </main>

    <!-- Bottom Image Slider -->
    <footer class="slider-wrapper">
        <div class="image-track">
            <img src="images/3.jpg" alt="Product 3">
            <img src="images/4.jpg" alt="Product 4">
            <img src="images/5.jpg" alt="Product 5">
            <img src="images/6.jpg" alt="Product 6">
            <img src="images/7.jpg" alt="Product 7">
            <!-- Infinite loop effect ke liye images ko repeat kiya hai -->
            <img src="images/3.jpg" alt="Product 3">
            <img src="images/4.jpg" alt="Product 4">
            <img src="images/5.jpg" alt="Product 5">
            <img src="images/6.jpg" alt="Product 6">
            <img src="images/7.jpg" alt="Product 7">
        </div>
    </footer>

</body>
</html>