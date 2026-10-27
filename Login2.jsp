<%@ page session="false" %>
<html>
<body>
<head>
<title>Login Page</title>
</head>
<body bgcolor=66FFFF>
<center><h1>Login Details</h1></center>
<br><center>
<form action='LoginData.jsp' method='post'>
<table>
<tr><td>
User Name :
</td>
<td>
<input type='text' name='userid'  ><br>
</td></tr>
<tr><td>
Password :
</td>
<td>
<input type='password' name='pass' >
</td></tr>
</table>
<div>
<input type='checkbox' name='cookie' value='checked' checked='true'>
Remember Password
</div>
<div align='center'>
<input type='submit' name='submit' value='submit'>
</div>
</form>
</center>

</body>
</html>

		
