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

<title>Admin Dashboard</title>
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
		<ol class="breadcrumb bg-white" >
			<li class="breadcrumb-item active" aria-current="page">Admin DashBoard</li>
		</ol>
	</div>


<main>

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
	      	<div>
				<a href="customerList.jsp" class="btn btn-warning">Customer List</a>
				<a href="driverList.jsp" class="btn btn-warning">Driver List</a>
				<a href="reservationList.jsp" class="btn btn-warning">Reservation List</a>
				<a href="inquiryList.jsp" class="btn btn-warning">Inquiry List</a>
			</div>
	    </div>
	  </div>
	</div>	


</main>

<br>

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