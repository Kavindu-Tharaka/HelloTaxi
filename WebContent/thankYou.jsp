<!-- START DATABASE CONNECTION CHAMIKA -->

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%

String driver = "com.mysql.jdbc.Driver";




String url = "jdbc:mysql://localhost:3306/hellotaxi"; //path to database
String database = "Reservation";
String username = "root"; //db username
String password = "91739173"; //db password


try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

Statement statement = null;
ResultSet resultSet = null;
Connection connection = null;
%>
<!--(END)DATABASE CONNECTION //CHAMIKA -->

<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
    
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

	<link rel="stylesheet" type="text/css" href="resources/css/main.css">
	<link rel="stylesheet" type="text/css" href="resources/css/bootstrap.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<title>Home</title>

<script> 
	function validateCustomerRegister()
	{ 
		 var name = document.customerRegister.name.value;
		 var userName = document.customerRegister.userName.value;
		 var password1 = document.customerRegister.password1.value; 
		 var password2 = document.customerRegister.password2.value;
		 var address = document.customerRegister.address.value;
		 var zip = document.customerRegister.zip.value;
		 var contactNumber = document.customerRegister.contactNumber.value;
		 
		 if (name == null || name == "")
		 { 
			 alert("Name can't be blank"); 
			 return false; 
		 }
		 else if (userName == null || userName == "")
		 { 
			 alert("User Name can't be blank"); 
			 return false; 
		 }
		 else if (password1 == null || password1 == "")
		 { 
			 alert("Password can't be blank"); 
			 return false; 
		 }
		 else if(password1.length < 6)
		 { 
			 alert("Password must be at least 6 characters long."); 
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
			 alert("Address can't be blank"); 
			 return false; 
		 }
		 else if (zip == null || zip == "")
		 { 
			 alert("ZIP code can't be blank"); 
			 return false; 
		 }
		 else if (zip.length != 5)
		 { 
			 alert("ZIP code has only 5 numbers"); 
			 return false; 
		 }
		 else if (contactNumber == null || contactNumber == "")
		 { 
			 alert("Contact Number can't be blank"); 
			 return false; 
		 }
		 else if (contactNumber.length != 10 )
		 { 
			 alert("Contact Number has only 10 digits"); 
			 return false; 
		 }
		 
		 
	 } 
	<!--(START)BOOK VEHICLE FORM VALIDATIONS //CHAMIKA -->
	 function validateBOOK()
     {
         var fname = document.bookVehicle.fname.value;
         var lname = document.bookVehicle.lname.value;
         var rNumber = document.bookVehicle.rNumber.value;
         var tNumber = document.bookVehicle.tNumber.value;
         var vType = document.bookVehicle.vType.value;
         var date = document.bookVehicle.date.value;
         var time = document.bookVehicle.time.value;
         var pLocation = document.bookVehicle.pLocation.value;
         var dLocation = document.bookVehicle.dLocation.value;
         var dInKm = document.bookVehicle.dInKm.value;
         var cDate = new Date();
         var nu = dInKm/dInKm;

         if (fname == null || fname == "")
		 { 
			 alert("First name can't be blank"); 
			 return false; 
		 }
         else if (lname == null || lname == "")
		 { 
			 alert("Last name can't be blank"); 
			 return false; 
		 }
         else if(tNumber.length < 10 || tNumber.length > 10 )
		 { 
			 alert("Telephone number can be only 10 characters long."); 
			 return false; 
		 } 
         else if (vType == null || vType == "")
		 { 
			 alert("Please enter a vehicle type"); 
			 return false; 
		 }
         else if (date < cDate)
     {
       alert("Please enter a valid date"); 
			 return false; 
     }
        else if( (pLocation == null || pLocation == ""))
     {
      alert("Pickup location can't be blank"); 
			 return false;
     }
       else if( (dLocation == null || dLocation == ""))
     {
      alert("Dropoff location can't be blank"); 
			 return false;
     }
     else if( (dInKm == null || dInKm == ""|| nu!=1 ))
     {
      alert("Enter a valid distance "); 
			 return false;
     }




     }
		<!--(END)BOOK VEHICLE FORM VALIDATIONS //CHAMIKA -->
		
		
		
		<!--(START) VEHICLE FARE CALCULATION //CHAMIKA -->
  function calcFare()
  {
	  
      var dis = parseInt(document.getElementById('dis').value);
      var vType =  (document.getElementById('vType').value);
      
      if(dis == null){
    	  return false;
      }
     

      if(vType=='1')
      {
         var cost = parseFloat(document.bookVehicle.cost.value = "Rs."+60*dis+".00");
      }
      else if(vType=='2')
      {
         var cost = parseFloat(document.bookVehicle.cost.value = "Rs."+85*dis+".00");
      }
      else if(vType=='3')
      {
         var cost = parseFloat(document.bookVehicle.cost.value = "Rs."+100*dis+".00");
      }
      else if(vType=='4')
      {
         var cost = parseFloat(document.bookVehicle.cost.value = "Rs."+150*dis+".00");
      }
      else if(vType=='5')
      {
         var cost = parseFloat(document.bookVehicle.cost.value = "Rs."+300*dis+".00");
      }
  }
  <!--(END) VEHICLE FARE CALCULATION //CHAMIKA -->
  
  
  
  
  
  

	function validateLogin()  
	{ 
		 var uname = document.login.uname.value;
		 var pass = document.login.pass.value; 

		 if (uname == null || uname == "")
		 { 
			 alert("Please Enter Valid User Name...!!!"); 
			 return false; 
		 }

		 else if (pass == null || pass == "")
		 { 
			 alert("Please Enter Password...!!!"); 
			 return false; 
		 }
	 } 

	function validateInquiry()
	{ 
		 var uname = document.inquiry.userName.value;
		 var pass = document.inquiry.msg.value; 

		 if (userName == null || userName == "")
		 { 
			 alert("Please Enter User Name...!!!"); 
			 return false; 
		 }

		 else if (msg == null || msg == "")
		 { 
			 alert("Please Enter Messege...!!!"); 
			 return false; 
		 }
	 } 

     
	
