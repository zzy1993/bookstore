package com.bss.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;




public class CategoryServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void init() throws ServletException {}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		
		response.setContentType("text/html");

		try {

			
			PrintWriter out = response.getWriter();
			
			out.println("<h1>" + "hihao, servlet page" + "</h1>");
			

			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) {   
		try {
			doGet(request,response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}