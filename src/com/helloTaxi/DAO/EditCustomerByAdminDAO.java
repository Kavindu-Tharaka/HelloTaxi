package com.helloTaxi.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.helloTaxi.model.User;
import com.helloTaxi.util.CommonConstants;
import com.helloTaxi.util.DBConnection;

public class EditCustomerByAdminDAO {
	
	 public String isCustomerEdited(User customer){
		 
		 //get values from user model class and assign in to variables

			int id = customer.getId();
			String name = customer.getName();
			String userName = customer.getUserName();
			String passowrd = customer.getPassword1();
			String address = customer.getAddress();
			String contactNUmber = customer.getContactNumber();
			String zip = customer.getZip();
		 
		 
		 
		 Connection con = null;
		 PreparedStatement preparedStatement = null;
		 
		 
		 try
		 {
			 con = DBConnection.createConnection();		 //create DB connection
			 
				int updateQuery = 0;
				
		        preparedStatement = null;

				    try{

				        String query = "update users set name=?,userName=?,password=?,address=?,contactNumber=?,zipCode=? where id= ? ";
				        preparedStatement = con.prepareStatement(query); //prepareStatement is used to reduce complexity of normal statement

						//assign values to ?s in query statment
				        preparedStatement.setString(1,name);
				        preparedStatement.setString(2,userName);
				        preparedStatement.setString(3,passowrd);
				        preparedStatement.setString(4,address);
				        preparedStatement.setString(5,contactNUmber);
				        preparedStatement.setString(6,zip);
				        preparedStatement.setInt(7,id);

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