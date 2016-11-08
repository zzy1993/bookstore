<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	Integer itemId = Integer.parseInt(request.getParameter("itemId"));	
	((ArrayList<Integer>) session.getAttribute("cart")).remove(itemId);	
	((HashMap<Integer, Float>) session.getAttribute("cprice")).remove(itemId);
	((HashMap<Integer, Float>) session.getAttribute("cquantity")).remove(itemId);


	
%>

	<jsp:forward page="cartKeeper.jsp">
		<jsp:param name="itemId" value="0"/>
	</jsp:forward>

</body>
</html>