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

<title>Customer List</title>
</head>
<body>

	    <%
	    	response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");  //can not go back after logout
	    
			if (session.getAttribute("Admin") == null) {	 //if user is not logged in as admin can not access this page
				response.sendRedirect("welcome.jsp");
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
	    <li class="breadcrumb-item"><a class="text-dark" href="adminDashBoard.jsp">Admin DashBoard</a></li>
	    <li class="breadcrumb-item active" aria-current="page">Driver List</li>
	  </ol>
	</div>




<main><!-- Chamika me Main eka athule Revervation eka ganna form eka hadanna ona --> 


		<br> 
		<div class="container-fluid">
	        <div class="row">
	            <div class="col-md-4 text-left"><h3>Driver List</h3></div>
	            
	                 <form class="form-inline col-md-4" name="search" action="" method="post" >
				      <input class="form-control" name="searchQuery" type="search" placeholder="Search Driver">
				      <span>&nbsp</span>
				      <button class="btn btn-dark" type="submit">Search</button>
				    </form>
				    
	            <div class="col-md-4 text-right">
	                <a href="addDriverByAdmin.jsp" class="btn btn-dark"><i class="fa fa-user-plus"></i>  Add New Driver</a>	            
	            </div>
	        </div>
	        <p></p>
	        <div class="table-responsive">
		        <table class="table table-hover table-dark table-condensed">
		            <thead>
		                <tr>
		                    <th>ID</th>
		                    <th>Name</th>
		                    <th>User Name</th>
		                    <th>Address</th>
		                    <th>NIC</th>
		                    <th>Driver License Number</th>
		                    <th>Age</th>
		                    <th>Gender</th>
		                    <th class="text-center" >Action</th>
		                </tr>
		            </thead>
		            <tbody>
		                <%
		                Connection con = null;
		                Statement statement = null;
		                ResultSet rs = null;
		                
		                con = DBConnection.createConnection();  //create connection fro DB
		                statement = con.createStatement(); //create normal statment
		                
		                String query = request.getParameter("searchQuery"); //get parameter from above search form
		                String data;
		                
		                if(query != null) //if input field is not empty, then assign this SQL query to data variable
		                {
		                	data = "select ID,name,userName,address,nic,drivingLicenseNum,age,gender from users where type = 'driver' and name like '%" + query + "%' or userName like '%" + query + "%' ";
		                }
		                else //if input field empty, then assign this SQL query to data variable
		                {
		                 	data = "select ID,name,userName,address,nic,drivingLicenseNum,age,gender from users where type = 'driver' ";
		                }
		                rs = statement.executeQuery(data);  //executeQuery will return set of data . assign to result set type variable 'rs'               
		                while (rs.next()) {  //next() check for there is next row.if t is return true
		                %>
		                <tr>
		                    <td><%=rs.getString("ID")%></td>
		                    <td><%=rs.getString("name")%></td>
		                    <td><%=rs.getString("userName")%></td>
		                    <td><%=rs.getString("address")%></td>
		                    <td><%=rs.getString("nic")%></td>
		                    <td><%=rs.getString("drivingLicenseNum")%></td>
		                    <td><%=rs.getString("age")%></td>
		                    <td><%=rs.getString("gender")%></td>
		                    <td class="text-center" >
		                        <a href='editDriverByAdmin.jsp?u=<%=rs.getString("ID")%>' class="btn btn-warning badge-pill">Edit</a> 
		                        <a href='deleteDriverServlet?d=<%=rs.getString("ID")%>' class="btn btn-danger badge-pill">Delete</a>
		                    </td>
		                </tr>
		                <%
		                }
		                %>
		            </tbody>
		        </table>
		     </div>
		</div>


</main><!-- Chamika me Main eka athule Revervation eka ganna form eka hadanna ona --> 



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