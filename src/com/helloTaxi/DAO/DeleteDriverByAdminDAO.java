package com.helloTaxi.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.helloTaxi.model.User;
import com.helloTaxi.util.CommonConstants;
import com.helloTaxi.util.DBConnection;

public class DeleteDriverByAdminDAO {
	
	public String isDriverDeleted(User driver)
	{
	
		 Connection con = null;
		 PreparedStatement preparedStatement = null;
		 int updateQuery;
		 		 
		 int id =  driver.getId(); //get value from User model class
		
		try {
			
			con = DBConnection.createConnection();		//create DB connection
		    String query = "DELETE FROM users WHERE id = ?";
		    preparedStatement = con.prepareStatement(query);
			preparedStatement.setInt(1, id);
		    updateQuery = preparedStatement.executeUpdate();  //executeUpdate execute the query and returns number of rows affected	   
		    
		    if (updateQuery != 0) {   //ensure row has been deleted
				return CommonConstants.returnValSuccess; // number of rows affected is not null, return "SUCCESS"
			}
		    
		} 
		
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return CommonConstants.returnValError; //if failed return ERROR

	}

}
