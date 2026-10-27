<%@ page session="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Secure Payment Gateway</title>
    <style>
        /* Modern Minimal Reset & Global Styles */
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

        /* Main Container Card */
        .payment-container {
            background: #ffffff;
            width: 100%;
            max-width: 650px;
            border-radius: 24px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.08);
            border: 1px solid rgba(226, 232, 240, 0.8);
            padding: 40px;
        }

        .header {
            text-align: center;
            margin-bottom: 30px;
        }
        .header h2 {
            color: #00838f;
            font-size: 1.8rem;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 1px;
        }
        .header p {
            color: #64748b;
            font-size: 0.95rem;
            margin-top: 5px;
        }

        /* Order Summary Bar */
        .order-summary {
            background: #f8fafc;
            border: 1px solid #e2e8f0;
            border-radius: 12px;
            padding: 15px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
        }
        .order-summary span {
            font-weight: 600;
            color: #334155;
        }
        .order-summary .total-amount {
            color: #b20202;
            font-size: 1.2rem;
            font-weight: 700;
        }

        /* Payment Tabs Layout */
        .payment-tabs {
            display: flex;
            gap: 12px;
            margin-bottom: 25px;
        }
        .tab-btn {
            flex: 1;
            padding: 12px;
            border: 2px solid #cbd5e1;
            background: #ffffff;
            border-radius: 12px;
            font-weight: 600;
            color: #475569;
            cursor: pointer;
            transition: all 0.2s ease;
            text-align: center;
            font-size: 0.95rem;
        }
        .tab-btn:hover {
            background: #f8fafc;
            border-color: #00838f;
        }
        .tab-btn.active {
            border-color: #00838f;
            background: rgba(0, 131, 143, 0.05);
            color: #00838f;
        }

        /* Dynamic Forms Sections */
        .payment-form {
            display: none;
            animation: fadeIn 0.4s ease;
        }
        .payment-form.active {
            display: block;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(5px); }
            to { opacity: 1; transform: translateY(0); }
        }

        /* Form Group Input Elements */
        .input-group {
            margin-bottom: 18px;
        }
        .input-group label {
            display: block;
            color: #334155;
            font-weight: 600;
            font-size: 0.9rem;
            margin-bottom: 6px;
        }
        .input-group input {
            width: 100%;
            padding: 12px 16px;
            border: 1.5px solid #cbd5e1;
            border-radius: 10px;
            font-size: 1rem;
            color: #1e293b;
            background: #f8fafc;
            transition: all 0.3s ease;
        }
        .input-group input:focus {
            outline: none;
            border-color: #00838f;
            background: #ffffff;
            box-shadow: 0 0 0 4px rgba(0, 131, 143, 0.15);
        }

        /* Flex row for Expiry and CVV */
        .row {
            display: flex;
            gap: 15px;
        }
        .row .input-group {
            flex: 1;
        }

        /* Informational Note for COD */
        .info-note {
            background: rgba(0, 131, 143, 0.05);
            border-left: 4px solid #00838f;
            padding: 15px;
            border-radius: 8px;
            color: #006064;
            font-size: 0.95rem;
            line-height: 1.5;
            margin-bottom: 20px;
        }

        /* Submit/Pay Buttons */
        .btn-pay {
            width: 100%;
            padding: 14px;
            background: #00838f;
            color: #ffffff;
            font-size: 1.1rem;
            font-weight: 600;
            border: none;
            border-radius: 50px;
            cursor: pointer;
            box-shadow: 0 4px 12px rgba(0, 131, 143, 0.2);
            transition: all 0.2s ease;
            margin-top: 10px;
        }
        .btn-pay:hover {
            background: #006064;
            transform: translateY(-1px);
        }
    </style>

    <script type="text/javascript">
        // Function to Switch Between Tabs Dynamically
        function switchMethod(method, btn) {
            // Hide all forms
            var forms = document.getElementsByClassName('payment-form');
            for (var i = 0; i < forms.length; i++) {
                forms[i].classList.remove('active');
            }
            // Deactivate all buttons
            var buttons = document.getElementsByClassName('tab-btn');
            for (var i = 0; i < buttons.length; i++) {
                buttons[i].classList.remove('active');
            }
            
            // Show selected form and active tab
            document.getElementById(method).classList.add('active');
            btn.classList.add('active');
        }

        // Validation Logic for Forms
        function validateCard() {
            var cardNo = document.getElementById('card_no').value.trim();
            var exp = document.getElementById('card_exp').value.trim();
            var cvv = document.getElementById('card_cvv').value.trim();

            if(cardNo == "" || cardNo.length < 16) {
                alert("Please enter a valid 16-digit Card Number.");
                return false;
            }
            if(exp == "") {
                alert("Please enter Expiry Date.");
                return false;
            }
            if(cvv == "" || cvv.length < 3) {
                alert("Please enter a valid 3-digit CVV.");
                return false;
            }
            return true;
        }

        function validateUPI() {
            var upiId = document.getElementById('upi_id').value.trim();
            if(upiId == "" || !upiId.includes("@")) {
                alert("Please enter a valid UPI ID (e.g. username@oksbi).");
                return false;
            }
            return true;
        }
    </script>
