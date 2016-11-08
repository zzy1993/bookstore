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



			<table id="t01">
				<tr>
					<th>Title</th>
					<th>Price</th>
					<th>Category</th>
					<th></th>
				</tr>

				<% 
	ResultSet rs = (ResultSet) request.getAttribute("result");

	while(rs.next()) {
	String title = rs.getString(1);
	float price = rs.getFloat(2);
	String category = rs.getString(3);
	int amount = rs.getInt(4);
	int itemId = rs.getInt(5);

%>


				<tr>
					<td><a style="color: black; text-decoration: none;"
						href="itemDisplay.jsp?itemId=<%=itemId%>"><%=title %></a></td>
					<td>$<%=price%></td>
					<td><%=category%></td>
					<td>
						<form action="cartKeeper.jsp" method="post">
							<input type="hidden" name="itemId" value="<%=itemId%>" /> <input
								type="submit" value="Add to Cart" />
						</form>
					</td>
				</tr>

				<% 
	}
	
	rs.close();	
%>






			</table>

		</div>
		<br />
	</div>
	<div id="footer">Copyright © zzy1993</div>


</body>
</html></html>