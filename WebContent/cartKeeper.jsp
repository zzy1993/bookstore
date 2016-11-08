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
	ArrayList<Integer> check = (ArrayList<Integer>) session.getAttribute("cart");

	//first time to call cart
	if(session.getAttribute("cart") == null || check.isEmpty()) {
		
	
		if (itemId !=0) {
			//set up session and put first item in cart session
			if(session.getAttribute("cart") == null) {
				session.setAttribute("cart", new ArrayList<Integer>());
				session.setAttribute("cprice", new HashMap<Integer, Float>());
				session.setAttribute("cquantity", new HashMap<Integer, Float>());
			}
			((ArrayList<Integer>) session.getAttribute("cart")).add(itemId);
			((HashMap<Integer, Float>) session.getAttribute("cquantity")).put(itemId, 1.0f);

			//set sql
			String sqlAdd = Integer.toString(itemId);		
			String sql = "select i.name, i.price, i.id from item as i " 
				+ "where i.id = " + sqlAdd;
			String forward = "cart.jsp";
		
			//pass sql to query.jsp
			request.setAttribute("sql", sql);
			request.setAttribute("forward", forward);
			request.getRequestDispatcher("query.jsp").forward(request, response);
			}
		else {
			//set sql
			String sql = "select i.name, i.price, i.id from item as i " 
				+ "where i.id = 0";
			String forward = "cart.jsp";
			
			//pass sql to query.jsp
			request.setAttribute("sql", sql);
			request.setAttribute("forward", forward);
			request.getRequestDispatcher("query.jsp").forward(request, response);
		}
	
	} 
	
	//already have cart in session
	else {		
		if(itemId != 0) {
			//item not in cart
			if(!((ArrayList<Integer>)session.getAttribute("cart")).contains(itemId)) {
			
			//put item in cart
			((ArrayList<Integer>) session.getAttribute("cart")).add(itemId);	
			((HashMap<Integer, Float>) session.getAttribute("cquantity")).put(itemId, 1.0f);

			
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
				
			} 
		
			//item in cart
			else {
			
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
			
			}
		}
		else if (itemId == 0){
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
		}
	}
%>


</body>
</html>