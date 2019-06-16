package com.helloTaxi.controller;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.helloTaxi.DAO.EditCustomerByAdminDAO;
import com.helloTaxi.model.User;
import com.helloTaxi.util.CommonConstants;

/**
 * Servlet implementation class editUserServlet
 */
@WebServlet("/editCustomerServlet")
public class EditCustomerByAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditCustomerByAdminServlet() {
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


		//get parameters from customerEdit and assign to variables
		String idTemp = request.getParameter("id");
		String name = request.getParameter("name");
		String uname = request.getParameter("userName");
		String pass = request.getParameter("password1");
		String address = request.getParameter("address");
		String contactNum = request.getParameter("contactNumber");
		String zip = request.getParameter("zip");
		
		int id = Integer.parseInt(idTemp); //convert string type idTemp to int type
		
		 User customer = User.getUser(); //create object from user model class
		
		//set values to user model class's attributes
		customer.setId(id);
		customer.setName(name);
		customer.setUserName(uname);
		customer.setPassword1(pass);
		customer.setAddress(address);
		customer.setContactNumber(contactNum);
		customer.setZip(zip);
		
		EditCustomerByAdminDAO editCustomerByAdminDAO = new EditCustomerByAdminDAO(); //create object from EditCustomerByAdminDAO class
		
		String ans = editCustomerByAdminDAO.isCustomerEdited(customer); // pass customer object to DAO class's method

		if (ans == CommonConstants.returnValSuccess) {  // if return value of EditCustomerByAdminDAO class == SUCCESS , then redirect to customer list
			
			response.sendRedirect("customerList.jsp");
			
		}
		
	}

}