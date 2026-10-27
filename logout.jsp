<%@ page session="false" %>

<html>
<body>
<%
HttpSession session=request.getSession(true);
session.invalidate();
%>
<jsp:forward page="Login1.jsp"/>
</body>
</html>
