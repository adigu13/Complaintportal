<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Resolve</title>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

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
     
	 response.setHeader("Cache-Control" , "no-cache , no-store , must-revalidae");   
   
     if(session.getAttribute("username") == null){
    	 response.sendRedirect("/sportcomlogin");
     }
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
            <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Hey FoodCom!</a>
          </li>
          
        </ul>
        <div class="form-inline my-2 my-lg-0">
          <a  href="/sportcomlogout" class="btn btn-info nav-buttons" role="button">Log Out</a>
        </div>
      </div>
    </nav>



<br><br>

 <div class="card border-dark mb-3 mx-auto" style="max-width: 25rem;">
    <div class="card-header bg-transparent border-dark text-center">${complaint.comptitle}</div>
    <div class="card-body text-dark">
      <h5 class="card-title text-center text-light bg-dark">Current Status : ${complaint.status}</h5>
      <p class="card-text">${complaint.compbody}</p>
    </div>
    <div class="card-footer bg-transparent border-dark text-center">Reported By : ${complaint.name} (${complaint.roll})</div>
  </div>

   <div class="row justify-content-center">
        <div class="col-md-6">
          <span class="anchor" id="formUserEdit"></span>
          <hr class="my-5">
          <!-- form user info -->
          <div class="card card-outline-secondary">
            <div class="card-header">
              <h3 class="mb-0 text-center">Complaint Response</h3>
            </div>
            <div class="card-body">
              <form autocomplete="off" class="form" role="form" action="view/${complaint.roll}/${complaint.id}" >
                
                
              
                
                <div class="form-group row">
                  <label class="col-lg-3 col-form-label form-control-label">Status</label>
                  <div class="col-lg-9">
                    <select class="form-control" id="exampleFormControlSelect1" name = "status" size="0">
                      <option value="Accepted">
                        Accepted
                      </option>
                      <option value="Resolved">
                        Resolved
                      </option>
                      <option value="Rejected">
                        Rejected
                      </option>
                     
                     
                    </select>
                  </div>
                </div>
                <div class="form-group row">
                  <label class="col-lg-3 col-form-label form-control-label">Message</label>
                  <div class="col-lg-9">
                    <textarea class="form-control" type="text"  name="message" rows="3"></textarea>
                  </div>
                </div>
                
                <input type="hidden" id="comptitle" name="comptitle" value="${complaint.comptitle}">
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
