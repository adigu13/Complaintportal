
<%@ page language="java" contentType="text/html; charset=UTF-8"
     pageEncoding="UTF-8"%> 
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- <!DOCTYPE html> -->
<!-- <html> -->
<!-- <head> -->
<!-- <meta charset="UTF-8"> -->
<!-- <title>Welcome-Admin</title> -->
<!-- </head> -->
<!-- <body> -->

<%-- <% --%>
     
<!-- // 	 response.setHeader("Cache-Control" , "no-cache , no-store , must-revalidae");    -->
   
<!-- //     if(session.getAttribute("username") == null) -->
<!-- // 	 response.sendRedirect("/admin"); -->

<%-- %> --%>
<!-- <a href = "/adminlogout">Logout</a> -->

<!-- <br> -->
<!-- Welcome Admin -->

<!-- <br> -->
<!-- <a href = "/addStudent">Add Student Data</a> -->
<!-- <br> -->
<!-- <a href = "/updateStudent">Update Student Data</a> -->


<!-- </body> -->
<!-- </html> -->



<!DOCTYPE html>
<html>
	<head>
	  <title>Admin</title>
	  <meta charset="utf-8">
	  <meta name="viewport" content="width=device-width, initial-scale=1">
	  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	</head>
	<body>
	
	<%
     
	 response.setHeader("Cache-Control" , "no-cache , no-store , must-revalidae");   
   
    if(session.getAttribute("username") == null)
	 response.sendRedirect("/admin");

%>

		<div class="container">
			<div class="col-sm-3 col-md-3"></div>
			<div class="col-sm-3 col-md-6">
				<h1 style="font-size: 48px; margin-top:20% ">Welcome Admin!</h1>
		  		<p>You can Perform Following Operations : </p> 		
			</div>
		  <div class="col-sm-3 col-md-3"><a href="/adminlogout"><button type="button" style="margin-left: 99%;margin-top: 5%;" class="btn btn-primary">Logout</button></a></div>
		</div>
		<div class="container" style="margin-top: 2%;">
			<div class="col-sm-3 col-md-3"><a href = "/addStudent"><button type="button" style="margin-left: 99%;margin-top: 5%;" class="btn btn-primary">Add Student</button></a></div>
			<div class="col-sm-3 col-md-3"></div>
			<div class="col-sm-3 col-md-3"><a href = "/updateStudent"><button type="button" style="margin-left: 99%;margin-top: 5%;" class="btn btn-primary">Update Student</button></a></div>
		</div>
	</body>
</html>