</script> 


</head>
<body>
	    <%
	    	response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");  //can not go back after logout
	    	    	
			if (session.getAttribute("username") == null && session.getAttribute("Admin") == null ) {	
				response.sendRedirect("index.jsp");//if user is not logged in can not access this page
			}
	    	
		%>

<nav class="navbar navbar-expand-lg navbar-light bg-warning">
  <a class="navbar-brand font-weight-bold" href="welcome.jsp">HELLO TAXI</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  
  

  <div class="collapse navbar-collapse" id="navbarTogglerDemo02">
    <ul class="navbar-nav mr-auto mt-2 mt-lg-0">

      <li class="nav-item">
        <a class="nav-link" href="#" tabindex="-1" data-toggle="modal" data-target="#myModal-write-to-us" ></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#" tabindex="-1" data-toggle="modal" data-target="#book-vehicle-form" >BOOK YOUR VEHICLE</a>
      </li>
    </ul>

	<ul class="navbar-nav  mt-2  ">
	    <span>&nbsp &nbsp</span>
	      <li class="nav-item">
	        <a class="nav-link" href="#" data-toggle="modal" data-target="#myModal-login">Login</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="#" data-toggle="modal" data-target="#myModal-customer-signup">Customer SignUp</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="#" data-toggle="modal" data-target="#myModal-driver-signup">Driver SignUp</a>
          </li>
      </ul>
    
  </div>
</nav>



 <!--(START)BOOK VEHICLE BUTTON  FORM //CHAMIKA -->
 
