package com.helloTaxi.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.helloTaxi.model.User;
import com.helloTaxi.util.CommonConstants;
import com.helloTaxi.util.DBConnection;

public class LoginDAO {
	
	 public String isUserLogged(User customer){
		 
		 //get values from user model class 
		 String uname = customer.getUserName();
		 String pass = customer.getPassword1();
		 
		 Connection con = null;
		 PreparedStatement preparedStatement = null;
		 
		 
		 try
		 {
			 con = DBConnection.createConnection();		//create DB connection
			 
			 String query = "select userName from users where userName = ? and password = ?" ;			 
			 preparedStatement = con.prepareStatement(query); //prepareStatement is used to reduce complexity of normal statement
			
			//assign values to ?s in query statment
			 preparedStatement.setString(1, uname);  
			 preparedStatement.setString(2, pass);
			 
			 ResultSet rs= preparedStatement.executeQuery();   //execute the query
			 
			 //result will be come only there is a row for the user.it means he/she is a valid user
			 
			 rs.next();  //point to line by line
			 
			 String returnedName = rs.getString("userName"); //get userName column's data to a variable
			 
			 if (  returnedName.equals(uname) ) //ensure user input user name is match to data in table
			 {
				 return CommonConstants.returnValSuccess;  //if condition true, return 'SUCCESS'
			 }
		 }
		 
		 catch(Exception e) 
		 {
			 e.printStackTrace(); //if there is an exception print it
		 }
		 
		 return CommonConstants.returnValError;  // if failed, return "ERROR"
	 }
	
}
