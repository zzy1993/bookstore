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
	Float changedQuantity = Float.parseFloat(request.getParameter("quantity"));	
	
	((HashMap<Integer, Float>) session.getAttribute("cquantity")).put(itemId, changedQuantity);

	//set sql
	ArrayList<Integer> item = (ArrayList<Integer>) session.getAttribute("cart");			
	String sql1 = "select i.name, i.price, i.id from item as i " 
			+ "where (";
	String sql2 = "";
	
	for(int i = 0; i < item.size()-1; i++) {
		sql2 += "i.id = " + Integer.toString(item.get(i)) + " or ";
	}

	String last = Integer.toString(item.get(item.size()-1));
	String sql3 = "i.id = " + last + ")";
	String sql = sql1 + sql2 + sql3;
	String forward = "cart.jsp";

	//pass sql to query.jsp
	request.setAttribute("sql", sql);
	request.setAttribute("forward", forward);
	request.getRequestDispatcher("query.jsp").forward(request, response);

%>


</body>
</html>