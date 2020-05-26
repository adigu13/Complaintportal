
<%@ page language="java" contentType="text/html; charset=UTF-8"
     pageEncoding="UTF-8"%> 
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
	<head>
	  <title>Admin</title>
	  <meta charset="utf-8">
	  <meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</head>
<style>
@import url('https://fonts.googleapis.com/css?family=Averia+Serif+Libre|Bubblegum+Sans|Caveat+Brush|Chewy|Lobster+Two');
    .logo{
      letter-spacing: 1px;
    color: black !important;
    font-family: 'Lobster Two', cursive;
    font-size: 45px;
    }
    .navbar{
      background-color: hsla(0, 0%, 97%, 0.959);
      border-color: #e7e7e7;
    }
    .nav-buttons{
      background-color:black;
      border-color: black;
    }
  </style>


	<body>
	
	<%
     
	 response.setHeader("Cache-Control" , "no-cache , no-store , must-revalidae");   
   
    if(session.getAttribute("username") == null)
	 response.sendRedirect("/admin");

%>
<br>
<nav class="navbar navbar-expand-lg">
      
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" width="30" height="30"><path fill-rule="evenodd" d="M10 1c-.17 0-.36.05-.52.14C8.04 2.02 4.5 4.58 3 5c-1.38 0-3 .67-3 2.5S1.63 10 3 10c.3.08.64.23 1 .41V15h2v-3.45c1.34.86 2.69 1.83 3.48 2.31.16.09.34.14.52.14.52 0 1-.42 1-1V2c0-.58-.48-1-1-1zm0 12c-.38-.23-.89-.58-1.5-1-.16-.11-.33-.22-.5-.34V3.31c.16-.11.31-.2.47-.31.61-.41 1.16-.77 1.53-1v11zm2-6h4v1h-4V7zm0 2l4 2v1l-4-2V9zm4-6v1l-4 2V5l4-2z"></path></svg>
        <a class="navbar-brand logo" href="#">शिkayat</a>
        <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
          
          <li class="nav-item">
            <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Hey Admin!</a>
          </li>
          <li class="nav-item active">
            <a class="nav-link" href="/addComplaint">Add Complaint</a>
          </li>
          
        </ul>
        <div class="form-inline my-2 my-lg-0">
          <a  href="/adminlogout" class="btn btn-info nav-buttons" role="button">Log Out</a>
        </div>
      </div>
    </nav>


		<div class="container" style="margin-top: 2%;">
			<div class="col-sm-3 col-md-3"><img src="/images/addstudent.jpg" style="height:500px;width: 500px" ><a href = "/addStudent"><button type="button" style="margin-left: 99%;margin-top: 5%;" class="btn btn-primary">Add Student</button></a></div>
			<div class="col-sm-3 col-md-3"></div>
			<div class="col-sm-3 col-md-3"><img src="/images/updatestudent.jpg" style="height:500px;width: 500px" ><a href = "/updateStudent"><button type="button" style="margin-left: 99%;margin-top: 5%;" class="btn btn-primary">Update Student</button></a></div>
		</div>
	</body>
</html>