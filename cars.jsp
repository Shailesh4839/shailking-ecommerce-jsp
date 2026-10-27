<%@ page session="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% 
    // Sabse pehle session check upar hi kar lenge taaki niche koi curly brace ka jhanjhat na rahe
    HttpSession currentSession = request.getSession(false); 
    if(currentSession == null) { 
%>
        <jsp:forward page="front.jsp"/>
<% 
        return; // Forward karne ke baad aage ka page execute na ho
    } 
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Online CAR Shop - ShailKing</title>
    
    <style>
                /* Base Styling - Premium Dashboard Theme */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background: radial-gradient(circle at top left, #feeda2 0%, #efeff4 100%);
            min-height: 100vh;
            color: #2c3e50;
            padding-bottom: 60px;
        }

        .wrap {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
        }

        /* Modern Masthead / Header */
        header {
            text-align: center;
            padding: 30px 20px;
        }

        .head-line {
            display: inline-block;
            font-size: 1.4rem;
            color: #ffffff;
            background: #00838f; /* Brand Teal Color */
            font-weight: 600;
            letter-spacing: 1px;
            text-transform: uppercase;
            padding: 10px 30px;
            border-radius: 50px;
            box-shadow: 0 4px 15px rgba(0, 131, 143, 0.2);
            border: 2px solid #ffdf7e;
        }

        /* Main E-commerce Grid Layout */
        .main-content {
            margin-top: 30px;
        }

        .main-content ul {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(260px, 1fr));
            gap: 25px;
            list-style: none;
        }

        /* Premium Product Card Design */
        .main-content ul li {
            background: #ffffff;
            border-radius: 16px;
            padding: 20px;
            text-align: center;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
            border: 1px solid #e2e8f0;
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            align-items: center;
        }

        .main-content ul li:hover {
            transform: translateY(-6px);
            box-shadow: 0 12px 25px rgba(0, 131, 143, 0.15);
            border-color: #00838f;
        }

        /* Product Images styling */
        .main-content ul li img {
            max-width: 100%;
            height: 160px;
            object-fit: contain;
            margin-bottom: 15px;
            transition: transform 0.3s ease;
        }

        .main-content ul li:hover img {
            transform: scale(1.05);
        }

        /* Product Info Wrapper */
        .product-info {
            margin-bottom: 15px;
            width: 100%;
        }

        /* Title & Price Styling */
        .product-name {
            font-size: 1.15rem;
            font-weight: 700;
            color: #1e293b;
            margin-bottom: 6px;
            display: block;
        }

        .product-price {
            font-size: 1.1rem;
            font-weight: 600;
            color: #00838f;
            display: block;
        }

        /* Custom Checkbox Container */
        .cart-option {
            background: #f1f5f9;
            padding: 8px 16px;
            border-radius: 30px;
            display: flex;
            align-items: center;
            gap: 8px;
            cursor: pointer;
            transition: all 0.2s ease;
            user-select: none;
            border: 1px solid #cbd5e1;
            width: 100%;
            justify-content: center;
        }

        .cart-option input[type="checkbox"] {
            width: 16px;
            height: 16px;
            accent-color: #00838f;
            cursor: pointer;
        }

        .cart-option label {
            font-size: 0.9rem;
            font-weight: 600;
            color: #475569;
            cursor: pointer;
        }

        .cart-option:hover {
            background: rgba(0, 131, 143, 0.1);
            border-color: #00838f;
        }

        /* Tick selection dynamic styling */
        .main-content ul li:has(input[type="checkbox"]:checked) {
            border-color: #00838f;
            background-color: #e0f2f1; /* Premium light green highlight */
            box-shadow: 0 12px 25px rgba(0, 131, 143, 0.2);
        }

        .main-content ul li:has(input[type="checkbox"]:checked) .cart-option {
            background: #00838f;
            border-color: #00838f;
        }

        .main-content ul li:has(input[type="checkbox"]:checked) .cart-option label {
            color: #ffffff;
        }

        /* Submit Button Section */
        .sbutton {
            text-align: center;
            margin-top: 40px;
        }

        .submitbtn {
            background-color: #00838f;
            color: #ffffff;
            font-size: 1.1rem;
            font-weight: 600;
            padding: 14px 40px;
            border: none;
            border-radius: 50px;
            cursor: pointer;
            box-shadow: 0 4px 15px rgba(0, 131, 143, 0.2);
            transition: all 0.3s ease;
        }

        .submitbtn:hover {
            background-color: #006064;
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(0, 131, 143, 0.3);
        }

        /* Footer Style */
        footer {
            margin-top: 60px;
            text-align: center;
            padding: 20px;
            border-top: 1px solid rgba(0, 131, 143, 0.1);
        }

        .copyrightstatment {
            font-size: 0.9rem;
            color: #64748b;
            font-weight: 500;
        }
    </style>
