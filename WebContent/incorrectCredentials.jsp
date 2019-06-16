<%@page import="java.io.PrintWriter"%>
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

	
</script> 

</head>
<body>




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



<div class="container">

  <!-- Modal login--> <!-- Kavindu's part-->
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
  
</div><!-- Modal login-->  <!-- Kavindu's part-->


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
            <form action="Driver_servelet" method="post" class="" >
            
    <div class="form-row">
	<div class="col-md-12 mb-3">
      <label for="">Name</label>
      <input type="text" class="form-control" name="name" id="name" placeholder="Enter your Name" >

    </div>
    <div class="col-md-12 mb-3">
      <label for="">User name</label>
      <input type="text" class="form-control" name="uname" id="uname" placeholder="Enter your Username" >

    </div>
    
     <div class="col-md-6 mb-3">
      <label for="">Password</label>
      <input type="text" class="form-control" name="pwd" id="pwd" placeholder="Enter Password" >
    </div>
  
     <div class="col-md-6 mb-3">
      <label for="">Re-enter Password</label>
      <input type="text" class="form-control" name="rpwd" id="rpwd" placeholder="Re-Enter Password" >
    </div>
    
      <div class="col-md-12">
        <label for="">Address</label>
        <input type="text" class="form-control" name="add" id="add" placeholder="Enter Your Address" >

      </div>
       
        <br><br><br><br>
       
       <div class="col-md-5 mb-3">
          <label for="">NIC Number</label>
          <input type="text" class="form-control" name="nic" id="nic" placeholder="NIC">
    
       </div>            
    
       <div class="col-md-7 mb-3">
          <label for="">Driver License Number</label>
          <input type="text" class="form-control" name="licen" id="licen" placeholder="Driver License Number" >
    
        </div>
        
        <div class="col-md-4 mb-3">
            <label for="">Age</label>
            <input type="text" class="form-control" name="age" id="age" placeholder="Age">
      
        </div>    
          <div class="col-md-4 mb-3">
            <label for="">Gender</label>
            <input type="text" class="form-control" name="gender" id="gender" placeholder="Gender" >
      
        </div>
        
        <div class="col-md-5 mb-3">
          <label for="">Vehicle Type</label>
          <input type="text" class="form-control" name="type" id="type" placeholder="Vehicle Type">
    
       </div>            
    
       <div class="col-md-7 mb-3">
          <label for="">Vehicle Registration Number</label>
          <input type="text" class="form-control" name="vreg_no" id="vreg_no" placeholder="Vehicle Registration Number" >
    
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
        
      </div>
<!-- Modal driver signup-->  <!-- Savindri's part-->
  





<main class="container"><!-- Chamika ubata ewana eke me Main eka athule Revervation eka ganna form eka hadanna ona --> 


<br>
<br>
<br>
<br>
	
	
<div class="container">
  <div class="row justify-content-md-center">
    <div class="col-md-auto">
    <h3 align ="center" class="display-3 text-danger">Invalid Username or Password. Please Re-Enter Username and Password.</h3>
    </div>
  </div>
</div>

<br>
<br>
<br>
<br>


</main><!-- Chamika ubata ewana eke me Main eka athule Revervation eka ganna form eka hadanna ona --> 



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