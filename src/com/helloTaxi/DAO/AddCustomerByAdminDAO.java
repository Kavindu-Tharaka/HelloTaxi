package com.helloTaxi.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.helloTaxi.model.User;
import com.helloTaxi.util.CommonConstants;
import com.helloTaxi.util.DBConnection;

public class AddCustomerByAdminDAO implements CommonConstants {
	
	public String isCustomerAdded(User customer)
	 {
		 //get values from User model class and assign in to variables
		 String name = customer.getName();
		 String addr = customer.getAddress();
		 String uname = customer.getUserName();
		 String pass = customer.getPassword1();
		 String contactNum = customer.getContactNumber();
		 String zipCode = customer.getZip();
		 
		 Connection con = null;
		 PreparedStatement preparedStatement = null;
		 
		 try
		 {
			 con = DBConnection.createConnection();  //create DB connection
			 
			 String query = "insert into users(ID,name,userName,password,address,zipCode,contactNumber,nic,drivingLicenseNum,age,type) values (NULL,?,?,?,?,?,?,NULL,NULL,NULL,?)"; //Insert user details into the table 'users'
			 preparedStatement = con.prepareStatement(query); //prepareStatement is used to reduce complexity of normal statement
			 
			//assign values to ?s in query statment
			 preparedStatement.setString(1, name);
			 preparedStatement.setString(2, uname);
			 preparedStatement.setString(3, pass);
			 preparedStatement.setString(4, addr);
			 preparedStatement.setString(5, zipCode);
			 preparedStatement.setString(6, contactNum);
			 preparedStatement.setString(7, "customer");
			 
			 int i= preparedStatement.executeUpdate();   //execute the query. executeUpdate returns number of affected rows
			 
			 if (i != 0) //ensure data has been inserted into the database . if it is return "SUCCESS"
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
