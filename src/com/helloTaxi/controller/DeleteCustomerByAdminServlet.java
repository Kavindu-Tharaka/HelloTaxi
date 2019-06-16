package com.helloTaxi.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.helloTaxi.DAO.DeleteCustomerByAdminDAO;
import com.helloTaxi.model.User;
import com.helloTaxi.util.CommonConstants;

/**
 * Servlet implementation class deleteUserServlet
 */
@WebServlet("/deleteUserServlet")
public class DeleteCustomerByAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteCustomerByAdminServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		String idTemp = request.getParameter("d");  //get the parameter(user ID) from url which send from customerList.jsp
		int id = Integer.parseInt(idTemp); //convert sting type ID to interger type
		
		 User customer = User.getUser(); //create object from User model class
		
		customer.setId(id); //assign value of id to attribute of User model class
		
		DeleteCustomerByAdminDAO deleteCustomerDAO = new DeleteCustomerByAdminDAO(); //create object from DeleteCustomerByAdminDAO class
		
		String ans = deleteCustomerDAO.isCustomerDeleted(customer); //assign return value of DeleteCustomerByAdminDAO class's method to variable
		
		if (ans == CommonConstants.returnValSuccess) {
			response.sendRedirect("customerList.jsp");  //if return value == "SUCCESS" redirect to customerList.jsp 
		}
	}

}
