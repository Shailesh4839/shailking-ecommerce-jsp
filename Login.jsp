<%@ page session="false" %>
<html>
<body>
<head>
<title>Login Page</title>
</head>
<body bgcolor=66FFFF>
<%  
Cookie c[]=request.getCookies();
if((c!=null)&&(c.length>1))
{
%>
<jsp:forward page="Login1.jsp"/>

<% 
} 
else 
{  
%>
<jsp:forward page="Login2.jsp"/>
<% 
}
%>
</body>
</html>

		
