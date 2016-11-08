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
		<h1><a id="pageheader" href="index.jsp">Book Selling Store</a></h1>
	</div>

	<div id="wrapperNormal">
		<h2>Welcome! Please Login!</h2>
		
		<form id="f" action="loginValidation.jsp" method="post">
			<table id="t">
				<tr>
					<td>User Name :</td>
					<td><input type="text" name="name" size="25" /></td>
					<td><div style="color:red">${errorUser}</div></td>
				</tr>
				<tr>
					<td>Password :</td>
					<td><input type="password" name="password" size="25" /></td>
					<td><div style="color:red">${errorPassword}</div></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" name="login" value="Login" /></td>
				</tr>

			</table>

		</form>

	</div>

	<div id="footer">Copyright © zzy1993</div>


</body>
</html>