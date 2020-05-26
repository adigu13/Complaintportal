<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Change-Password</title>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
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

</head>
<body>
<%
     
 	 response.setHeader("Cache-Control" , "no-cache , no-store , must-revalidate");   
   
      /* if(session.getAttribute("username") == null){
     	 response.sendRedirect("/studentlogin");
      } */
%>
<br>
 <nav class="navbar navbar-expand-lg">
      
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" width="30" height="30"><path fill-rule="evenodd" d="M10 1c-.17 0-.36.05-.52.14C8.04 2.02 4.5 4.58 3 5c-1.38 0-3 .67-3 2.5S1.63 10 3 10c.3.08.64.23 1 .41V15h2v-3.45c1.34.86 2.69 1.83 3.48 2.31.16.09.34.14.52.14.52 0 1-.42 1-1V2c0-.58-.48-1-1-1zm0 12c-.38-.23-.89-.58-1.5-1-.16-.11-.33-.22-.5-.34V3.31c.16-.11.31-.2.47-.31.61-.41 1.16-.77 1.53-1v11zm2-6h4v1h-4V7zm0 2l4 2v1l-4-2V9zm4-6v1l-4 2V5l4-2z"></path></svg>
        <a class="navbar-brand logo" href="/">शिkayat</a>
        <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
          
          <li class="nav-item">
            <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Howdy !</a>
          </li>
          
        </ul>
      <% if(session.getAttribute("username") != null){  %>
        <div class="form-inline my-2 my-lg-0">
		  <a  href="/studentlogout" class="btn btn-info nav-buttons" role="button">Log Out</a>
        </div>
      <% } %>
      </div>
    </nav>
	      <div class="row justify-content-center">
        <div class="col-md-6">
          <span class="anchor" id="formUserEdit"></span>
          <hr class="my-5">
          <!-- form user info -->
          <div class="card card-outline-secondary">
            <div class="card-header">
              <h3 class="mb-0 text-center">Change Password</h3>
            </div>
            <div class="card-body">
              <form autocomplete="off" class="form" role="form" action="/changepassword" method = "post">
                
                
              
                <div class="form-group row">
                  <label class="col-lg-3 col-form-label form-control-label">Roll No</label>
                  <div class="col-lg-9">
                    <input class="form-control" type="text" placeholder="Enter Roll No." name="roll">
                  </div>
                </div>
                
                <div class="form-group row">
                  <label class="col-lg-3 col-form-label form-control-label">Old Password</label>
                  <div class="col-lg-9">
                    <input class="form-control" type="password" placeholder="Enter Old Password" name="oldpass">
                  </div>
                </div>
                
                <div class="form-group row">
                  <label class="col-lg-3 col-form-label form-control-label">New Password</label>
                  <div class="col-lg-9">
                    <input class="form-control" type="password" placeholder="Enter New Password" name="newpass">
                  </div>
                </div>
               
                <div class="form-group row">
                  <label class="col-lg-3 col-form-label form-control-label"></label>
                  <div class="col-lg-9">
                    <input class="btn btn-secondary" type="reset" value="Cancel"> 
                    <input class="btn btn-primary" type="submit" value="Submit">
                  </div>
                </div>
              </form>
            </div>
          </div><!-- /form user info -->
        </div>
      </div>
	



</body>
</html>