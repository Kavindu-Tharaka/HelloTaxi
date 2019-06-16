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
function validateDriverUpdate()
{ 
	 var name = document.driverEdit.name.value;
	 var userName = document.driverEdit.userName.value;
	 var password1 = document.driverEdit.password1.value; 
	 var password2 = document.driverEdit.password2.value;
	 var address = document.driverEdit.address.value;
	 var nic = document.driverEdit.nic.value;
	 var driLicenseNum = document.driverEdit.driLicenseNum.value;
	 var age = document.driverEdit.age.value;
	 var gender = document.driverEdit.gender.value;
	 var vType = document.driverEdit.vType.value;
	 var vRegNum = document.driverEdit.vRegNum.value;
	 
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
	 else if (nic == null || nic == "")
	 { 
		 alert("Please enter NIC number"); 
		 return false; 
	 }
	 else if (nic.length != 10 || nic.length != 10)
	 { 
		 alert("NIC number can contains only 10 or 12 numbers"); 
		 return false; 
	 }
	 else if (driLicenseNum == null || driLicenseNum == "")
	 { 
		 alert("Please enter a valid Driving License Number"); 
		 return false; 
	 }
	 else if (driLicenseNum.length != 8 )
	 { 
		 alert("Driving License Number can contains only 8 numbers"); 
		 return false; 
	 }
	 else if (age == null || age == "")
	 { 
		 alert("Please enter age"); 
		 return false; 
	 }
	 else if (gender == null || gender == "")
	 { 
		 alert("Please enter your gender"); 
		 return false; 
	 }
	 else if (gender != "female" && gender != "male")
	 { 
		 alert("Please enter your gender"); 
		 return false; 
	 }
	 else if (nic == null || nic == "")
	 { 
		 alert("Please enter NIC number"); 
		 return false; 
	 }
 }
	
</script> 
</head>
<body>

 	    <%
	    	response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");  //can not go back after logout
	    
			if (session.getAttribute("username") == null) {	
				response.sendRedirect("index.jsp");
			}

		%>



<nav class="navbar navbar-light bg-warning">
		<div >
			<h5 class="font-weight-bold text-uppercase " >Welocome ${username}...!!! </h5>
		</div>
  		

</nav>

      
	<div aria-label="breadcrumb ">
	  <ol class="breadcrumb bg-white">
	    <li class="breadcrumb-item"><a class="text-dark" href="welcome.jsp">Home</a></li>
	    <li class="breadcrumb-item active" aria-current="page">My Profile</li>
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
                    <div class="col-md-6"><h3>Update Profile</h3></div>

                </div>
                <p></p>
                <form name="driverEdit" action="DriverEditServlet" method="post"  onsubmit="return validate()">


                    <%

	                    con = DBConnection.createConnection();		//connecting to DataBase
	                    
	                    String userName = (String) session.getAttribute("username"); 
	                    	                    
	                    String Data = "select * from users where userName= ? ";
	                    
		       			preparedStatement = con.prepareStatement(Data); 
	
		        			//assign values to ?s in query statment
		       			preparedStatement.setString(1, userName);  
		       			 
		       			rs= preparedStatement.executeQuery();   //execute the query using the object of resultSet 

                    
                    while (rs.next()) {
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
                        <label for="">NIC</label>
                        <input type="text" class="form-control" id="" name="nic" value='<%=rs.getString("nic")%>'>
                    </div>
                    <div class="form-group">
                        <label for="">Driving License Number</label>
                        <input type="text" class="form-control" id="" name="driLicenseNum" value='<%=rs.getString("drivingLicenseNum")%>'>
                    </div>
                    <div class="form-group">
                        <label for="">Age</label>
                        <input type="text" class="form-control" id="" name="age" value='<%=rs.getString("age")%>'>
                    </div>
					      <div class="form-row">
					        <div class="col-md-12 mb-3">
					      <label for="">Gender</label>
                        <input type="text" class="form-control" id="" name="gender" value='<%=rs.getString("gender")%>'>
					    </div>	</div>
					      <div class="form-row">
					        <div class="col-md-12 mb-3">
					      <label for="">Vehicle type</label>
                        <input type="text" class="form-control" id="" name="vType" value='<%=rs.getString("vType")%>'>
					    </div>	</div>
                    <div class="form-group">
                        <label for="">Vehicle Registration Number</label>
                        <input type="text" class="form-control" id="" name="vRegNum" value='<%=rs.getString("vRegNum")%>'>
                    </div>

                    <%   
                    }
                    %>
                    <button type="submit" class="btn btn-warning">Update</button>
                    <button type="submit" formaction="DriverDeleteServlet" class="btn btn-warning">Delete</button>
                    <span>&nbsp &nbsp </span>   
                                                    
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
        <p class=" text-light">Lorem ipsum dolor, sit amet consectetur adipisicing elit. Vero quasi sed fugiat, 
          reiciendis beatae cumque architecto molestias excepturi, quam magni suscipit, minima modi 
          deleniti deserunt labore animi ipsa at nulla. Lorem ipsum dolor sit amet consectetur adipisicing 
          elit. Nisi itaque eveniet eaque cumque aperiam rerum consectetur laboriosam tempore sed, aut omnis 
          similique atque blanditiis dolore, quae placeat cum et possimus!</p>

      </div>
      <!-- Grid column -->

      <hr class="clearfix w-100 d-md-none pb-3">  <!-- active when reduce screen resolution -->

      <!-- Grid column -->
      <div class="col-md-6">

          <!-- Links -->
          <h5 class="text-uppercase text-light">Links</h5>

          <ul class="list-unstyled text-light">   <!-- list-unstyled is for remove bulletpoints -->
            <li>
              <a class="text-light" href="#!">Link 1</a>
            </li>
            <li>
              <a class="text-light"  href="#!">Link 2</a>
            </li>
            <li>
              <a class="text-light"  href="#!">Link 3</a>
            </li>
            <li>
              <a class="text-light"  href="#!">Link 4</a>
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