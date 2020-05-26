<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>*IIITB COMPLAINT PORTAL*</title>

  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link href="/css/style2.css" rel="stylesheet" type="text/css">
</head>

<body>



<nav class="navbar navbar-expand-md navbar-dark fixed-top" id="banner">
	<div class="container">
  <!-- Brand -->
  <a class="navbar-brand" href="/"><span>IIIT</span> Bangalore</a>

  <!-- Toggler/collapsibe Button -->
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
    <span class="navbar-toggler-icon"></span>
  </button>

  <!-- Navbar links -->
  <div class="collapse navbar-collapse" id="collapsibleNavbar">
    <ul class="navbar-nav ml-auto">
      <li class="nav-item">
        <a class="nav-link" href="/wardenlogin">Warden</a>
      </li>
       <li class="nav-item">
        <a class="nav-link" href="/netcomlogin">InternetCom</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/fcomlogin">FoodCom</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/saclogin">SAC</a>
      </li>
       <li class="nav-item">
        <a class="nav-link" href="/sportcomlogin">SportCom</a>
      </li>
      <!--  <li class="nav-item">
        <a class="nav-link" href="/admin">Admin</a>
      </li> -->

    <li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle" href="/feedback" id="navbardrop" data-toggle="dropdown">
        Feedback
      </a>
      <div class="dropdown-menu">
        <a class="dropdown-item" href="/feedback">Feedback</a>
<!--         <a class="dropdown-item" href="#">Link 2</a> -->
<!--         <a class="dropdown-item" href="#">Link 3</a> -->
      </div>
    </li>
    </ul>
  </div>
	</div>
</nav>

<div class="banner">
	<div class="container">
	<div class="banner-text">
	<div class="banner-heading">
	| शिkayat |
	</div>
	<div class="banner-heading">
    	IIITB Complaint Portal
    	</div>
	<div class="banner-sub-heading">
	  24*7 UP for Complaints
	</div>


	<a href="/studentlogin" class="btn btn-info btn-warning text-dark" role="button">LOGIN</a>
	<a href="/register" class="btn btn-info btn-warning text-dark" role="button">REGISTER</a>


	</div>
	</div>
</div>
<section id="about">
<div class="container">
	<div class="text-intro">
	<h2>About Us</h2>
		<p> Here, You can register your complaints regarding any issues!<br>
		     Be it Food Complaint, Slow Internet Complaint, Room related issues, etc.
		      </p>
	</div>
</div>
</section>





























<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" --%>
<%--     pageEncoding="UTF-8"%> --%>
<!-- <!DOCTYPE html> -->
<!-- <html> -->
<!-- <head> -->
<!-- <meta charset="UTF-8"> -->
<!-- <title>IIITB COMPLAINT PORTAL</title> -->
<!-- <link href="/css/style.css" rel="stylesheet" type="text/css"> -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css"> -->
<!--   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->
<!--   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script> -->
<!-- </head> -->

<!-- <body> -->
<!-- <div id="header">		 -->
<!-- 			<nav class="navbar navbar-fixed-top "> -->
<!-- 			  <div class="container-fluid"> -->
<!-- 			    <div class="navbar-header">
<!-- 			      <a class="navbar-brand" href="#"> -->
<!-- 			      <center><h4>WebSiteName</h4></center></a> -->
<!-- 			    </div> -->
<!-- 			    <center><h2 style="color:green">IIITB Complaint Portal</h2></center> -->
<!-- 			    <br> -->
<!-- 			    <ul class="nav navbar-nav  mr-auto "> -->
<!-- 			      <li class="nav-item"><a href="/">Home</a></li> -->
<!-- 			      <li class="nav-item"><a href="/wardenlogin">Warden</a></li> -->
<!-- 			      <li class="nav-item"><a href="/fcomlogin">FoodCom</a></li> -->
<!-- 			      <li class="nav-item"><a href="saclogin">SAC</a></li> -->
<!-- 			      <li class="nav-item"><a href="/sportcomlogin">SportsCom</a></li> -->
<!-- 			      <li class="nav-item"><a href="netcomlogin">InternetCom</a></li> -->
<!-- 			      <li class="nav-item"><a href="/aboutus">About Us</a></li> -->
<!-- 			    </ul> -->
<!-- 			  </div> -->
<!-- 			</nav> -->
<!-- 		</div> -->
<!-- 		<div class="sidebar"> -->
<!-- 		 <center>	<br><br><h2>Student</h2> -->

<!-- 		  <a href="/studentlogin"><h3>Login</h3></a> -->
<!-- 		  <a href="/register"><h3>Register</h3></a> -->
<!-- 		  <a href="/feedback"><h3>Feedback</h3></a> -->
<!-- 		</div> -->
<!-- 		<div id="main"> -->

<!-- 		<div id="myCarousel" class="carousel slide" data-ride="carousel"> -->
<!-- 		    Indicators -->
<!-- 		    <ol class="carousel-indicators"> -->
<!-- 		      <li data-target="#myCarousel" data-slide-to="0" class="active"></li> -->
<!-- 		      <li data-target="#myCarousel" data-slide-to="1"></li> -->
<!-- 		      <li data-target="#myCarousel" data-slide-to="2"></li> -->
<!-- 		    </ol> -->

<!-- 		    Wrapper for slides -->
<!-- 		    <div class="carousel-inner"> -->

<!-- 		      <div class="item active"> -->
<!-- 		        <img src="/images/img5.jpg"height="200px" width="900px" alt="Los Angeles" style="width:100% ;"> -->
<!-- 		        <div class="carousel-caption">
<!-- 		          <h3>Los Angeles</h3> -->
<!-- 		          <p>LA is always so much fun!</p> -->
<!-- 		        </div> -->
<!-- 		      </div> -->

<!-- 		      <div class="item"> -->
<!-- 		        <img src="/images/img6.jpg" height="250" width="1000"alt="Chicago" style="width:100%;"> -->
<!-- 		        <div class="carousel-caption">
<!-- 		          <h3>Chicago</h3> -->
<!-- 		          <p>Thank you, Chicago!</p> -->
<!-- 		        </div> -->
<!-- 		      </div> -->

<!-- 		      <div class="item"> -->
<!-- 		        <img src="/images/img7.jpg" height="250" width="1000"alt="New York" style="width:100%;"> -->
<!-- 		        <div class="carousel-caption">
<!-- 		          <h3>New York</h3> -->
<!-- 		          <p>We love the Big Apple!</p> -->
<!-- 		        </div> -->
<!-- 		      </div> -->

<!-- 		    </div> -->

<!-- 		    Left and right controls -->
<!-- 		    <a class="left carousel-control" href="#myCarousel" data-slide="prev"> -->
<!-- 		      <span class="glyphicon glyphicon-chevron-left"></span> -->
<!-- 		      <span class="sr-only">Previous</span> -->
<!-- 		    </a> -->
<!-- 		    <a class="right carousel-control" href="#myCarousel" data-slide="next"> -->
<!-- 		      <span class="glyphicon glyphicon-chevron-right"></span> -->
<!-- 		      <span class="sr-only">Next</span> -->
<!-- 		    </a> -->
<!-- 		  </div> -->
<!-- 		</div> -->


<!-- 		<div id="footer"> -->
<!-- 		 <h4>This Website is powered by IIITB. -->
<!-- 		 © Copyright 2019, All Rights Reserved</h4> -->
<!-- 		</div> -->
</body>
</html>
