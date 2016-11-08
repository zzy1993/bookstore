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
	String sql = (String) request.getAttribute("sql");
	String forward = (String) request.getAttribute("forward");

	String url = "jdbc:mysql://localhost:3306/bookstore";
	String dbusr = "root";
	String dbpwd = "kuraki";
	
	Class.forName("com.mysql.jdbc.Driver");

	Connection conn = DriverManager.getConnection(url, dbusr, dbpwd);

	Statement stmt = conn.createStatement();

	ResultSet rs;
	
	try {
		
	
		rs = stmt.executeQuery(sql);

		request.setAttribute("result", rs);
		
		request.getRequestDispatcher(forward).forward(request, response);

		} catch (SQLException e) {
				out.println(e);
		} finally {
			if (conn != null) {
				conn.close();
			}
		}
	
%>




</body>
</html>