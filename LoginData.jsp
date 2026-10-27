<%@ page session="false" %>

<html>
<body>
<%! int s=-1; %>
<jsp:useBean id="L" class="my.LoginBean"/>
<jsp:setProperty name="L" property="userid" param="userid"/>
<jsp:setProperty name="L" property="pass" param="pass"/>
<% s=L.validate();
if(s==0)
{
 HttpSession  session = request.getSession(true); 
 String name=request.getParameter("userid");
 String upass=request.getParameter("pass");
 String cookie=request.getParameter("cookie");
 	if(cookie==null)
	{
%>
	<jsp:forward page="welcome.jsp"/>
<%
	}
	else
	{
	Cookie c1=new Cookie("username",name);
	Cookie c2=new Cookie("password",upass);
	response.addCookie(c1);
	response.addCookie(c2);
%>
	<jsp:forward page="welcome.jsp"/>
<%
}
}        
else
{
%>
<jsp:forward page="Invalid.jsp"/>
<%
}
%>
</body>
</html>