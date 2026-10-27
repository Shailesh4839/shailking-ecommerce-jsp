<%@ page session="false" %>
<html>
<body>
<%
HttpSession session = request.getSession(false);   
      if(session!=null)
      {
%>          
<jsp:useBean id="T" class="my.LaptopBean"/>

<% T.addAttribute(request); %>
<jsp:forward page="welcome.jsp"/>
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


      