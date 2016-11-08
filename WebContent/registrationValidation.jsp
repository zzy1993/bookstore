<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>


<body>

<%
	String name = request.getParameter("name");
	String password = request.getParameter("password");
	String firstName = request.getParameter("firstName");
	String middleName = request.getParameter("middleName");
	String lastName = request.getParameter("lastName");
	String email = request.getParameter("email");

	
	if(!name.isEmpty() && !password.isEmpty() && !firstName.isEmpty() && !lastName.isEmpty() && !email.isEmpty()) {
		try {
		
			String url = "jdbc:mysql://localhost:3306/bookstore";
			String dbusr = "root";
			String dbpwd = "kuraki";
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection(url, dbusr, dbpwd);
			Statement stmt = conn.createStatement();
			
			String sqlName = "select c.userName from Customer as c where c.userName = '" + name +"'";	
			ResultSet rsName = stmt.executeQuery(sqlName);
			boolean nameExist = rsName.next();
			
			String sqlEmail = "select c.email from Customer as c where c.email = '" + email +"'";
			ResultSet rsEmail = stmt.executeQuery(sqlEmail);
			boolean emailExist = rsEmail.next();
			
			if (nameExist || emailExist) {
				if (nameExist) {
					request.setAttribute("errorUserName", "this username is registered");
					request.getRequestDispatcher("registration.jsp").forward(request, response);
				} else {
					request.setAttribute("errorEmail", "this email is registered");
					request.getRequestDispatcher("registration.jsp").forward(request, response);
				} 
			} else {
				String sql = "insert into Customer(userName, userPassword, firstName, middleName, lastName, email) "
						+ "values ('" + name + "', '" + password + "', '" + firstName + "', '" + middleName + "', '"
						+ lastName + "', '" + email + "')";
				
				stmt.executeUpdate(sql);
			
				session.setAttribute("connect", "true");
				session.setAttribute("user", name);
				response.sendRedirect("index.jsp");
			}
		} catch (SQLException e) {
			out.println(e);
		}
	} else {
		request.setAttribute("errorMessage", "invalid input");
		request.getRequestDispatcher("registration.jsp").forward(request, response);
	}
			

	%>

</body>
</html>