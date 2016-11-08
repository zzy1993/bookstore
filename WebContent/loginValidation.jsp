<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String user=request.getParameter("name");
	String password=request.getParameter("password");

	String url = "jdbc:mysql://localhost:3306/bookstore";
	String dbusr = "root";
	String dbpwd = "kuraki";
	
	
		
	if(!user.isEmpty()) {
	try {

		Class.forName("com.mysql.jdbc.Driver");

		Connection conn = DriverManager.getConnection(url, dbusr, dbpwd);
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select c.userPassword, c.id from Customer as c where c.userName='" + user + "'");
		
		
		if (rs.next()) {
			if (rs.getString(1).equals(password)) {
			session.setAttribute("connect", "true");
			session.setAttribute("user", user);
			session.setAttribute("userId", Integer.toString(rs.getInt(2)));
			response.sendRedirect("index.jsp");
			
			} else {
				
				request.setAttribute("errorPassword", "password not correct");
				request.getRequestDispatcher("login.jsp").forward(request, response);			
			}
		} else {
			request.setAttribute("errorUser", "invalid username");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
		
	} catch (SQLException e) {
		out.println(e);
	}
	}
	else {
		request.setAttribute("errorUser", "invalid username");
		request.getRequestDispatcher("login.jsp").forward(request, response);
	}
	
%>


</body>
</html>