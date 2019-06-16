package com.helloTaxi.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.helloTaxi.DAO.InsertInquiryDAO;
import com.helloTaxi.model.Inquiry;
import com.helloTaxi.util.CommonConstants;

/**
 * Servlet implementation class InquiryServlet
 */
@WebServlet("/InquiryServlet")
public class InsertInquiryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertInquiryServlet() {
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

		//get values from inquiry form and assgin to variables
		String name = request.getParameter("userName");
		String msg = request.getParameter("msg");
		
		Inquiry inquiry = Inquiry.getInquiry(); //create  Inquiry class object
		
		//set values to attributes in Inquiry class
		inquiry.setMsg(msg);
		inquiry.setName(name);
		
		InsertInquiryDAO inquiryDAO = new InsertInquiryDAO();  //create  InsertInquiryDAO class object
		
		String ans = inquiryDAO.isInquirySaved(inquiry); //get return value to variable
		
		if (ans == CommonConstants.returnValSuccess) {  
			
			response.sendRedirect("welcome.jsp");  //redirect to welcome page
			
		}
		
	}

}
