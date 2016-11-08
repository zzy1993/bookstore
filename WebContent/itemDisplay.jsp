<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>


<body>

	<div id="header">
		<h1>
			<a id="pageheader" href="index.jsp">Book Selling Store</a>
		</h1>
	</div>


	<div id="wrapper">
		<div id="nav">

			<br />
			<form id="navF" action="cateRedirect.jsp" method="post">

				<table>
					<tr>
						<td><input type="submit" name="all" value="All Books" /></td>
					</tr>
					<tr>
						<td><input type="submit" name="action" value="Action" /></td>
					</tr>
					<tr>
						<td><input type="submit" name="animals" value="Animals" /></td>
					</tr>
					<tr>
						<td><input type="submit" name="art" value="Art" /></td>
					</tr>
					<tr>
						<td><input type="submit" name="business" value="Business" /></td>
					</tr>
					<tr>
						<td><input type="submit" name="children" value="Children" /></td>
					</tr>
					<tr>
						<td><input type="submit" name="drama" value="Drama" /></td>
					</tr>
					<tr>
						<td><input type="submit" name="music" value="Music" /></td>
					</tr>
					<tr>
						<td><input type="submit" name="novels" value="Novels" /></td>
					</tr>
					<tr>
						<td><input type="submit" name="sports" value="Sports" /></td>
					</tr>
				</table>
			</form>


		</div>
		<div id="section">


			<form id="f1" action="search.jsp" method="get">
				<input type="text" name="search" size="40" /> <input type="submit"
					value="Search" />
			</form>
			<div id="login">
				<%
					if (session.getAttribute("connect") == null || !((String) session.getAttribute("connect")).equals("true")) {
				%>
				<form id="f2" action="login.jsp" method="post">
					<input type="submit" name="login" value="User Login" />
				</form>
				<form id="f3" action="registration.jsp">
					<input type="submit" value="Register" />
				</form>
				<%
					} else if (((String) session.getAttribute("connect")).equals("true")) {
				%>
				<p id="p1">
					hello,
					<a href="order.jsp"><%=session.getAttribute("user")%></a></p>
				<form id="f4" action="logout.jsp" method="post">
					<input type="submit" name="logout" value="Log out" />
				</form>
				<%
					}
				%>
				<form id="f5" action="cartKeeper.jsp" method="get">
					<input type="hidden" name="itemId" value="0" /> <input
						type="submit" name="cart" value="Cart" />
				</form>
			</div>

			<br />

		

				<%!String url = "jdbc:mysql://localhost:3306/bookstore";
	String dbusr = "root";
	String dbpwd = "kuraki";

	%>


				<%
				    String itemId = request.getParameter("itemId");

					try {
						Class.forName("com.mysql.jdbc.Driver");

						Connection conn = DriverManager.getConnection(url, dbusr, dbpwd);

						Statement stmt = conn.createStatement();

						ResultSet rs;

						String sql = "select i.name, i.price, i.description, c.name, i.amount, a.name "
								+ "from item as i, category as c, item_author as ia, author as a "
								+ "where c.id = i.category and i.id = ia.item and ia.author = a.id and i.id = " + itemId;

						rs = stmt.executeQuery(sql);
						
						String title = null;
						float price = 0f;
						String description = null;
						String category = null;
						int amount = 0;
						String author = null;
						
						if(rs.next()) {
							title = rs.getString(1);
							price = rs.getFloat(2);
							description = rs.getString(3);
							category = rs.getString(4);
							amount= rs.getInt(5);
							author = rs.getString(6);
						}
						
%>
	<br>
	<table id="t03">
				<tr>
					<th>Title:</th>
					<td><%=title %></td>					
				</tr>
				<tr>
					<th>Author:</th>
					<td><%=author %>

	<% 					while (rs.next()) {
							String authorNext = rs.getString(6);
				%>
				<tr>
					<th></th>
					<td><%=authorNext %></td>
				</tr>

				<%
					}
	%>
				<tr>
					<th>Price:</th>
					<td>$<%=price %></td>					
				</tr>
				<tr>
					<th>Category:</th>
					<td><%=category %></td>					
				</tr>
				<tr>
					<th>Amount:</th>
					<td><%=amount %></td>					
				</tr>
				<tr>
					<th>Book Description:</th>
					<td><%=description %></td>					
				</tr>
	
	
	<%

					} catch (SQLException e) {
						out.println(e);
					}
				%>
			</table>

		</div>
		<br />
	</div>
	
	
	<div id="footer">Copyright © zzy1993</div>


</body>
</html>