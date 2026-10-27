<%@ page session="false" %>
<html>
<head>
    <title>Login Page</title>
    <style>
        /* Modern Reset and Base Styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            /* Wahi smooth gradient background jo humne website ke liye chuna tha */
            background: linear-gradient(135deg, #e4ecfa 0%, #f4f7f6 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }

        /* Modern Card Layout */
        .login-card {
            background: #ffffff;
            width: 100%;
            max-width: 400px;
            padding: 40px 30px;
            border-radius: 16px;
            box-shadow: 0 10px 25px rgba(30, 64, 175, 0.08);
            border: 1px solid rgba(255, 255, 255, 0.8);
        }

        h1 {
            color: #00838f; /* Premium Royal Blue */
            font-size: 1.8rem;
            font-weight: 700;
            text-align: center;
            margin-bottom: 30px;
            letter-spacing: 0.5px;
        }

        /* Form Layout */
        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            font-size: 0.9rem;
            color: #475569;
            font-weight: 600;
            margin-bottom: 6px;
        }

        /* Input Styling */
        .form-group input {
            width: 100%;
            padding: 12px 16px;
            font-size: 1rem;
            border: 2px solid #e2e8f0;
            border-radius: 8px;
            outline: none;
            transition: all 0.3s ease;
            color: #334155;
        }

        /* Input click glow effect */
        .form-group input:focus {
            border-color: #00838f;
            box-shadow: 0 0 0 3px rgba(59, 130, 246, 0.15);
        }

        /* Checkbox Option */
        .checkbox-container {
            display: flex;
            align-items: center;
            gap: 8px;
            font-size: 0.9rem;
            color: #64748b;
            margin-bottom: 25px;
            cursor: pointer;
        }

        .checkbox-container input {
            width: 16px;
            height: 16px;
            cursor: pointer;
        }

        /* Submit Button matching with homepage */
        .btn-submit {
            width: 100%;
            padding: 14px;
            background-color: #00838f;
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 4px 6px rgba(30, 64, 175, 0.15);
        }

        .btn-submit:hover {
            background-color: #006064;
            transform: translateY(-1px);
            box-shadow: 0 6px 12px rgba(30, 64, 175, 0.25);
        }
    </style>
</head>
<body>

<%  
Cookie c[]=request.getCookies();
%>

    <div class="login-card">
        <h1>Sign In to ShailKing</h1>

        <form action='LoginData.jsp' method='post'>
            
            <!-- User Name Input Section -->
            <div class="form-group">
                <label>User Name</label>
                <%
                out.println("<input type='text' name='userid' value="+c[0].getValue()+" placeholder='Enter your username' required>");
                %>
            </div>

            <!-- Password Input Section -->
            <div class="form-group">
                <label>Password</label>
                <%
                out.println("<input type='password' name='pass' value="+c[1].getValue()+" placeholder='Enter your password' required>");
                %>
            </div>

            <!-- Remember Password Option -->
            <div class="checkbox-container">
                <input type='checkbox' name='cookie' value='checked' checked='true'>
                <span>Remember Password</span>
            </div>

            <!-- Submit Button Section -->
            <div>
                <input type='submit' name='submit' value='Sign In' class="btn-submit">
            </div>
            
        </form>
    </div>

</body>
</html>