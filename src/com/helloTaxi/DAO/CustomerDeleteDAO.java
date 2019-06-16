package com.helloTaxi.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.helloTaxi.model.User;
import com.helloTaxi.util.DBConnection;


public class CustomerDeleteDAO {
	
	public String isCustomerDeleted(User customer)
	{
	
		 Connection con = null; /*initialize the connection variable*/
		 PreparedStatement preparedStatement = null;
		 int updateQuery;
		 		 
		 int id =  customer.getId();
		
		try { /*statement that may cause an exception*/
			
			con = DBConnection.createConnection();		/*connecting to the server and database*/
		    String query = "DELETE FROM users WHERE id = ?";  /*create mysql  delete statement*/
		    preparedStatement = con.prepareStatement(query);
			preparedStatement.setInt(1, id);   /*delete a row where the id ,wich is in record  */
		    updateQuery = preparedStatement.executeUpdate();	/*excute update sql statement*/	    
		    
		    if (updateQuery != 0) {  /*if updateQuery != 0  return 'SUCCESS'*/
				return "SUCCESS";
			}
		    
		} 
		
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return "ERROR"; /*if failed, return 'ERROR'*/

	}
}