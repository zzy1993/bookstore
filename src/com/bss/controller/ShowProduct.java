package com.bss.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bss.dao.ProductDao;
import com.bss.model.Product;


public class ShowProduct extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		
		try {
			//ProductDao productDao = new ProductDao();
			//List<Product> products = productDao.getProducts();
			
			//request.setAttribute("name", "nih");
			//request.getRequestDispatcher("test.jsp").forward(request, response);
			
			PrintWriter p = response.getWriter();
			p.println("<html>");
			p.println("welcome");
			
			p.println("nima");
			p.println("</html>");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
