<%@ page session="false" %>
<html>
<body >
<center><h2><i><u>Real Image of Your Cart Item</u></i></h2>
<% HttpSession session = request.getSession(false); 
if(session!=null)
{ 
String id=request.getParameter("image_id");
String path="images/"+id+".jpg";
out.println("<img src="+path+">"); 
} 
else 
{
%>
<jsp:forward page="front.jsp"/>
<%}%>
<h3><a href="cart.jsp">Back</a></h3>
</center>
</body>
</html>