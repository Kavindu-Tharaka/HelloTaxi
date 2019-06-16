package com.helloTaxi.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.helloTaxi.util.CommonConstants;
import com.helloTaxi.util.DBConnection;

/**
 * Servlet implementation class DriverRegisterServlet
 */
@WebServlet("/DriverRegisterServlet")
public class DriverRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DriverRegisterServlet() {
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


		 //get values from the add driver by admin form and assign in to variables
		 String name = request.getParameter("name");
		 String userName = request.getParameter("userName");
		 String address = request.getParameter("address");
		 String password1 = request.getParameter("password1");
		 String nic = request.getParameter("nic");
		 String driLicenseNum = request.getParameter("driLicenseNum");
		 String ageTemp = request.getParameter("age");
		 String gender = request.getParameter("gender");
		 String vType = request.getParameter("vType");
		 String vRegNum = request.getParameter("vRegNum");
		 
		 int age = Integer.parseInt(ageTemp);
		 
		 Connection con = null;
		 PreparedStatement preparedStatement = null;
		 
		 try
		 {
			 con = DBConnection.createConnection();  //create DB connection
			 
			 String query = "insert into users(ID,name,userName,password,address,zipCode,contactNumber,nic,drivingLicenseNum,age,gender,vType,vRegNum,type) values (NULL,?,?,?,?,NULL,NULL,?,?,?,?,?,?,?)"; //Insert user details into the table 'users'
			 preparedStatement = con.prepareStatement(query); //prepareStatement is used to reduce complexity of normal statement
			 
			//assign values to ?s in query statment
			 preparedStatement.setString(1, name);
			 preparedStatement.setString(2, userName);
			 preparedStatement.setString(3, password1);
			 preparedStatement.setString(4, address);
			 preparedStatement.setString(5, nic);
			 preparedStatement.setString(6, driLicenseNum);
			 preparedStatement.setInt(7, age);   ////////////
			 preparedStatement.setString(8, gender);
			 preparedStatement.setString(9, vType);
			 preparedStatement.setString(10, vRegNum);
			 preparedStatement.setString(11, "driver");
						 
			 int i= preparedStatement.executeUpdate();   //execute the query. executeUpdate returns number of affected rows
			 
			 if (i != 0) //ensure data has been edited into the database . if it is return "SUCCESS"
			 {
					HttpSession session = request.getSession();
					session.setAttribute("username", userName);
					response.sendRedirect("welcome.jsp");			 }
		 }
		 
		 catch(SQLException e)
		 {
			 e.printStackTrace();
		 }
		 
		 
		 
		 
		 
		 
		 
	}

}
