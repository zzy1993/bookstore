<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*, java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Cart</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
<script type="text/javascript">
function getData(quantity) {
	var value = quantity.value;
	alert(value);
}
</script>
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
					<input type="hidden" name="itemId" value="0"/>			
					<input type="submit" name="cart" value="Cart" /> 
				</form>
			</div>

			<br />
			
			<table id="t01">
					<tr>
						<th>Item</th>
						<th>Price</th>
						<th>Quantity</th>
						<th></th>
					</tr>

				<%
					ResultSet rs = (ResultSet) request.getAttribute("result");
					float subtotal = 0f;
					
					
					while(rs.next()) {
					String title = rs.getString(1);
					float price = rs.getFloat(2);
					int itemId = rs.getInt(3);
					
					((HashMap<Integer, Float>) session.getAttribute("cprice")).put(itemId, price);
					
					//get quantity
					Float quantity = ((HashMap<Integer, Float>) session.getAttribute("cquantity")).get(itemId);
					int q = (int) Math.floor(quantity);
					
				%>

				<tr>
					<td><%=title%></td>
					<td>$<%=price%></td>
					<td>
						<form action="refresh.jsp" >
							<input type="hidden" name="itemId" value="<%=itemId%>" /> 
							<input type="number" name="quantity" value="<%=q %>" min="1" maxlength="3" style="width: 40px;" onchange='this.form.submit()'/>									
						</form>
					
					</td>
					<td>
						<form action="remove.jsp" method="post">
							<input type="hidden" name="itemId" value="<%=itemId %>"/>
							<input type="submit"  value="Remove"/>
						</form>
					</td>
				</tr>

				<%
					subtotal += price*quantity;

					}
					
					String total = String.format("%.2f", subtotal);

					rs.close();
					
				%>

			</table>			
				<table id="checkout">
					<tr>
						<td></td>
					</tr>
					<tr>
						<td>Subtotal:</td>
						<td>$<%=total %></td>
					</tr>
					<tr>
						<td colspan="2">
							<form action="checkout.jsp" method="post">
								<input type="hidden" name="subtotal" value="<%=subtotal %>">
								<input type="submit" value="Check out">
							</form>
						</td>
					</tr>
				</table>



		</div>
		<br />
	</div>
	<div id="footer">Copyright © zzy1993</div>


</body>
</html>