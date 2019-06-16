package com.helloTaxi.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.helloTaxi.DAO.CustomerDeleteDAO;
import com.helloTaxi.model.User;

/**
 * Servlet implementation class CustomerDeleteServlet
 */
@WebServlet("/CustomerDeleteServlet")
public class CustomerDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomerDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String ID = request.getParameter("id");  /*getParameter method of reqest object in JSP application*/
		
		int id = Integer.parseInt(ID); /*convert string in to integer and getParameter method of reqest object in JSP application*/
		
		 User customer = User.getUser(); /* Create a object from user model class*/
		
		
		customer.setId(id); /*setId for user Object*/
		
		CustomerDeleteDAO customerDeleteDAO = new CustomerDeleteDAO(); /*create object from CustomerDeleteDAO*/
		
		String ans = customerDeleteDAO.isCustomerDeleted(customer);  /*assign return value of customerDeleteDAO class to a variable*/
		
		if (ans == "SUCCESS") {  /*if the return value of customerDeleteDAO class == SUCCESS*/ 
			
			HttpSession session = request.getSession();
			session.removeAttribute("username");
			session.invalidate();
			response.sendRedirect("index.jsp");
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
