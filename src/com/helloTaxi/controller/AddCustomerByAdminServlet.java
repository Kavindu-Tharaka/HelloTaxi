package com.helloTaxi.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.helloTaxi.DAO.AddCustomerByAdminDAO;
import com.helloTaxi.model.User;
import com.helloTaxi.util.CommonConstants;

/**
 * Servlet implementation class AddCustomerByAdminServlet
 */
@WebServlet("/AddCustomerByAdminServlet")
public class AddCustomerByAdminServlet extends HttpServlet implements CommonConstants {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddCustomerByAdminServlet() {
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
		
		 //get values from the customer signup form and assign in to variables
		 String name = request.getParameter("name");
		 String userName = request.getParameter("userName");
		 String address = request.getParameter("address");
		 String password1 = request.getParameter("password1");
		 String contactNumber = request.getParameter("contactNumber");
		 String zip = request.getParameter("zip");
		 
		 User customer = User.getUser(); //create object from User model class

		 
		//assign input values to model class variables
		 customer.setName(name);
		 customer.setUserName(userName);
		 customer.setAddress(address);
		 customer.setPassword1(password1); 
		 customer.setContactNumber(contactNumber); 
		 customer.setZip(zip); 
		 
		 AddCustomerByAdminDAO addCustomerByAdminDAO = new AddCustomerByAdminDAO();   //create object from AddCustomerByAdminDAO class
		 
		 String userRegistered = addCustomerByAdminDAO.isCustomerAdded(customer);  //assign return value of AddCustomerByAdminDAO class to a variable
		 
		 if(userRegistered.equals(CommonConstants.returnValSuccess)) // if return value of AddCustomerByAdminDAO class == SUCCESS , then redirect to customer list
		 {
	
				response.sendRedirect("customerList.jsp");
		 }

	 }

}
