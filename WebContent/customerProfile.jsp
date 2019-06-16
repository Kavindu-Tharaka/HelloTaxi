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
	function validate()
	{ 
		 var name = document.customerEdit.name.value;
		 var userName = document.customerEdit.userName.value;
		 var password1 = document.customerEdit.password1.value; 
		 var password2 = document.customerEdit.password2.value;
		 var address = document.customerEdit.address.value;
		 var zip = document.customerEdit.zip.value;
		 var contactNumber = document.customerEdit.contactNumber.value;
		 
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

<div class="container">

  <!-- Modal write-to-us-->  <!-- meka mama karannam-->
  <div class="modal fade" id="myModal-write-to-us" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">Write To Us</h4>
        </div>
        <div class="modal-body">
            <form class="" >
  <div class="form-row">
    <div class="col-md-4 mb-3">
      <label for="">Your name</label>
      <input type="text" class="form-control" id="" placeholder="Your Name" required>
    </div>

   
  </div>
  <div class="form-row">
    <div class="col-md-12 mb-3">
      <label for="">Your Message</label>
      <textarea rows="8" class="form-control" placeholder="Type your message here" id="message-text"></textarea>

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
  
</div><!-- Modal write-to-us-->   <!-- meka mama karannam-->



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
                <form name="customerEdit" action="CustomerUpdateServlet" method="post"  onsubmit="return validate()">


                    <%

	                    con = DBConnection.createConnection();		//get DB connection
	                    
	                    String userName = (String) session.getAttribute("username"); 
	                    	                    
	                    String Data = "select * from users where userName= ? ";
	                    
		       			preparedStatement = con.prepareStatement(Data); //prepareStatement is used to reduce complexity of normal statement
		
		        			//assign values to ?s in query statment
		       			preparedStatement.setString(1, userName);  
		       			 
		       			rs= preparedStatement.executeQuery();   //execute the query

                    
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
                    <button type="submit" formaction="CustomerDeleteServlet" class="btn btn-warning">Delete</button>
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