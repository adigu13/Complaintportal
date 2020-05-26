<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SportCom Login</title>
<link href="/css/loginsports.css" rel="stylesheet" type="text/css">
<link href="/css/style2.css" rel="stylesheet" type="text/css">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
</head>
<body>
<%
response.setHeader("Cache-Control" , "no-cache , no-store , must-revalidate");
if(session.getAttribute("type") == "student"){
	  response.sendRedirect("/student/"+session.getAttribute("username"));
}
if(session.getAttribute("type") == "sac"){
	  response.sendRedirect("/saccomplist");
}
if(session.getAttribute("type") == "foodcom"){
	  response.sendRedirect("/fcomplist");
}
if(session.getAttribute("type") == "warden"){
	  response.sendRedirect("/wardencomplist");
}
if(session.getAttribute("type") == "sportscom"){
	  response.sendRedirect("/sportscomplist");
}
if(session.getAttribute("type") == "intercom"){
	  response.sendRedirect("/netcomplist");
}
%>
<nav class="navbar navbar-expand-md navbar-dark fixed-top" id="banner">
<a class="navbar-brand" href="/"><span>IIIT</span> Bangalore</a></nav>

<div class="sidenav">
         <div class="login-main-text">
            <h2>Hello, Sport Committee<br> </h2>
            <br>
            <p>Login to Manage Complaints!</p>
         </div>
      </div>
      <div class="main">
         <div class="col-md-6 col-sm-12">
            <div class="login-form" >
               <form action = "/login-sportscom" method = "post">
                  <div class="form-group">
                     <label>User Name</label>
                     <input type="text" class="form-control" placeholder="User Name" name="username">
                  </div>
                  <div class="form-group">
                     <label>Password</label>
                     <input type="password" class="form-control" placeholder="Password" name="password">
                  </div>
                  <button type="submit" class="btn btn-black">Login</button>
               </form>
            </div>
         </div>
      </div>

</body>
</html>