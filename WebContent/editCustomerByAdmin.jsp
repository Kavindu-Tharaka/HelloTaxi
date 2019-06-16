<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.helloTaxi.util.DBConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

	<link rel="stylesheet" type="text/css" href="resources/css/main.css">
	<link rel="stylesheet" type="text/css" href="resources/css/bootstrap.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<title>Edit Customer</title>




<script> 
	function validateCustomerUpdate()
	{ 
		 var name = document.CustomerUpdate.name.value;
		 var userName = document.CustomerUpdate.userName.value;
		 var password1 = document.CustomerUpdate.password1.value; 
		 var password2 = document.CustomerUpdate.password2.value;
		 var address = document.CustomerUpdate.address.value;
		 var zip = document.CustomerUpdate.zip.value;
		 var contactNumber = document.CustomerUpdate.contactNumber.value;
		 
		 if (name == null || name == "")
		 { 
			 alert("Please Enter your name"); 
			 return false; 
		 }
		 else if (userName == null || userName == "")
		 { 
			 alert("Please Enter a user name for you"); 
			 return false; 
		 }
		 else if (password1 == null || password1 == "")
		 { 
			 alert("Password can't be blank"); 
			 return false; 
		 }
		 else if(password1.length < 6)
		 { 
			 alert("Enter password longer than 6 charachters"); 
			 return false; 
		 } 
		 else if (password2 == null || password2 == "")
		 { 
			 alert("Re-entered Password can't be blank"); 
			 return false; 
		 }
		 else if (password1 != password2)
		 { 
			 alert("Both Passwords should be same"); 
			 return false; 
		 } 
		 else if (address == null || address == "")
		 { 
			 alert("Please enter your address"); 
			 return false; 
		 }
		 else if (zip == null || zip == "")
		 { 
			 alert("Please enter ZIP code"); 
			 return false; 
		 }
		 else if (zip.length != 5)
		 { 
			 alert("ZIP code can contains only 5 numbers"); 
			 return false; 
		 }
		 else if (contactNumber == null || contactNumber == "")
		 { 
			 alert("Please enter a valid contact number"); 
			 return false; 
		 }
		 else if (contactNumber.length != 10 )
		 { 
			 alert("Contact Number can contains only 10 numbers"); 
			 return false; 
		 }
	 }
	
</script> 
</head>
<body>

	    <%
	    	response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");  //can not go back after logout
	    
			if (session.getAttribute("Admin") == null) {	
				response.sendRedirect("welcome.jsp"); //if user is not logged in as admin can not access this page
			}

		%>

<nav class="navbar navbar-expand-lg navbar-light bg-warning">
  <a class="navbar-brand font-weight-bold text-uppercase" href="adminDashBoard.jsp">hello ${Admin} </a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarTogglerDemo02">
    <ul class="navbar-nav mr-auto">
    </ul>   <!-- add for get Logout to right side -->

	<ul class="navbar-nav ">
	      <li class="nav-item">
	        <a class="nav-link" href="LogoutServlet" >Logout</a>
	      </li>
      </ul>
    
  </div>
</nav>

	<div aria-label="breadcrumb">
	  <ol class="breadcrumb bg-white">
	    <li class="breadcrumb-item"><a  class="text-dark" href="adminDashBoard.jsp">Admin DashBoard</a></li>
	    <li class="breadcrumb-item"><a  class="text-dark" href="customerList.jsp">Customer List</a></li>
	    <li class="breadcrumb-item active" aria-current="page">Edit Customer</li>
	  </ol>
	</div>


 

<main>

