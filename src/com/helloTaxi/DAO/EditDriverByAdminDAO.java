package com.helloTaxi.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.helloTaxi.model.User;
import com.helloTaxi.util.CommonConstants;
import com.helloTaxi.util.DBConnection;

public class EditDriverByAdminDAO {

	
	public String isDriverEdited(User driver){
		 
		 //get values from user model class and assign in to variables
		 int id = driver.getId();
		 String name = driver.getName();
		 String userName = driver.getUserName();
		 String address = driver.getAddress();
		 String password1 = driver.getPassword1();
		 String nic = driver.getNic();
		 String driLicenseNum = driver.getDriLicenseNum();
		 String age = driver.getAge();
		 String gender = driver.getGender();
		 String vType = driver.getvType();
		 String vRegNum = driver.getvRegNum();
		 
		 
		 
		 Connection con = null;
		 PreparedStatement preparedStatement = null;
		 
		 
		 try
		 {
			 con = DBConnection.createConnection();		 //create DB connection
			 
				int updateQuery = 0;
				
		        preparedStatement = null;

				    try{

				        String query = "update users set name=?,userName=?,password=?,address=?,nic=?,drivingLicenseNum=?,age=?,gender=?,vType=?,vRegNum=? where id= ? ";
				        preparedStatement = con.prepareStatement(query); //prepareStatement is used to reduce complexity of normal statement

						//assign values to ?s in query statment
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

				        updateQuery = preparedStatement.executeUpdate(); //execute the query and return number of affected rows

				        if(updateQuery!=0){
				            return CommonConstants.returnValSuccess; //ensure data has been inserted(edited) into the database . if it is return "SUCCESS"
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
		 
		 return CommonConstants.returnValError;   //if failed, return "ERROR"
	 }
	
	
}
