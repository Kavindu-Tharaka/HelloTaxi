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

import com.helloTaxi.util.DBConnection;

/**
 * Servlet implementation class BookVehicleServlet
 */
@WebServlet("/BookVehicleServlet")
public class BookVehicleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookVehicleServlet() {
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


		
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String rNumber = request.getParameter("rNumber");
		String tNumber = request.getParameter("tNumber");
		String vType = request.getParameter("vType");
		String date = request.getParameter("date");
		String time = request.getParameter("time");
		String pLocation = request.getParameter("pLocation");
		String dLocation = request.getParameter("dLocation");
		String disTemp = request.getParameter("dis");
		String cost = request.getParameter("cost");
		
		int dis = Integer.parseInt(disTemp);
		
		 Connection con = null;
		 PreparedStatement preparedStatement = null;
		
		 try
		 {
			 con = DBConnection.createConnection();  //create DB connection
			 
			 String query = "insert into Reservation(ID,fname,lname,rNumber,tNumber,vType,date_,time_,pLocation,dLocation,dis,cost) values (NULL,?,?,?,?,?,?,?,?,?,?,?)"; //Insert user details into the table 'users'
			 preparedStatement = con.prepareStatement(query); //prepareStatement is used to reduce complexity of normal statement
			 
			//assign values to ?s in query statment
			 preparedStatement.setString(1, fname);
			 preparedStatement.setString(2, lname);
			 preparedStatement.setString(3, rNumber);
			 preparedStatement.setString(4, tNumber);
			 preparedStatement.setString(5, vType);
			 preparedStatement.setString(6, date);
			 preparedStatement.setString(7, time);
			 preparedStatement.setString(8, pLocation);
			 preparedStatement.setString(9, dLocation);
			 preparedStatement.setInt(10, dis);
			 preparedStatement.setString(11, cost);
			 
			 int i= preparedStatement.executeUpdate();   //execute the query. executeUpdate returns number of affected rows
			 
			 if (i != 0) //ensure data has been inserted into the database . if it is return redirects to thankYou.jsp
			 {
				response.sendRedirect("thankYou.jsp");
			 }
		 }
		 
		 catch(SQLException e)
		 {
			 e.printStackTrace();
		 }
		 
		 
	}

}
