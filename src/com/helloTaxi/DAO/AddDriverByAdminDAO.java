package com.helloTaxi.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.helloTaxi.model.User;
import com.helloTaxi.util.CommonConstants;
import com.helloTaxi.util.DBConnection;

public class AddDriverByAdminDAO implements CommonConstants{
	
	public String isDriverAdded(User driver)
	 {
		 //get values from user model class and assign in to variables
		 String name = driver.getName();
		 String userName = driver.getUserName();
		 String address = driver.getAddress();
		 String password1 = driver.getPassword1();
		 String nic = driver.getNic();
		 String driLicenseNum = driver.getDriLicenseNum();
		 String ageTemp = driver.getAge();
		 String gender = driver.getGender();
		 String vType = driver.getvType();
		 String vRegNum = driver.getvRegNum();
		 
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
