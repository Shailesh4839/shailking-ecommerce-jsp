<%@ page session="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %> 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Online Mobile Shop - ShailKing</title>
    
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

<% 
HttpSession currentSession = request.getSession(false); 
if(currentSession != null) { 
%>

    <header>
        <div class="masthead">
            <div class="wrap">
               <div class="head-line">
                    Welcome to Online Mobile Shop
                </div>
            </div>
        </div>         
    </header>

    <div class="wrap">
        <form method="post" action="mobiles.jsp">
            <div class="main-content">
                <ul>
                    <li>
                        <img src="images/nokia_5235.jpg" alt="Nokia 5235">
                        <div>
                            <span class="product-name">Nokia 5235</span>
                            <span class="product-price">Price: Rs. 5,000</span>
                        </div>
                        <span class="cart-option">
                            <input type="checkbox" name="Mobiles" id="nokia_5235" value="nokia_5235"/>
                            <label for="nokia_5235">Add To Cart</label>
                            <input type="hidden" name="nokia_5235" value="5000"/>
                        </span>
                    </li>

                    <li>
                        <img src="images/nokia_asha305.jpg" alt="Nokia Asha 305">
                        <div>
                            <span class="product-name">Nokia Asha 305</span>
                            <span class="product-price">Price: Rs. 4,799</span>
                        </div>
                        <span class="cart-option">
                            <input type="checkbox" name="Mobiles" id="nokia_asha305" value="nokia_asha305"/>
                            <label for="nokia_asha305">Add To Cart</label>
                            <input type="hidden" name="nokia_asha305" value="4799"/>
                        </span>
                    </li>

                    <li>
                        <img src="images/nokia_e6.jpg" alt="Nokia E6">
                        <div>
                            <span class="product-name">Nokia E6</span>
                            <span class="product-price">Price: Rs. 3,990</span>
                        </div>
                        <span class="cart-option">
                            <input type="checkbox" name="Mobiles" id="nokia_e6" value="nokia_e6"/>
                            <label for="nokia_e6">Add To Cart</label>
                            <input type="hidden" name="nokia_e6" value="3990"/>
                        </span>
                    </li>

                    <li>
                        <img src="images/nokia_asha720.jpg" alt="Nokia Asha 720">
                        <div>
                            <span class="product-name">Nokia Asha 720</span>
                            <span class="product-price">Price: Rs. 10,190</span>
                        </div>
                        <span class="cart-option">
                            <input type="checkbox" name="Mobiles" id="nokia_asha720" value="nokia_asha720"/>
                            <label for="nokia_asha720">Add To Cart</label>
                            <input type="hidden" name="nokia_asha720" value="10190"/>
                        </span>
                    </li>

                    <li>
                        <img src="images/samsung_galaxy_duos.jpg" alt="Samsung Galaxy Duos">
                        <div>
                            <span class="product-name">Samsung Galaxy Duos</span>
                            <span class="product-price">Price: Rs. 15,000</span>
                        </div>
                        <span class="cart-option">
                            <input type="checkbox" name="Mobiles" id="samsung_galaxy_duos" value="samsung_galaxy_duos"/>
                            <label for="samsung_galaxy_duos">Add To Cart</label>
                            <input type="hidden" name="samsung_galaxy_duos" value="8999"/>
                        </span>
                    </li>

                    <li>
                        <img src="images/samsung_galaxy_n7100.jpg" alt="Samsung Galaxy 7100">
                        <div>
                            <span class="product-name">Samsung Galaxy N7100</span>
                            <span class="product-price">Price: Rs. 13,149</span>
                        </div>
                        <span class="cart-option">
                            <input type="checkbox" name="Mobiles" id="samsung_galaxy_n7100" value="samsung_galaxy_n7100"/>
                            <label for="samsung_galaxy_n7100">Add To Cart</label>
                            <input type="hidden" name="samsung_galaxy_n7100" value="13149"/>
                        </span>
                    </li>

                    <li>
                        <img src="images/samsung_galaxy_sII.jpg" alt="Samsung Galaxy SII">
                        <div>
                            <span class="product-name">Samsung Galaxy SII</span>
                            <span class="product-price">Price: Rs. 12,449</span>
                        </div>
                        <span class="cart-option">
                            <input type="checkbox" name="Mobiles" id="samsung_galaxy_sII" value="samsung_galaxy_sII"/>
                            <label for="samsung_galaxy_sII">Add To Cart</label>
                            <input type="hidden" name="samsung_galaxy_sII" value="12449"/>
                        </span>
                    </li>

                    <li>
                        <img src="images/samsung_s6802.jpg" alt="Samsung S6802">
                        <div>
                            <span class="product-name">Samsung S6802</span>
                            <span class="product-price">Price: Rs. 7,890</span>
                        </div>
                        <span class="cart-option">
                            <input type="checkbox" name="Mobiles" id="samsung_s6802" value="samsung_s6802"/>
                            <label for="samsung_s6802">Add To Cart</label>
                            <input type="hidden" name="samsung_s6802" value="7890"/>
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

<% 
} else { 
%>
    <jsp:forward page="front.jsp"/>
<% 
} 
%>

</body>
</html>