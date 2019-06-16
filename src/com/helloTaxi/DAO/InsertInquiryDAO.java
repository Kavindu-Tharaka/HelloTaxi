package com.helloTaxi.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.helloTaxi.model.Inquiry;
import com.helloTaxi.util.CommonConstants;
import com.helloTaxi.util.DBConnection;

public class InsertInquiryDAO {
	
	 public String isInquirySaved(Inquiry inquiry){
		 
		 //get values from Inquiry model class
		 String name = inquiry.getName();
		 String msg = inquiry.getMsg();
		 
		 Connection con = null;
		 PreparedStatement preparedStatement = null;
		 
		 
		 try
		 {
			 con = DBConnection.createConnection();		
			 
			 String query = "insert into Inquiry values( NULL, ?, ? )" ;			 
			 preparedStatement = con.prepareStatement(query); //prepareStatement is used to reduce complexity of normal statement
			
			//assign values to ?s in query statment
			 preparedStatement.setString(1, name);  
			 preparedStatement.setString(2, msg);
			 
			 int numRows= preparedStatement.executeUpdate();   //execute the query and return number of affected rows
			 
			 if ( numRows != 0 ) //ensure data has been inserted into the database . if it is return "SUCCESS"
			 {
				 return CommonConstants.returnValSuccess; 
			 }
		 }
		 
		 catch(SQLException e)
		 {
			 e.printStackTrace();
		 }
		 
		 return CommonConstants.returnValError;  // if failed, return "ERROR"
	 }

}