<div class="container">

  
    <div class="modal fade" id="book-vehicle-form" role="dialog">
      <div class="modal-dialog">
      
  
        <div class="modal-content">
          <div class="modal-header">
            <h4 class="modal-title">Book Your Vehicle Here</h4>
          </div>
          <div class="modal-body">
            <form action="BookVehicleServlet" method="post" class="" name="bookVehicle" onsubmit="return validateBOOK()">
  
    <!--.............................................................. -->         
    <div class="form-row">
      
      <div class="col-md-6 mb-3">
        <label for="">First name</label>
        <input type="text" name ="fname" class="form-control" id="" placeholder="Last name" >
  
      </div>
  
      <div class="col-md-6 mb-3">
          <label for="">Last name</label>
          <input type="text" name ="lname" class="form-control" id="" placeholder="Last name" >
    
        </div>
     
    </div>
   <!--.............................................................. -->    
    <div class="form-row">
        <div class="col-md-6 mb-3">
          <label for="">REG Number</label>
          <input type="text" name ="rNumber" class="form-control" id="" placeholder="C123456" >
    
        </div>
        <div class="col-md-6 mb-3">
          <label for="">Telephone Number</label>
          <input type="text" name ="tNumber" class="form-control" id="" placeholder="071*******" >
    
        </div>
       
      </div>
  
    <!--.............................................................. -->       
  
      <div class="form-row">
        <div class="col-md-6 mb-3">
      <label for="">Vehicle type</label>
     
        <select id='vType' class="form-control" name ="vType">
            <option value ="1" class="form-control">Tuk Tuk</option>
            <option value ="2" class="form-control">Mini Car</option>
            <option value ="3" class="form-control">Car</option>
            <option value ="4" class="form-control">Van</option>
            <option value ="5" class="form-control">Coach</option>
        </select>
    </div>	</div>
  
   <!--.............................................................. -->    
  
    <div class="form-row">
      
                <div class="col-md-6 mb-3">
                  <label for="">Date</label>
                  <input type="date" name ="date" class="form-control" id=""  >
              </div>
        
                <div class="col-md-6 mb-3">
                  <label for="">Time</label>
                  <input type="time" name ="time" class="form-control" id=""  >
                </div>
    </div>
       
   <!--.............................................................. -->  
    
   <div class="form-row">    
              <div class="col-md-6 mb-3">
                <label for="">Pick-up Location </label>
                <input type="text" name ="pLocation" class="form-control" id="" placeholder="pettah bus terminal " >
  
              </div>
  
              <div class="col-md-6 mb-3">
                <label for="">Drop-off Location</label>
                <input type="text" name ="dLocation" class="form-control" id="" placeholder="National Hospital">
  
              </div>
  
  
    </div>

    <div class="form-row"> 

              
             <div class="col-md-6 mb-3">
                <label for="">Distance in Km</label>
                <input type="text" name ="dis" class="form-control" id="dis" placeholder="8Km" >

              </div>

              <div class="col-md-6 mb-3">
              <label for="">Approximate cost  </label>
              <input type="text" name ="pLocation" class="form-control" id="cost" placeholder="Rs.800.00" >
              </div>
    </div>  

   <!--.............................................................. -->    
    
    <button class="btn btn-warning" type ='button' onclick=" return calcFare()"  name ='result'>Check fare</button>
    <span>&nbsp;</span>
    <button class="btn btn-warning" type="reset">Clear</button>
    <span style="margin-left: 37%"></span>
    <button class="btn btn-warning" type="submit" >BOOK NOW</button>
    
  
  </form>
          </div>
        </div>
        
      </div>
    </div>
    
  </div>
  
  
  
  
  <!--(END)BOOK VEHICLE BUTTON  FORM //CHAMIKA -->
  
  





<div class="container">

  <!-- Modal login-->
  <div class="modal fade" id="myModal-login" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">Login</h4>

        </div>
        <div class="modal-body">
            <form action="Login" method="post" class="" name="login" onsubmit="return validateLogin()">            

  <div class="form-row">
    
    <div class="col-md-12">
      <label for="">User Name</label>
      <input type="text" name="uname" class="form-control" id="" placeholder="User name" >

    </div>
    <div class="col-md-12">
      <label for="">Password</label>
      <input type="password" name="pass" class="form-control" id="" placeholder="Password" >
    </div>
  </div>
</br>
  <button class="btn btn-warning" type="submit">Login</button>
  <span>&nbsp;</span>
  <button class="btn btn-warning" type="reset">Clear</button>
</form>
        </div>
      </div>
      
    </div>
  </div>
  
</div><!-- Modal login-->


<div class="container">

  <!-- Modal Customer signup-->  <!-- Shashini's part-->
  <div class="modal fade" id="myModal-customer-signup" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">Customer Sign Up</h4>
        </div>
        <div class="modal-body">
          <form action="RegisterCustomerServlet" name="customerRegister" method="post" class="" onsubmit="return validateCustomerRegister()">
          
  <div class="form-row">
    <div class="col-md-12 mb-3">
      <label for="">Name</label>
      <input type="text" name="name" class="form-control" id="" placeholder="Enter your Name" >

    </div>
    <div class="col-md-12 mb-3">
      <label for="">User name</label>
      <input type="text" name="userName" class="form-control" id="" placeholder="Enter your Username" >

    </div>
    
          <div class="col-md-6 mb-3">
      <label for="">Password</label>
      <input type="password" name="password1" class="form-control" id="" placeholder="Enter Password" >
    </div>
  
      <div class="col-md-6 mb-3">
      <label for="">Re-enter Password</label>
      <input type="password" name="password2" class="form-control" id="" placeholder="Re-Enter Password" >
    </div>
    
          <div class="col-md-12 mb-3">
      <label for="">Address</label>
      <input type="text" name="address" class="form-control" id="" placeholder="Enter Your Address" >
    </div>
    
          <div class="col-md-6 mb-3">
      <label for="">Contact Number</label>
      <input type="number" name="contactNumber" class="form-control" id="" placeholder="Contact Number" >
    </div>
    
             <div class="col-md-6 mb-3">
      <label for="">ZIP</label>
      <input type="number" name="zip" class="form-control" id="" placeholder="ZIP code" >
    </div>
    
  </div>

  
  <button class="btn btn-warning" type="submit">Register</button>
  <span>&nbsp;</span>
  <button class="btn btn-warning" type="reset">Clear</button>

