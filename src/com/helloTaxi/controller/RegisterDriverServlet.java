package com.helloTaxi.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Driver_VehicleRegisterServlet
 */
@WebServlet("/RegisterDriverServlet")
public class RegisterDriverServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterDriverServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
				
		String name = request.getParameter("name");
		String username = request.getParameter("uname");
		String password = request.getParameter("rpwd");
		String address = request.getParameter("add");
		String nic = request.getParameter("nic");
		String licen = request.getParameter("licen");
		String age = request.getParameter("age");
		String gender = request.getParameter("gender");
		String type =request.getParameter("type");
		String vehicle_regno = request.getParameter("vreg_no");
				
		 Connection con = null;
		 PreparedStatement preparedStatement = null;
		
		try {
			
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hellotaxi","root","91739173");
			/*Statement stmt = con.createStatement();*/
			
			//stmt.executeUpdate("insert into DriverRegistration values ("+name+" , "+username+" , "+password+" , "+address+" , "+nic+" , "+licen+" , "+age+" , "+gender+" , "+type+", "+vehicle_regno+") "); 
			
			 String query = "insert into users(ID,name,userName,password,address,zipCode,contactNumber,nic,drivingLicenseNum,age,gender,vType,vRegNum,type) values (NULL,?,?,?,?,NULL,NULL,?,?,?,?,?,?,?)"; //Insert user details into the table 'users'
			 preparedStatement = con.prepareStatement(query); //prepareStatement is used to reduce complexity of normal statement
			 
	 
			//String query = "insert into users values(NULL,?,?,?,?,NULL,NULL,?,?,?,?,?,?,?)";
			//preparedStatement = con.prepareStatement(query);*/
			
			//assign values to ?s in query(values which are getting from the user)
			 preparedStatement.setString(1, name);
			 preparedStatement.setString(2, username);
			 preparedStatement.setString(3, password);
			 preparedStatement.setString(4, address);
			 preparedStatement.setString(5, nic);
			 preparedStatement.setString(6, licen);
			 preparedStatement.setString(7, age);
			 preparedStatement.setString(8, gender);
			 preparedStatement.setString(9, type);
			 preparedStatement.setString(10, vehicle_regno);
			 preparedStatement.setString(11, "driver");
			
			 int i= preparedStatement.executeUpdate();  
			 
			 if (i != 0) 
			 {
					HttpSession session = request.getSession();
					session.setAttribute("username", username);
					response.sendRedirect("welcome.jsp");
			 }
			
		} catch (Exception e) {
		
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