<p><br/></p>
        <%
        
		Connection con = null;
        PreparedStatement preparedStatement = null;
        ResultSet rs = null;
        %>



        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="row">
                    <div class="col-md-6"><h3>Edit Customer Details</h3></div>

                </div>
                <p></p>
                <form name="CustomerUpdate" action=editCustomerServlet method="post"  onsubmit="return validateCustomerUpdate()">


                    <%

	                    con = DBConnection.createConnection();		//create BD connection
	                    
	                    String u = request.getParameter("u");  //get parameter (userID) from URL which send from customerList.jsp
	                    
	                    int id = Integer.parseInt(u); //convert id to integer
	                    
	                    String Data = "select * from users where id= ? ";
	                    
		       			preparedStatement = con.prepareStatement(Data); //prepareStatement is used to reduce complexity of normal statement
		
		        			//assign values to ?s in query statment
		       			preparedStatement.setInt(1, id);  
		       			 
		       			rs= preparedStatement.executeQuery();   //execute the query

                    
                    while (rs.next()) {   //next() method point to next row and check wether there is next row
                    %>  


                    <input type="hidden" name="id" value='<%=rs.getString("ID")%>'/>
                    <div class="form-group">
                        <label for="">Name</label>
                        <input type="text" class="form-control" id="" name="name" value='<%=rs.getString("name")%>'>
                    </div>
                    <div class="form-group">
                        <label for="">User Name</label>
                        <input type="text" class="form-control" id="" name="userName" value='<%=rs.getString("userName")%>'>
                    </div>
                    <div class="form-group">
                        <label for="">Password</label>
                        <input type="text" class="form-control" id="" name="password1" value='<%=rs.getString("password")%>'>
                    </div>
                    <div class="form-group">
                        <label for="">Re-Enter Password</label>
                        <input type="text" class="form-control" id="" name="password2" value='<%=rs.getString("password")%>'>
                    </div>
                    <div class="form-group">
                        <label for="">Address</label>
                        <input type="text" class="form-control" id="" name="address" value='<%=rs.getString("address")%>'>
                    </div>
                    <div class="form-group">
                        <label for="">Contact Number</label>
                        <input type="text" class="form-control" id="" name="contactNumber" value='<%=rs.getString("contactNumber")%>'>
                    </div>
                    <div class="form-group">
                        <label for="">ZIP</label>
                        <input type="text" class="form-control" id="" name="zip" value='<%=rs.getString("zipCode")%>'>
                    </div>

                    <%   
                    }
                    %>
                    <button type="submit" class="btn btn-warning">Update</button>
                </form>
            </div>
        </div>





</main>

<br><br>


<!-- Footer -->
<footer class="page-footer font-small bg-dark ">


  <!-- Footer Links -->
  <div class="container-fluid text-center ">

    <!-- Grid row -->
    <div class="row">

      <!-- Grid column -->
      <div class="col-md-6 ">

        <!-- Content -->
        <h5 class="text-uppercase text-light">About us</h5>
        <p class=" text-light">
          What we're about
		We want to make renting a car as simple and personal as driving your own.

		Renting a car brings you freedom, and we will help you find the right car for you at a great price. But there is much more to us than that. We are here to make renting a car a lot less hassle.
      
  
        
          Making sure you have a great experience every time you rent a car makes us happy.

		We are a broker, so we arrange the car rental on your behalf. We use our massive buying power to bring you great deals.
        </p>

      </div>
      <!-- Grid column -->

      <hr class="clearfix w-100 d-md-none pb-3">  <!-- active when reduce screen resolution -->

      <!-- Grid column -->
      <div class="col-md-6">

          <!-- Links -->
          <h5 class="text-uppercase text-light">USEFUL WEBSITES</h5>

          <ul class="list-unstyled" >  <!-- list-unstyled is for remove bulletpoints -->
            <li>
              <a href="http://www.srilankan.com/" >Sri Lankan Airlines </a>
            </li>
            <li>
              <a href="http://www.srilanka.travel/" >Sri lankan Tourist board</a>
            </li>
            <li>
              <a href="https://www.airport.lk/" >Bandaranike International Airport</a>
            </li>
            <li>
              <a href="http://www.motortraffic.gov.lk/" >Department of motor traffic - Sri Lanka</a>
            </li>
          </ul>

        </div>
		<!-- Grid column -->



    </div>
    <!-- Grid row -->

  </div>
  <!-- Footer Links -->



 <div class="row">
  <div class="col-4">
  </div>
  <div class="col-6">
    <ul>
          <li class="socialMedia "><a href="#"  ><i class="fa fa-facebook"></i></a></li>
          <li class="socialMedia"><a href="#"  ><i class="fa fa-twitter"></i></a></li>
          <li class="socialMedia"><a href="#"  ><i class="fa fa-google"></i></a></li>
          <li class="socialMedia"><a href="#"  ><i class="fa fa-linkedin"></i></a></li>
          <li class="socialMedia"><a href="#"  ><i class="fa fa-instagram"></i></a></li>
          <li class="socialMedia"><a href="#"  ><i class="fa fa-pinterest"></i></a></li>
          </ul>
         

    </div>
	</div> 


</footer>
<!-- Footer -->



  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>


</body>
</html>