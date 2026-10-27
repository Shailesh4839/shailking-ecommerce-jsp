<%@ page session="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
    <title>Your Cart Details</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; font-family: 'Segoe UI', sans-serif; }
        body { background: radial-gradient(circle at top left, #feeda2, #efeff4); min-height: 100vh; padding: 40px 20px; color: #2c3e50; }
        .container { max-width: 950px; margin: 0 auto; background: #ffffff; border-radius: 20px; box-shadow: 0 10px 30px rgba(0,0,0,0.08); padding: 35px; border: 1px solid #e2e8f0; }
        h2 { text-align: center; color: #00838f; margin-bottom: 30px; text-transform: uppercase; font-weight: 700; font-size: 1.8rem; }
        h2::after { content: ''; display: block; width: 80px; height: 4px; background: #ffdf7e; margin: 8px auto 0 auto; border-radius: 2px; }
        .cart-table { width: 100%; border-collapse: separate; border-spacing: 0; margin-bottom: 30px; border-radius: 12px; overflow: hidden; border: 1px solid #e2e8f0; }
        .cart-table th { background: #00838f; color: #fff; padding: 14px 18px; font-size: 1rem; font-weight: 600; text-align: left; }
        .cart-table td { padding: 14px 18px; border-bottom: 1px solid #e2e8f0; vertical-align: middle; font-size: 0.95rem; color: #334155; background-color: #ffffff; }
        .cart-product-img { width: 60px; height: 60px; object-fit: contain; margin-right: 15px; vertical-align: middle; border-radius: 8px; border: 1px solid #e2e8f0; background-color: #f8fafc; }
        .cart-table td a { color: #00838f; text-decoration: none; font-weight: 600; }
        .subtotal-row td { background: #f8fafc; font-weight: 600; color: #0f172a; border-bottom: 2px solid #e2e8f0; }
        .grand-total-row td { background: #e0f2f1; font-size: 1.15rem; font-weight: 700; color: #006064; padding: 18px; }
        .action-container { display: flex; justify-content: space-between; align-items: center; margin-top: 25px; padding-top: 20px; border-top: 1px solid #e2e8f0; }
        .back-btn { text-decoration: none; color: #475569; font-weight: 600; padding: 10px 24px; border: 1px solid #cbd5e1; border-radius: 50px; background: #fff; }
        .payment-btn { background: #00838f; color: #fff; font-size: 1.1rem; font-weight: 600; padding: 12px 35px; border: none; border-radius: 50px; cursor: pointer; box-shadow: 0 4px 15px rgba(0, 131, 143, 0.2); }
        .flex-box { display: flex; align-items: center; justify-content: space-between; width: 100%; }
        .remove-btn { color: #ef4444; text-decoration: none; font-size: 0.85rem; font-weight: 600; padding: 5px 12px; background: #fef2f2; border: 1px solid #fee2e2; border-radius: 6px; }
    </style>
</head>
<body>
<div class="container">
<%
    // Tomcat Safe Linear Arrays (No brackets inside lookups to avoid parser confusion)
    String[] sessionKeys = {
        "selectedmobiles",
        "selectedlaptops",
        "selectedwatches",
        "selectedcars",
        "selectedpens",
        "selectedcalci"
    };

    // 1. Process and save request arrays to session
    for (String key : sessionKeys) {
        String[] reqValues = request.getParameterValues(key);
        if (reqValues != null) {
            session.setAttribute(key, reqValues);
        }
    }

    // 2. Safe Delete Logic without dynamic 2D array resolution inside methods
    String rT = request.getParameter("rT");
    String rI = request.getParameter("rI");
    if (rT != null && rI != null) {
        int idx = Integer.parseInt(rT);
        if (idx >= 0 && idx < 6) {
            String targetKey = sessionKeys[idx];
            String[] items = (String[]) session.getAttribute(targetKey);
            if (items != null) {
                ArrayList<String> nI = new ArrayList<String>();
                for (String singleItem : items) {
                    if (singleItem != null && !singleItem.equalsIgnoreCase(rI)) {
                        nI.add(singleItem);
                    }
                }
                if (!nI.isEmpty()) {
                    session.setAttribute(targetKey, nI.toArray(new String[0]));
                } else {
                    session.removeAttribute(targetKey);
                }
            }
        }
    }
%>
    <h2>Your Cart Details</h2>
    <table class="cart-table">
        <thead>
            <tr><th>Type</th><th>Product Details</th><th>Price</th></tr>
        </thead>
        <tbody>
<%
    int grandTotal = 0;
    String[] label = {"Mobile","Laptop","Watch","Car","Pen Drive","Calculator"};

    int catIdx = 0;
    for (String key : sessionKeys) {
        String[] items = (String[]) session.getAttribute(key);
        if (items != null) {
            int sub = 0;
            for (String itemStr : items) {
                if (itemStr == null || itemStr.trim().equals("")) continue;
                
                String pName = itemStr.trim().toUpperCase().replaceAll("\\s+", ""); 
                int cost = 0;
                
                // CATEGORY 0: MOBILE
                if (catIdx == 0) {
                    if (pName.contains("5235")) cost = 5000;
                    else if (pName.contains("305")) cost = 4799;
                    else if (pName.contains("E6")) cost = 3990;
                    else if (pName.contains("720")) cost = 10190;
                    else if (pName.contains("DUOS")) cost = 15000;
                    else if (pName.contains("N7100")) cost = 13149;
                    else if (pName.contains("SII")) cost = 12449;
                    else if (pName.contains("S6802")) cost = 7890;
                    else cost = 5000;
                }
                // CATEGORY 1: LAPTOP
                else if (catIdx == 1) {
                    if (pName.contains("SONY")) cost = 2350;
                    else if (pName.contains("ANDROID")) cost = 5499;
                    else if (pName.contains("APPLE")) cost = 7399;
                    else if (pName.contains("DELL")) cost = 8299;
                    else if (pName.contains("HP")) cost = 9599;
                    else if (pName.contains("ACER")) cost = 6231;
                    else if (pName.contains("HCL")) cost = 3329;
                    else if (pName.contains("COMPAQ")) cost = 4470;
                    else cost = 5000;
                }
                // CATEGORY 2: WATCH (Safe Regex)
                else if (catIdx == 2) {
                    if (pName.matches(".*(W1|WATCH1).*")) cost = 2000;
                    else if (pName.matches(".*(W2|WATCH2).*")) cost = 1799;
                    else if (pName.matches(".*(W3|WATCH3).*")) cost = 2990;
                    else if (pName.matches(".*(W4|WATCH4).*")) cost = 1190;
                    else if (pName.matches(".*(W5|WATCH5).*")) cost = 1999;
                    else if (pName.matches(".*(W6|WATCH6).*")) cost = 1399;
                    else if (pName.matches(".*(W7|WATCH7).*")) cost = 1299;
                    else if (pName.matches(".*(W8|WATCH8).*")) cost = 1299;
                    else cost = 1500;
                }
                // CATEGORY 3: CAR
                else if (catIdx == 3) {
                    if (pName.matches(".*CAR1.*")) cost = 50000;
                    else if (pName.matches(".*CAR2.*")) cost = 99999;
                    else if (pName.matches(".*CAR3.*")) cost = 89990;
                    else if (pName.matches(".*CAR4.*")) cost = 100000;
                    else if (pName.matches(".*CAR5.*")) cost = 89999;
                    else if (pName.matches(".*CAR6.*")) cost = 130000;
                    else if (pName.matches(".*CAR7.*")) cost = 199999;
                    else if (pName.matches(".*CAR8.*")) cost = 999990;
                    else cost = 100000;
                }
                // CATEGORY 4: PEN DRIVE
                else if (catIdx == 4) {
                    if (pName.matches(".*(PD1|PD-1).*")) cost = 500;
                    else if (pName.matches(".*(PD2|PD-2).*")) cost = 399;
                    else if (pName.matches(".*(PD3|PD-3).*")) cost = 390;
                    else if (pName.matches(".*(PD4|PD-4).*")) cost = 490;
                    else if (pName.matches(".*(PD5|PD-5).*")) cost = 899;
                    else if (pName.matches(".*(PD6|PD-6).*")) cost = 649;
                    else if (pName.matches(".*(PD7|PD-7).*")) cost = 449;
                    else if (pName.matches(".*(PD8|PD-8).*")) cost = 789;
                    else cost = 400;
                }
                // CATEGORY 5: CALCULATOR
                else if (catIdx == 5) {
                    if (pName.matches(".*C1.*")) cost = 500;
                    else if (pName.matches(".*C2.*")) cost = 479;
                    else if (pName.matches(".*C3.*")) cost = 390;
                    else if (pName.matches(".*C4.*")) cost = 490;
                    else if (pName.matches(".*C5.*")) cost = 899;
                    else if (pName.matches(".*C6.*")) cost = 349;
                    else if (pName.matches(".*C7.*")) cost = 449;
                    else if (pName.matches(".*C8.*")) cost = 790;
                    else cost = 350;
                }
                
                sub += cost;
                
                String imgName = itemStr.trim().replaceAll("\\s+", "");
                String displayName = itemStr.toUpperCase().replace('_','-');
                
                if (catIdx == 2) { 
                    imgName = imgName.toLowerCase();
                    displayName = imgName.toUpperCase().replace("W", "WATCH ");
                } else if (catIdx == 4) { 
                    imgName = imgName.toLowerCase();
                    displayName = imgName.toUpperCase().replace("PD", "PD - ");
                }

                out.print("<tr><td>" + label[catIdx] + "</td><td><div class='flex-box'><a href='image.jsp?image_id=" + itemStr + "'>");
                out.print("<img src='images/" + imgName + ".jpg' class='cart-product-img' onerror=\"this.src='images/1.jpg';\">");
                out.print(displayName + "</a>");
                out.print("<a href='cart.jsp?rT=" + catIdx + "&rI=" + itemStr + "' class='remove-btn'>Remove ❌</a></div></td><td>Rs. " + cost + "</td></tr>");
            }
            if (sub > 0) {
                grandTotal += sub;
                out.print("<tr class='subtotal-row'><td></td><td style='text-align:right; color:#00838f;'> Total:</td><td>Rs. " + sub + "</td></tr>");
            }
        }
        catIdx++; 
    }
%>
        <tr class="grand-total-row">
            <td></td><td style="text-align:right; text-transform:uppercase;">Grand Total:</td><td>Rs. <%= grandTotal %></td>
        </tr>
        </tbody>
    </table>

    <div class="action-container">
        <a href="welcome.jsp" class="back-btn">&#8592; Back to Shop</a>
        <form method="post" action="payment.jsp" style="margin:0;">
            <button type="submit" class="payment-btn">Proceed to Payment</button>
        </form>
    </div>
</div>
</body>
</html>