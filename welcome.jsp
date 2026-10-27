<%@ page session="false" %> 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Select an Item - ShailKing</title>
    
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Round" rel="stylesheet">
    
    <style>
        /* Base Reset */
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
            padding-bottom: 40px;
        }

        /* Header Section */
        header {
            text-align: center;
            padding: 30px 20px;
        }

        header h1 {
            font-family: 'Playfair Display', 'Georgia', serif;
            font-size: 3.5rem;
            font-weight: 700;
            color: #00838f;          
            letter-spacing: 4px;
            margin-bottom: 10px;
            text-shadow: 1px 1px 0px #fff, 2px 2px 0px #9a7b43, 4px 4px 8px rgba(0,0,0,0.15);
        }

        .subtitle {
            display: inline-block;
            font-size: 1.1rem;
            color: #ffffff;
            background: #00838f; 
            font-weight: 600;
            letter-spacing: 2px;
            text-transform: uppercase;
            padding: 8px 24px;
            border-radius: 50px;
            box-shadow: 0 4px 15px rgba(0, 131, 143, 0.2);
            border: 2px solid #ffdf7e;
        }

        /* Dashboard Layout Container */
        .main-container {
            max-width: 1100px;
            margin: 20px auto;
            padding: 0 20px;
            display: flex;
            gap: 30px;
            flex-wrap: wrap;
        }

        /* Left Side Menu (Categories Grid) */
        .category-menu {
            flex: 2 1 600px;
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(180px, 1fr));
            gap: 20px;
        }

        .category-card {
            background: #f8fafc;
            border-radius: 16px;
            padding: 25px 15px 20px 15px;
            text-align: center;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.03);
            border: 1px solid #e2e8f0;
            text-decoration: none;
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
            
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            align-items: center;
            min-height: 165px;
            position: relative;
            overflow: hidden;
        }

        /* Bottom Bar Indicator */
        .category-card::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            width: 100%;
            height: 4px;
            background-color: transparent;
            transition: background-color 0.3s ease;
        }

        .category-card:hover {
            transform: translateY(-5px);
            background: #ffffff;
            box-shadow: 0 10px 25px rgba(0, 131, 143, 0.15);
            border-color: #00838f;
        }

        .category-card:hover::after {
            background-color: #00838f;
        }

        /* Naye Icons ka Super Cool Design */
        .category-card .material-icons-round {
            font-size: 3rem; /* Thoda aur bada aur clear visual */
            color: #00838f;
            background: rgba(0, 131, 143, 0.06); /* Icon ke peeche light circular glow tint */
            padding: 12px;
            border-radius: 50px;
            transition: all 0.3s ease;
        }

        /* Hover karne par icon ka pop effect */
        .category-card:hover .material-icons-round {
            transform: scale(1.1);
            background: #00838f;
            color: #ffffff; /* Hover par icon pure white ho jayega aur background teal */
            box-shadow: 0 4px 12px rgba(0, 131, 143, 0.3);
        }

        .category-name {
            font-size: 1.1rem;
            font-weight: 700;
            color: #334155;
            letter-spacing: 0.5px;
            text-transform: uppercase;
            margin-top: 10px;
        }

        .category-desc {
            font-size: 0.8rem;
            color: #64748b;
            font-weight: 500;
            margin-top: 4px;
            transition: color 0.3s ease;
        }

        .category-card:hover .category-desc {
            color: #006064;
        }

        /* Right Side Banner Pane */
        .image-pane {
            flex: 1 1 300px;
            background: #ffffff;
            padding: 20px;
            border-radius: 16px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.05);
            border: 1px solid #e2e8f0;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            text-align: center;
        }

        .image-pane img {
            width: 100%;
            max-width: 250px;
            height: auto;
            border-radius: 8px;
            margin-bottom: 20px;
        }

        /* Action Buttons */
        .btn-action {
            display: inline-block;
            width: 100%;
            padding: 12px;
            text-decoration: none;
            font-weight: 600;
            border-radius: 8px;
            text-align: center;
            font-size: 0.95rem;
            transition: all 0.3s ease;
            margin-bottom: 10px;
        }

        .btn-cart {
            background-color: #00838f;
            color: white;
            box-shadow: 0 4px 6px rgba(0, 131, 143, 0.15);
        }

        .btn-cart:hover {
            background-color: #006064;
            transform: translateY(-1px);
        }

        .btn-logout {
            background-color: #ef4444;
            color: white;
        }

        .btn-logout:hover {
            background-color: #dc2626;
            transform: translateY(-1px);
        }

        @media (max-width: 768px) {
            header h1 { font-size: 2.5rem; }
            .main-container { flex-direction: column-reverse; }
        }
    </style>
</head>
<body>

<%
HttpSession session = request.getSession(false);   
if(session != null)
{
%>

    <header>
        <h1>ShailKing</h1>
        <div class="subtitle">Select Any Item</div>
    </header>

    <main class="main-container">
        
        <section class="category-menu">
            <a href="mobile.jsp" target="_top" class="category-card">
                <span class="material-icons-round">smartphone</span>
                <div>
                    <div class="category-name">Mobile</div>
                    <div class="category-desc">Latest Smartphones</div>
                </div>
            </a>
            <a href="laptop.jsp" target="_top" class="category-card">
                <span class="material-icons-round">laptop_mac</span>
                <div>
                    <div class="category-name">Laptop</div>
                    <div class="category-desc">High Performance PC</div>
                </div>
            </a>
            <a href="cars.jsp" target="_top" class="category-card">
                <span class="material-icons-round">directions_car</span>
                <div>
                    <div class="category-name">Cars</div>
                    <div class="category-desc">Premium Wheels</div>
                </div>
            </a>
            <a href="watch.jsp" target="_top" class="category-card">
                <span class="material-icons-round">watch</span>
                <div>
                    <div class="category-name">Watches</div>
                    <div class="category-desc">Luxury Timepieces</div>
                </div>
            </a>
            <a href="pd.jsp" target="_top" class="category-card">
                <span class="material-icons-round">album</span>
                <div>
                    <div class="category-name">Pendrive</div>
                    <div class="category-desc">High Speed Storage</div>
                </div>
            </a>
            <a href="calculator.jsp" target="_top" class="category-card">
                <span class="material-icons-round">calculate</span>
                <div>
                    <div class="category-name">Calculators</div>
                    <div class="category-desc">Scientific & Standard</div>
                </div>
            </a>
        </section>

        <aside class="image-pane">
            <img src="images/8.jpg" alt="Buy Online Panel">
            
            <a href="cart.jsp" class="btn-action btn-cart">Show My Cart</a>
            <a href="logout.jsp" target="_top" class="btn-action btn-logout">Logout</a>
        </aside>

    </main>

<%
}
else
{
%>
    <jsp:forward page="front.jsp"/>
<%
}
%>

</body>
</html>