package com.helloTaxi.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.helloTaxi.util.DBConnection;

/**
 * Servlet implementation class DriverEditServlet
 */
@WebServlet("/DriverEditServlet")
public class DriverEditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DriverEditServlet() {
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

		 String idTemp = request.getParameter("id");
		 String name = request.getParameter("name");
		 String userName = request.getParameter("userName");
		 String address = request.getParameter("address");
		 String password1 = request.getParameter("password1");
		 String nic = request.getParameter("nic");
		 String driLicenseNum = request.getParameter("driLicenseNum");
		 String age = request.getParameter("age");
		 String gender = request.getParameter("gender");
		 String vType = request.getParameter("vType");
		 String vRegNum = request.getParameter("vRegNum");
		 
		 int id = Integer.parseInt(idTemp); //cast string type idTemp to int type
		
		
		Connection con = null;
		 PreparedStatement preparedStatement = null;
		 
		 
		 try
		 {
			 con = DBConnection.createConnection();		 //Cnnecting DB
			 
				int updateQuery = 0;
				
		        preparedStatement = null;

				    try{

				        String query = "update users set name=?,userName=?,password=?,address=?,nic=?,drivingLicenseNum=?,age=?,gender=?,vType=?,vRegNum=? where id= ? ";
				        preparedStatement = con.prepareStatement(query); //Reducing the complexity using preparestatement

						//assign values 
						 preparedStatement.setString(1, name);
						 preparedStatement.setString(2, userName);
						 preparedStatement.setString(3, password1);
						 preparedStatement.setString(4, address);
						 preparedStatement.setString(5, nic);
						 preparedStatement.setString(6, driLicenseNum);
						 preparedStatement.setString(7, age);
						 preparedStatement.setString(8, gender);
						 preparedStatement.setString(9, vType);
						 preparedStatement.setString(10, vRegNum);
				        preparedStatement.setInt(11,id);

				        updateQuery = preparedStatement.executeUpdate(); //executing update query

				        if(updateQuery!=0){
				            response.sendRedirect("driverProfile.jsp");
				        }

				    }

				    catch(Exception ex){
				        ex.printStackTrace();
				    }

		 }
		 
		 catch(Exception e)
		 {
			 e.printStackTrace();
		 }
		
		
		
		
	}

}
