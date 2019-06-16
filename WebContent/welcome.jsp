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

<title>Welcome</title>
<script> 
	
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
         var dis = document.bookVehicle.dis.value;
         var cDate = new Date();
         var nu = dis/dis;

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
     else if( (dis == null || dis == ""|| nu!=1 ))
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
      var dis1 = document.getElementById('dis').value;

      var dis = document.bookVehicle.dis.value;
      var nu = dis/dis;
      
      if( (dis == null || dis == ""|| nu!=1 ))
      {
       alert("Enter a valid distance "); 
 			 return false;
      }
      
      if(dis1 == null || dis == ""){
    	  alert(" Distance can not be null");
    	  return false;
      }
     
      if(vType=='1')
      {
         var cost = document.bookVehicle.cost.value = "Rs."+60*dis+".00";
      }
      else if(vType=='2')
      {
         var cost = document.bookVehicle.cost.value = "Rs."+85*dis+".00";
      } 
      else if(vType=='3')
      {
         var cost = document.bookVehicle.cost.value = "Rs."+100*dis+".00";
      }
      else if(vType=='4')
      {
         var cost = document.bookVehicle.cost.value = "Rs."+150*dis+".00";
      }
      else if(vType=='5')
      {
         var cost = document.bookVehicle.cost.value = "Rs."+300*dis+".00";
      }
  }
  <!--(END) VEHICLE FARE CALCULATION //CHAMIKA -->
	

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
  <a class="navbar-brand font-weight-bold text-uppercase" href="welcome.jsp">HELLO ${username}</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarTogglerDemo02">
    <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
       <li class="nav-item active">
        <a class="nav-link" href="welcome.jsp">Home <span class="sr-only">(current)</span></a>
      </li>

      <li class="nav-item">
        <a class="nav-link" href="#" tabindex="-1" data-toggle="modal" data-target="#book-vehicle-form" >Book Your Vehicle</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#" tabindex="-1" data-toggle="modal" data-target="#myModal-write-to-us" >Write to us</a>
      </li>
    </ul>

	<ul class="navbar-nav  ">
	    <span>&nbsp &nbsp</span>
	      <li class="nav-item">
	        <a  href="LogoutServlet" class="nav-link">Logout</a>
	      </li>
	      
	      <li class="nav-item">
	     	 <a href="customerProfile.jsp" class="nav-link">Customer Profile</a>
	      </li>
	      <li class="nav-item">
	     	 <a href="driverProfile.jsp" class="nav-link">Driver Profile</a>
	      </li>	      
      </ul>
    
  </div>
</nav>


<div class="container">

  <!-- Modal write-to-us-->  <!-- meka mamama karannam-->
  <div class="modal fade" id="myModal-write-to-us" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">Write To Us</h4>
        </div>
        <div class="modal-body">
            <form name="inquiry" action="InquiryServlet" action="" method="post" onsubmit="return validateInquiry()">
  <div class="form-row">
    <div class="col-md-4 mb-3">
      <label for="">Your name</label>
      <input type="text" name="userName" class="form-control" id="" value="${username}" readonly >
    </div>

   
  </div>
  <div class="form-row">
    <div class="col-md-12 mb-3">
      <label for="">Your Message</label>
      <textarea rows="8" name="msg" class="form-control" placeholder="Type your message here" id="message-text"></textarea>

    </div>
  </div>
  <button class="btn btn-warning" type="submit">Send</button>
  <span>&nbsp;</span>
  <button class="btn btn-warning" type="reset">Clear</button>
</form>
        </div>
      </div>
      
    </div>
  </div>
  
</div><!-- Modal write-to-us-->   <!-- meka mamama karannam-->

 <!--(START)BOOK VEHICLE BUTTON  FORM //CHAMIKA -->
<div class="container">

  
    <div class="modal fade" id="book-vehicle-form" role="dialog">
      <div class="modal-dialog">
      
  
        <div class="modal-content">
          <div class="modal-header">
            <h4 class="modal-title">Book Your Vehicle Here</h4>
          </div>
          <div class="modal-body">
            <form  action="BookVehicleServlet" method="post" class="" name="bookVehicle" onsubmit="return validateBOOK()">
  
    <!--.............................................................. -->         
    <div class="form-row">
      
      <div class="col-md-6 mb-3">
        <label for="">First name</label>
        <input type="text" name ="fname" class="form-control" id="" placeholder="Last name" required >
  
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
                  <input type="text" name ="cost" class="form-control" id="cost" placeholder="Rs.800.00" readonly>
              </div>
    </div>  

   <!--.............................................................. -->    
    
    <button class="btn btn-warning" type ='button' onclick=" return calcFare()"  name ='result'>Check fare</button>
    <button class="btn btn-warning" type="reset">Clear</button>
    <span style="margin-left: 23%"></span>
    <button class="btn btn-warning" type="submit" onclick="validateBOOK">BOOK NOW</button>
    
  
  </form>
          </div>
        </div>
        
      </div>
    </div>
    
  </div>
  
  
  
  
  <!--(END)BOOK VEHICLE BUTTON  FORM //CHAMIKA -->
 



<main class="container"><!-- Chamika ubata ewana eke me Main eka athule Revervation eka ganna form eka hadanna ona -->


	<div class="container">
	  <div class="row justify-content-md-center">
	    <div class="col-md-auto">
	      <img src="resources/img/logo1.jpg" alt="logo" >
	    </div>
	  </div>
	</div>	
		
	<div class="container">
	  <div class="row justify-content-md-center">
	    <div class="col-md-auto">
      		<h4 class="text-uppercase text-dark ">Who We Are</h4>
	    </div>
	  </div>
	  <div class="row">

    <div class="col-md-auto">
        <p class=" text-black">
          What we're about
		We want to make renting a car as simple and personal as driving your own.

		Renting a car brings you freedom, and we will help you find the right car for you at a great price. But there is much more to us than that. We are here to make renting a car a lot less hassle.
      
  
        
          Making sure you have a great experience every time you rent a car makes us happy.

		We are a broker, so we arrange the car rental on your behalf. We use our massive buying power to bring you great deals.
        </p>
    </div>

  </div>
</div>


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