package com.helloTaxi.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.helloTaxi.util.CommonConstants;
import com.helloTaxi.util.DBConnection;

/**
 * Servlet implementation class DriverDeleteServlet
 */
@WebServlet("/DriverDeleteServlet")
public class DriverDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DriverDeleteServlet() {
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
		int id = Integer.parseInt(idTemp);
		
		Connection con = null;
		 PreparedStatement preparedStatement = null;
		 int updateQuery;
		 		 		
		try {
			
			con = DBConnection.createConnection();		//create DB connection
		    String query = "DELETE FROM users WHERE id = ?";
		    preparedStatement = con.prepareStatement(query);
			preparedStatement.setInt(1, id);
		    updateQuery = preparedStatement.executeUpdate();  //executeUpdate execute the query and returns number of rows affected	   
		    
		    if (updateQuery != 0) {   //confirming row has been deleted
		    		response.sendRedirect("index.jsp");
		    }
		    
		} 
		
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
	}

}
