package com.helloTaxi.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.helloTaxi.model.User;
import com.helloTaxi.util.DBConnection;


public class CustomerUpdateDAO {
	
	 public String isUpdateUserDao(User customer){
		 

			int id = customer.getId();
			String name = customer.getName();
			String userName = customer.getUserName();
			String passowrd = customer.getPassword1();
			String address = customer.getAddress();
			String contactNUmber = customer.getContactNumber();
			String zip = customer.getZip();
		 
		 
		 
		 Connection con = null;  /*initialize the connection variables*/
		 PreparedStatement preparedStatement = null; /*statement = null*/
		 
		 
		 try  /*statement that may cause an exception*/
		 {
			 con = DBConnection.createConnection();		 /*connecting to the server and database*/
			 
				int updateQuery = 0;
				
		        preparedStatement = null;

				    try{

				        String query = "update users set name=?,userName=?,password=?,address=?,contactNumber=?,zipCode=? where id= ? "; /*the query*/
				       
				        preparedStatement = con.prepareStatement(query);

				        /*assign values to ?s in query statment*/
				        preparedStatement.setString(1,name);
				        preparedStatement.setString(2,userName);
				        preparedStatement.setString(3,passowrd);
				        preparedStatement.setString(4,address);
				        preparedStatement.setString(5,contactNUmber);
				        preparedStatement.setString(6,zip);
				        preparedStatement.setInt(7,id);

				        updateQuery = preparedStatement.executeUpdate(); /*execute the query */

				        if(updateQuery!=0){
				            return "SUCCESS";  /*if updateQuery != 0  return 'SUCCESS'*/
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
		 
		 return "ERROR";  /*if failed, return 'ERROR'*/
	 }
	

}