</form>
        </div>
      </div>
      
    </div>
  </div>
  
</div><!-- Modal Customer signup--> <!-- Shashini's part-->


<div class="container">

    <!-- Modal driver signup-->    <!-- Savindri's part-->
    <div class="modal fade" id="myModal-driver-signup" role="dialog">
      <div class="modal-dialog">
      
        <!-- Modal content-->
        <div class="modal-content">
          <div class="modal-header">
            <h4 class="modal-title">Driver Sign Up</h4>
          </div>
          <div class="modal-body">
            <form action="addUserServlet" method="post" class="" >
            
    <div class="form-row">
<div class="col-md-12 mb-3">
      <label for="">Name</label>
      <input type="text" class="form-control" id="" placeholder="Enter your Name" required>

    </div>
    <div class="col-md-12 mb-3">
      <label for="">User name</label>
      <input type="text" class="form-control" id="" placeholder="Enter your Username" required>

    </div>
    
          <div class="col-md-6 mb-3">
      <label for="">Password</label>
      <input type="text" class="form-control" id="" placeholder="Enter Password" required>
    </div>
  
      <div class="col-md-6 mb-3">
      <label for="">Re-enter Password</label>
      <input type="text" class="form-control" id="" placeholder="Re-Enter Password" required>
    </div>
    
      <div class="col-md-12">
        <label for="">Address</label>
        <input type="text" class="form-control" id="" placeholder="Enter Your Address" required>

        </div>
        <br><br><br><br>
        <div class="col-md-5 mb-3">
          <label for="">NIC Number</label>
          <input type="text" class="form-control" id="" placeholder="NIC" required>
    
        </div>            
    
        <div class="col-md-7 mb-3">
          <label for="">Driver License Number</label>
          <input type="text" class="form-control" id="" placeholder="Driver License Number" required>
    
        </div>
        
          <div class="col-md-4 mb-3">
            <label for="">Age</label>
            <input type="text" class="form-control" id="" placeholder="Age" required>
      
          </div>         
            
     
    </div>
    


    <button class="btn btn-warning" type="submit">Sign Up</button>
    <span>&nbsp;</span>
    <button class="btn btn-warning" type="reset">Clear</button>
  
  </form>
          </div>
        </div>
        
      </div>
    </div>
    
  </div><!-- Modal driver signup-->  <!-- Savindri's part-->


<br>





<!--START booking Details (chamika) -->

<main class="container-fluid" >

	  
	  <div class = "container" >
<table class="table table-hover table-dark table-condensed" border="1">
<h1 align ="center" class="display-3">Booking Details</h1>

