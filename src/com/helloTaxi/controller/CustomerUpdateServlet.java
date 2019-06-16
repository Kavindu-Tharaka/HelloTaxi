package com.helloTaxi.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.helloTaxi.DAO.CustomerUpdateDAO;
import com.helloTaxi.model.User;

/**
 * Servlet implementation class CustomerUpdateServlet
 */
@WebServlet("/CustomerUpdateServlet")
public class CustomerUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomerUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
				/*get values from the customer signup form and assign in to variables*/

		String a = request.getParameter("id");
		String b = request.getParameter("name");
		String c = request.getParameter("userName");
		String d = request.getParameter("password1");
		String e = request.getParameter("address");
		String f = request.getParameter("contactNumber");
		String g = request.getParameter("zip");
		
		int aa = Integer.parseInt(a); /*convert string in to integer and getParameter method of reqest object in JSP application*/
		
		 User customer = User.getUser(); /*create object from user model class*/
		
		/*assign input values to model class variables*/		
		customer.setId(aa);
		customer.setName(b);
		customer.setUserName(c);
		customer.setPassword1(d);
		customer.setAddress(e);
		customer.setContactNumber(f);
		customer.setZip(g);
		
		CustomerUpdateDAO customerUpdateDAO = new CustomerUpdateDAO(); /*create object from CustomerUpdateDAO class*/
		
		String ans = customerUpdateDAO.isUpdateUserDao(customer); /*assign return value of customerUpdateDAO class to a variable*/

		if (ans == "SUCCESS") { 
			
			response.sendRedirect("customerProfile.jsp"); 
			/*if return value of ans == SUCCESS , then create session and redirect to response to 'myProfile.jsp'application*/
		}
	}

}
