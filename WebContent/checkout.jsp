<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
	
		if(session.getAttribute("connect") == null || !((String) session.getAttribute("connect")).equals("true")) {
			response.sendRedirect("login.jsp");
		} 
		else {
		
		String url = "jdbc:mysql://localhost:3306/bookstore";
		String dbusr = "root";
		String dbpwd = "kuraki";
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection(url, dbusr, dbpwd);
		Statement stmt = conn.createStatement();
		
		String userId = (String) session.getAttribute("userId");

		try {
						
			//insert into customer order
			float subtotal = Float.parseFloat(request.getParameter("subtotal"));
			
			String sql1 = "insert into customerorder(amount, customerId) values (" + subtotal +", " + userId + ")"; 
			stmt.executeUpdate(sql1);
			
			//get id of order id
			String sql2 = "select o.id from customerorder as o where o.customerId = " + userId + " order by o.id desc limit 1";	
			ResultSet rs;
			rs = stmt.executeQuery(sql2);
			int orderId = 0;
			while(rs.next()){
				orderId = rs.getInt(1);
			}
			
			//insert into item-order
			String sql3 = "insert into item_order(item, orderId, quantity) values ";
			String sql4 = "";
			String sqlAdd = "";
			ArrayList<Integer> item = (ArrayList<Integer>) session.getAttribute("cart");
			
			if(item.size() <= 1) {
				sqlAdd = "(" + Integer.toString(item.get(item.size() - 1)) + ", " + Integer.toString(orderId) + ", 1)";
			}
			else{
				for (int i = 0; i < item.size() - 1; i++) {
					sql4 += "(" + Integer.toString(item.get(i)) + ", " + Integer.toString(orderId) + ", 1), ";
				}
				sqlAdd = "(" + Integer.toString(item.get(item.size() - 1)) + ", " + Integer.toString(orderId) + ", 1)";
			}
			
			String sql5 = sql3 + sql4 + sqlAdd;
			stmt.executeUpdate(sql5);
			
			response.sendRedirect("order.jsp");

		} catch (SQLException e) {
			out.println(e);
		} finally {
			if(conn != null) {
				conn.close();
			}
		}
		
		}
	%>


</body>
</html>