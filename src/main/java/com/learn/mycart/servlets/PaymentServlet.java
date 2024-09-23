package com.learn.mycart.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.learn.mycart.helper.Message;

public class PaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public PaymentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		Message m=new Message("Payment Successfull", "text-white", "info");
		session.setAttribute("msg",m);
		response.sendRedirect("index.jsp");
		}

}