<%
try{
connection = DriverManager.getConnection(url, username, password); 
statement=connection.createStatement();
String sql ="select * from Reservation";
resultSet = statement.executeQuery(sql);
int i=0;
while(resultSet.next()){
%>
<tr>
	
	<th >Booking ID</th>
	   <th> <%=resultSet.getString("ID") %></th>
	  </tr>
	  <tr>

	   <th >First name</th>
	   <th> <%=resultSet.getString("fname") %></th>
	  </tr>
	  <tr>
	  
	  	<tr>
	   <th >Last name</th>
	   <th> <%=resultSet.getString("lname")  %></th>
	  </tr>
	  <tr>
	  
	  	<tr>
	   <th >Registration Number</th>
	   <th> <%=resultSet.getString("rNumber") %></th>
	  </tr>
	  <tr>
	  
	  <tr>
	   <th >Telephone Number</th>
	   <th> <%=resultSet.getString("tNumber")  %></th>
	  </tr>
	  <tr>
	  
	  	<tr>
	   <th >Vehicle Type</th>
	   <th> <%=resultSet.getString("vType") %></th>
	  </tr>
	  <tr>
	  
	  	<tr>
	   <th >Date</th>
	   <th> <%=resultSet.getString("date_") %></th>
	  </tr>
	  <tr>
	  
	  	<tr>
	   <th >Time</th>
	   <th> <%=resultSet.getString("time_") %></th>
	  </tr>
	  <tr>
	  
	  	<tr>
	   <th >Pick-up Location</th>
	   <th> <%=resultSet.getString("pLocation")%></th>
	  </tr>
	  <tr>
	  
	  	<tr>
	   <th >Drop-Off Location</th>
	   <th> <%=resultSet.getString("dLocation") %></th>
	  </tr>
	  <tr>
	  
	  	<tr>
	   <th >Distance</th>
	   <th> <%=resultSet.getInt("dis")+ " km" %></th>
	  </tr>
	  <tr>
	  
	  <tr>
	   <th >Approximate fare </th>
	   <th> <%=resultSet.getString("cost") %></th>
	  </tr>
	  <tr>
	  
	  <br>
	  
	

			

</table>
  <div class="row justify-content-md-center">
	  
	  		<form method="post"  >
			  <a href="welcome.jsp"><button type="button" class="btn btn-lg btn-warning">Confirm</button></a>
			  
			  <span>&nbsp &nbsp</span>
			   <a href="deleteBooking.jsp?id=<%=resultSet.getString("ID") %>" ><button type="button" class="btn btn-lg btn-secondary">Cancel  </button> </a>
		  	</form>
	  </div>
	  </div>
			

	  <%
i++;
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>

	  
	  
	  

<br>	  

<!--END booking Details (chamika) -->






<!-- Footer -->
<footer class="page-footer font-small blue bg-dark ">


  <!-- Footer Links -->
  <div class="container-fluid text-center ">

    <!-- Grid row -->
    <div class="row">

      <!-- Grid column -->
      <div class="col-md-6 m  t-md-0 mt-3">

        <!-- Content -->
        <h5 class="text-uppercase text-light">About us</h5>
        <p class=" text-light">
          What we're about
We want to make renting a car as simple and personal as driving your own.

Renting a car brings you freedom, and we’ll help you find the right car for you at a great price. But there’s much more to us than that. We're here to make renting a car a lot less hassle.
      
  
        
          Making sure you have a great experience every time you rent a car makes us happy.

We are a broker, so we arrange the car rental on your behalf. We use our massive buying power to bring you great deals.
        </p>

      </div>
      <!-- Grid column -->

      

      <!-- Grid column -->
     
        <!-- Grid column -->

        <!-- Grid column -->
        <div class="col-md-3 ">

          <!-- Links -->
          &nbsp;
          <h5 class="text-uppercase text-light"         style ="margin-right: -132%">USEFUL WEBSITES</h5>

          <ul class="list-unstyled" style ="margin-right: -110%">
            <li>
              <a href="http://www.srilankan.com/" style ="margin-right: -10%">Sri Lankan Airlines </a>
            </li>
            <li>
              <a href="http://www.srilanka.travel/"style ="margin-right: -10%" >Sri lankan Tourist board</a>
            </li>
            <li>
              <a href="https://www.airport.lk/" style ="margin-right: -10%">Bandaranike International Airport</a>
            </li>
            <li>
              <a href="http://www.motortraffic.gov.lk/" style ="margin-right: -10%">Department of motor traffic - Sri Lanka</a>
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
          <li class="socialMedia"><a href="https://www.facebook.com/"  ><i class="fa fa-facebook"></i></a></li>
          <li class="socialMedia"><a href="https://twitter.com/login?lang=en"  ><i class="fa fa-twitter"></i></a></li>
          <li class="socialMedia"><a href="https://www.google.com/"  ><i class="fa fa-google"></i></a></li>
          <li class="socialMedia"><a href="https://www.google.com/"  ><i class="fa fa-linkedin"></i></a></li>
          <li class="socialMedia"><a href="https://www.google.com/"  ><i class="fa fa-instagram"></i></a></li>
          <li class="socialMedia"><a href="https://www.google.com/"  ><i class="fa fa-pinterest"></i></a></li>
          </ul>
         
  </div>
  </div>
  <div class="col-1">
  </div>
</div>
<div class="row">
  <div class="col-5">
  </div>
  <div class="col-6">
    <div class="text-light" >© 2019 Copyright:
      <a class="text-light" href="#"> rentacar.com</a>
  </div>
  <div class="col-1">
  </div>
</div>


</footer>
<!-- Footer -->


  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

</body>
</html>