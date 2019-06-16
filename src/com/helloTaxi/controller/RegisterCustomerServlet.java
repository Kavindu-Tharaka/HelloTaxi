package com.helloTaxi.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.helloTaxi.DAO.RegisterCustomerDAO;
import com.helloTaxi.model.User;

/**
 * Servlet implementation class AddCustomerByAdminServlet
 */
@WebServlet("/RegisterCustomerServlet")
public class RegisterCustomerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterCustomerServlet() {
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
		 String name = request.getParameter("name");
		 String userName = request.getParameter("userName");
		 String address = request.getParameter("address");
		 String password1 = request.getParameter("password1");
		 String contactNumber = request.getParameter("contactNumber");
		 String zip = request.getParameter("zip");
		 
		 User customer = User.getUser(); /*create object from customer model class*/

		 
		 /*assign input values to model class variables*/
		 customer.setName(name);
		 customer.setUserName(userName);
		 customer.setAddress(address);
		 customer.setPassword1(password1); 
		 customer.setContactNumber(contactNumber); 
		 customer.setZip(zip); 
		 
		 RegisterCustomerDAO registerDao = new RegisterCustomerDAO();   /*create object from registerUserDAO class*/
		 
		 String userRegistered = registerDao.registerUser(customer);  /*assign return value of registerUserDAO class to a variable*/
		 
		 if(userRegistered.equals("SUCCESS")) /*if return value of registerUserDAO class == SUCCESS , then create session and redirect*/
		 {
	
				HttpSession session = request.getSession();
				session.setAttribute("username", userName);
				response.sendRedirect("welcome.jsp");
		 }

	 }

}


