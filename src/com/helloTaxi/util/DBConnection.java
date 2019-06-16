package com.helloTaxi.util;

import java.sql.Connection;
import java.sql.DriverManager;
 
public class DBConnection implements CommonConstants{
	
	//SINGLETON Design pattern for Database connection
	
	private static Connection conn;
	
	private DBConnection(){}
	
	public static Connection createConnection()
	{
		try
		{
			if(conn==null)   //if no Connection is created up to now
			{
				Class.forName(CommonConstants.jdbcDriver); //loading MySQL driver
				
				//assign connection to connection type variable. 
				conn = DriverManager.getConnection(CommonConstants.connectionURL,CommonConstants.dbUserName,CommonConstants.dbPasswaord);
				return conn; //return created connection
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return conn;  //if Connection is already created return it
	}
 

}