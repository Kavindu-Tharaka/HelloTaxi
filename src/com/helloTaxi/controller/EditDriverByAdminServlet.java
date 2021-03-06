package com.helloTaxi.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.helloTaxi.DAO.AddDriverByAdminDAO;
import com.helloTaxi.DAO.EditDriverByAdminDAO;
import com.helloTaxi.model.User;
import com.helloTaxi.util.CommonConstants;

/**
 * Servlet implementation class EditDriverByAdminServlet
 */
@WebServlet("/EditDriverByAdminServlet")
public class EditDriverByAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditDriverByAdminServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		 //get values from the add driver by admin form and assign in to variables
		String idTemp = request.getParameter("id");
		 String name = request.getParameter("name");
		 String userName = request.getParameter("userName");
		 String address = request.getParameter("address");
		 String password1 = request.getParameter("password1");
		 String nic = request.getParameter("nic");
		 String driLicenseNum = request.getParameter("driLicenseNum");
		 String age = request.getParameter("age");
		 String gender = request.getParameter("gender");
		 String vType = request.getParameter("vType");
		 String vRegNum = request.getParameter("vRegNum");
		 
		int id = Integer.parseInt(idTemp); //convert string type idTemp to int type

		 
		 User driver = User.getUser();//create object from user model class

		 
		//assign input values to model class variables
		 driver.setId(id);
		 driver.setName(name);
		 driver.setUserName(userName);
		 driver.setAddress(address);
		 driver.setPassword1(password1); 
		 driver.setNic(nic);
		 driver.setDriLicenseNum(driLicenseNum);
		 driver.setAge(age);
		 driver.setGender(gender);
		 driver.setvType(vType);
		 driver.setvRegNum(vRegNum);
		 
		 EditDriverByAdminDAO editDriverByAdminDAO = new EditDriverByAdminDAO();//create object from AddDriverByAdminDAO class
		 
		 String userRegistered = editDriverByAdminDAO.isDriverEdited(driver);  //assign return value of AddDriverByAdminDAO class to a variable
		 
		 if(userRegistered.equals(CommonConstants.returnValSuccess)) // if return value of AddDriverByAdminDAO class == SUCCESS , then redirect to driver list
		 {
	
				response.sendRedirect("driverList.jsp");
		 }
		 
		 
	}

}
