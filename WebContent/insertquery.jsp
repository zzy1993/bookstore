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
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		String firstName = request.getParameter("firstName");
		String middleName = request.getParameter("middleName");
		String lastName = request.getParameter("lastName");
		String email = request.getParameter("email");

		String url = "jdbc:mysql://localhost:3306/bookstore";
		String dbusr = "root";
		String dbpwd = "kuraki";
		
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection(url, dbusr, dbpwd);
			Statement stmt = conn.createStatement();

			String sql = "insert into Customer(userName, userPassword, firstName, middleName, lastName, email) "
					+ "values ('" + name + "', '" + password + "', '" + firstName + "', '" + middleName + "', '"
					+ lastName + "', '" + email + "')";
			
			stmt.executeUpdate(sql);
			
			session.setAttribute("connect", "true");
			session.setAttribute("user", name);
			response.sendRedirect("index.jsp");
			
		} catch (SQLException e) {
			out.println(e);
		}

	%>


</body>
</html>