package com.helloTaxi.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.helloTaxi.DAO.LoginDAO;
import com.helloTaxi.model.User;
import com.helloTaxi.util.CommonConstants;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
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
		// TODO Auto-generated method stub
		doGet(request, response);
		
		
		//get values from the login form and assign in to variables
		String uname = request.getParameter("uname");
		String pass = request.getParameter("pass");
		
		 User customer = User.getUser(); //create object from user model class
		
		//assign input values to model class variables
		customer.setUserName(uname); 
		customer.setPassword1(pass);
		
		LoginDAO loginDAO = new LoginDAO();  //create LoginDAO class's object
		
		String isUserLogged = loginDAO.isUserLogged(customer);  //assign return value of loginDAO class to a variable
		 
		
		if (uname.equals("admin") && pass.equals("Admin9173")  ) {  //check user name and password are equal to given values

			HttpSession session = request.getSession();  //create session and assign to variable
			session.setAttribute("Admin", "Admin");  // add username ass attribute
			response.sendRedirect("adminDashBoard.jsp");  //redirect to adminDashBoard.jsp
			
		}

		else if ( isUserLogged.equals(CommonConstants.returnValSuccess) ) {   //check user name and password are equal to retrived values from DB
														//if true, isUserLogged() return "SUCCESS"

			HttpSession session = request.getSession(); //create session and assign to variable
			session.setAttribute("username", uname); // add username ass attribute
			response.sendRedirect("welcome.jsp"); //redirect to welcome.jsp
			
		}
		
		else {
			
			response.sendRedirect("incorrectCredentials.jsp");  //if user credentials are invalid redirect to this page

		}

	}

}