</head>
<body>

    <header>
        <div class="masthead">
            <div class="wrap">
               <div class="head-line">
                    Welcome to Online CAR Shop
                </div>
            </div>
        </div>         
    </header>

    <div class="wrap">
        <form method="post" action="carss.jsp">
            <div class="main-content">
                <ul>
                    <li>
                        <img src="images/car1.jpg" alt="CAR 1">
                        <div>
                            <span class="product-name">CAR 1</span>
                            <span class="product-price">Price: Rs. 50000</span>
                        </div>
                        <span class="cart-option">
                            <input type="checkbox" name="Cars" id="car1" value="car1"/>
                            <label for="car1">Add To Cart</label>
                            <input type="hidden" name="car1" value="50000"/>
                        </span>
                    </li>

                    <li>
                        <img src="images/car2.jpg" alt="CAR 2">
                        <div>
                            <span class="product-name">CAR 2</span>
                            <span class="product-price">Price: Rs. 99999</span>
                        </div>
                        <span class="cart-option">
                            <input type="checkbox" name="Cars" id="car2" value="car2"/>
                            <label for="car2">Add To Cart</label>
                            <input type="hidden" name="car2" value="99999"/>
                        </span>
                    </li>

                    <li>
                        <img src="images/car3.jpg" alt="CAR 3">
                        <div>
                            <span class="product-name">CAR 3</span>
                            <span class="product-price">Price: Rs. 89990</span>
                        </div>
                        <span class="cart-option">
                            <input type="checkbox" name="Cars" id="car3" value="car3"/>
                            <label for="car3">Add To Cart</label>
                            <input type="hidden" name="car3" value="89990"/>
                        </span>
                    </li>

                    <li>
                        <img src="images/car4.jpg" alt="CAR 4">
                        <div>
                            <span class="product-name">CAR 4</span>
                            <span class="product-price">Price: Rs. 100000</span>
                        </div>
                        <span class="cart-option">
                            <input type="checkbox" name="Cars" id="car4" value="car4"/>
                            <label for="car4">Add To Cart</label>
                            <input type="hidden" name="car4" value="100000"/>
                        </span>
                    </li>

                    <li>
                        <img src="images/car5.jpg" alt="CAR 5">
                        <div>
                            <span class="product-name">CAR 5</span>
                            <span class="product-price">Price: Rs. 89999</span>
                        </div>
                        <span class="cart-option">
                            <input type="checkbox" name="Cars" id="car5" value="car5"/>
                            <label for="car5">Add To Cart</label>
                            <input type="hidden" name="car5" value="89999"/>
                        </span>
                    </li>

                    <li>
                        <img src="images/car6.jpg" alt="CAR 6">
                        <div>
                            <span class="product-name">CAR 6</span>
                            <span class="product-price">Price: Rs. 130000</span>
                        </div>
                        <span class="cart-option">
                            <input type="checkbox" name="Cars" id="car6" value="car6"/>
                            <label for="car6">Add To Cart</label>
                            <input type="hidden" name="car6" value="130000"/>
                        </span>
                    </li>

                    <li>
                        <img src="images/car7.jpg" alt="CAR 7">
                        <div>
                            <span class="product-name">CAR 7</span>
                            <span class="product-price">Price: Rs. 199999</span>
                        </div>
                        <span class="cart-option">
                            <input type="checkbox" name="Cars" id="car7" value="car7"/>
                            <label for="car7">Add To Cart</label>
                            <input type="hidden" name="car7" value="199999"/>
                        </span>
                    </li>

                    <li>
                        <img src="images/car8.jpg" alt="CAR 8">
                        <div>
                            <span class="product-name">CAR 8</span>
                            <span class="product-price">Price: Rs. 999990</span>
                        </div>
                        <span class="cart-option">
                            <input type="checkbox" name="Cars" id="car8" value="car8"/>
                            <label for="car8">Add To Cart</label>
                            <input type="hidden" name="car8" value="999990"/>
                        </span>
                    </li>   
                </ul>
            </div>
            
            <div class="sbutton">
                <button type="submit" class="submitbtn">Add To Cart</button>
            </div>
        </form>
    </div>

    <footer>
        <div class="wrap">          
            <p class="copyrightstatment">
                &copy; 2026 ShailKing Mobile Shopping Center. All Rights Reserved.
            </p>
        </div>
    </footer>

</body>
</html>