package com.helloTaxi.DAO;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.helloTaxi.model.User;
import com.helloTaxi.util.DBConnection;
 
public class RegisterCustomerDAO {
	 
	 public String registerUser(User customer)
	 {
		 String name = customer.getName();
		 String address = customer.getAddress();
		 String userName = customer.getUserName();
		 String password1 = customer.getPassword1();
		 String contactNumber = customer.getContactNumber();
		 String zip = customer.getZip();
		 
		 Connection con = null; /*initialize the connection variables*/
		 PreparedStatement preparedStatement = null; /*statement = null*/
		 
		 try
		 {
			 con = DBConnection.createConnection(); /*connecting to the server and database*/
			 
			 String query = "insert into users(ID,name,userName,password,address,zipCode,contactNumber,nic,drivingLicenseNum,age,type) values (NULL,?,?,?,?,?,?,NULL,NULL,NULL,?)"; /*Insert user details into the table 'users'*/
			 preparedStatement = con.prepareStatement(query); /*prepareStatement is used to reduce complexity of normal statement*/
			 
			/*assign values to ?s in query statment*/
			 preparedStatement.setString(1, name);
			 preparedStatement.setString(2, userName);
			 preparedStatement.setString(3, password1);
			 preparedStatement.setString(4, address);
			 preparedStatement.setString(5, zip);
			 preparedStatement.setString(6, contactNumber);
			 preparedStatement.setString(7, "customer");
			 
			 int i= preparedStatement.executeUpdate();    /*execute the query*/
			 
			 if (i != 0) /*ensure data has been inserted into the database*/
			 {
				 return "SUCCESS"; 
			 }
		 }
		 
		 catch(SQLException e)
		 {
			 e.printStackTrace();
		 }
		 
		 return "ERROR";  /*if failed, return "ERROR"*/
	 }
}