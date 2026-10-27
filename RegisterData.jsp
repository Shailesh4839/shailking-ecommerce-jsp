<%@ page session="false" %>

<html>
<body>
<%! String s=""; %>
<jsp:useBean id="L" class="my.RegisterBean"/>
<jsp:setProperty name="L" property="userid" param="userid"/>
<jsp:setProperty name="L" property="pass" param="pass"/>
<%

System.out.println("In the registreddata jsp page");
 s=L.register(); %>
<jsp:forward page="<%=s %>"/>
</body>
</html>

		
