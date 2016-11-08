<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	String all = request.getParameter("all");
	String action = request.getParameter("action");
	String animals = request.getParameter("animals");
	String art = request.getParameter("art");
	String business = request.getParameter("business");
	String children = request.getParameter("children");
	String drama = request.getParameter("drama");
	String music = request.getParameter("music");
	String novels = request.getParameter("novels");
	String sports = request.getParameter("sports");

	
	if (all != null) {
		response.sendRedirect("index.jsp");
	}
	else if (action != null) {
		String sql = "select i.name, i.price, c.name, i.amount, i.id from item as i, category as c where c.id = 1 and c.id = i.category";
		String forward = "action.jsp";
		request.setAttribute("sql", sql);
		request.setAttribute("forward", forward);
		request.getRequestDispatcher("query.jsp").forward(request, response);

	}
	else if (animals != null) {
		String sql = "select i.name, i.price, c.name, i.amount, i.id from item as i, category as c where c.id = 2 and c.id = i.category";
		String forward = "animals.jsp";
		request.setAttribute("sql", sql);
		request.setAttribute("forward", forward);
		request.getRequestDispatcher("query.jsp").forward(request, response);	
	}
	else if (art != null) {
		String sql = "select i.name, i.price, c.name, i.amount, i.id from item as i, category as c where c.id = 3 and c.id = i.category";
		String forward = "art.jsp";
		request.setAttribute("sql", sql);
		request.setAttribute("forward", forward);
		request.getRequestDispatcher("query.jsp").forward(request, response);
	}
	else if (business != null) {
		String sql = "select i.name, i.price, c.name, i.amount, i.id from item as i, category as c where c.id = 4 and c.id = i.category";
		String forward = "business.jsp";
		request.setAttribute("sql", sql);
		request.setAttribute("forward", forward);
		request.getRequestDispatcher("query.jsp").forward(request, response);
	}
	else if (children != null) {
		String sql = "select i.name, i.price, c.name, i.amount, i.id from item as i, category as c where c.id = 5 and c.id = i.category";
		String forward = "children.jsp";
		request.setAttribute("sql", sql);
		request.setAttribute("forward", forward);
		request.getRequestDispatcher("query.jsp").forward(request, response);
	}
	else if (drama != null) {
		String sql = "select i.name, i.price, c.name, i.amount, i.id from item as i, category as c where c.id = 6 and c.id = i.category";
		String forward = "drama.jsp";
		request.setAttribute("sql", sql);
		request.setAttribute("forward", forward);
		request.getRequestDispatcher("query.jsp").forward(request, response);
	}
	else if (music != null) {
		String sql = "select i.name, i.price, c.name, i.amount, i.id from item as i, category as c where c.id = 7 and c.id = i.category";
		String forward = "music.jsp";
		request.setAttribute("sql", sql);
		request.setAttribute("forward", forward);
		request.getRequestDispatcher("query.jsp").forward(request, response);
	}
	else if (novels != null) {
		String sql = "select i.name, i.price, c.name, i.amount, i.id from item as i, category as c where c.id = 8 and c.id = i.category";
		String forward = "novels.jsp";
		request.setAttribute("sql", sql);
		request.setAttribute("forward", forward);
		request.getRequestDispatcher("query.jsp").forward(request, response);
	}
	else if (sports != null) {
		String sql = "select i.name, i.price, c.name, i.amount, i.id from item as i, category as c where c.id = 9 and c.id = i.category";
		String forward = "sports.jsp";
		request.setAttribute("sql", sql);
		request.setAttribute("forward", forward);
		request.getRequestDispatcher("query.jsp").forward(request, response);
	}
%>



</body>
</html>