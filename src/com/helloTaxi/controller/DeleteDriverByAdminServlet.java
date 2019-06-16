package com.helloTaxi.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.helloTaxi.DAO.DeleteCustomerByAdminDAO;
import com.helloTaxi.DAO.DeleteDriverByAdminDAO;
import com.helloTaxi.model.User;
import com.helloTaxi.util.CommonConstants;

/**
 * Servlet implementation class DeleteDriverByAdminServlet
 */
@WebServlet("/deleteDriverServlet")
public class DeleteDriverByAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteDriverByAdminServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		String idTemp = request.getParameter("d");  //get the parameter(user ID) from url which send from driverList.jsp
		int id = Integer.parseInt(idTemp); //convert sting type ID to interger type
		
		User driver = User.getUser(); //create object from user model class
		
		driver.setId(id); //assign value of id to attribute of user model class
		
		DeleteDriverByAdminDAO deleteDriverDAO = new DeleteDriverByAdminDAO(); //create object from DeleteDriverByAdminDAO class
		
		String ans = deleteDriverDAO.isDriverDeleted(driver); //assign return value of DeleteDriverByAdminDAO class's method to variable
		
		if (ans == CommonConstants.returnValSuccess) {
			response.sendRedirect("driverList.jsp");  //if return value == "SUCCESS" redirect to driverList.jsp 
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