</head>
<body>

<div class="payment-container">
    <div class="header">
        <h2>Secure Checkout</h2>
        <p>Choose your payment mode to complete your shopping order</p>
    </div>

    <div class="order-summary">
        <span>Grand Total Payable:</span>
        <span class="total-amount">
            <% 
                String finalAmount = (session.getAttribute("grandTotal") != null) ? session.getAttribute("grandTotal").toString() : "Calculated at Next Step";
                out.print(finalAmount.startsWith("Rs") ? finalAmount : "Rs. " + finalAmount);
            %>
        </span>
    </div>

    <div class="payment-tabs">
        <button type="button" class="tab-btn active" onclick="switchMethod('card', this)">Credit / Debit Card</button>
        <button type="button" class="tab-btn" onclick="switchMethod('upi', this)">UPI / QR</button>
        <button type="button" class="tab-btn" onclick="switchMethod('cod', this)">Cash On Delivery</button>
    </div>

    <form id="card" class="payment-form active" method="POST" action="ProcessPayment.jsp" onsubmit="return validateCard()">
        <input type="hidden" name="paymentMode" value="Card">
        
        <div class="input-group">
            <label for="card_name">Name on Card</label>
            <input type="text" id="card_name" name="cardName" placeholder="e.g. SHAILING YADAV" required>
        </div>
        <div class="input-group">
            <label for="card_no">Card Number</label>
            <input type="text" id="card_no" name="cardNumber" maxlength="16" placeholder="0000 0000 0000 0000" oninput="this.value = this.value.replace(/[^0-9]/g, '')">
        </div>
        <div class="row">
            <div class="input-group">
                <label for="card_exp">Expiry Date</label>
                <input type="text" id="card_exp" name="cardExpiry" maxlength="5" placeholder="MM/YY">
            </div>
            <div class="input-group">
                <label for="card_cvv">CVV</label>
                <input type="password" id="card_cvv" name="cardCvv" maxlength="3" placeholder="•••" oninput="this.value = this.value.replace(/[^0-9]/g, '')">
            </div>
        </div>
        <button type="submit" class="btn-pay">Pay Securely Now</button>
    </form>

    <form id="upi" class="payment-form" method="POST" action="ProcessPayment.jsp" onsubmit="return validateUPI()">
        <input type="hidden" name="paymentMode" value="UPI">
        
        <div class="input-group">
            <label for="upi_id">Virtual Payment Address (UPI ID)</label>
            <input type="text" id="upi_id" name="upiId" placeholder="e.g. shailesh@apl / 9876543210@paytm">
        </div>
        <button type="submit" class="btn-pay">Verify & Pay</button>
    </form>

    <form id="cod" class="payment-form" method="POST" action="ProcessPayment.jsp">
        <input type="hidden" name="paymentMode" value="COD">
        
        <div class="info-note">
            <strong>Cash on Delivery Eligible!</strong><br>
            Aapko paise tab dene honge jab aapka ordered item (Mobile/Laptop/Watch) aapke ghar deliver ho jayega. Extra delivery charge Rs. 0 hai.
        </div>
        <button type="submit" class="btn-pay">Confirm Order (COD)</button>
    </form>
</div>

</body>
</html>