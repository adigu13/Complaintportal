<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Lilavati-Warden</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
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

     if(session.getAttribute("username") == null){
    	 response.sendRedirect("/wardenlogin");
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
            <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Hey Warden!</a>
          </li>
          <li class="nav-item">
            <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Lilavati Hostel</a>
          </li>
        </ul>
        
        <div class="form-inline my-2 my-lg-0">
          <a  href="/wardenlogout" class="btn btn-info nav-buttons" role="button">Log Out</a>
        </div>
      </div>
    </nav>




<br><br>
   <c:if test = "${complaints.content.size() == 0}">
  <h1 class="text-center">No complaints yet. </h1>
  </c:if>
  <c:if test = "${complaints.content.size() > 0}">
<table class="table table-striped table-hover">

    <thead class="thead-dark text-center">
    <tr>
      <th  scope="col">Roll No</th>
      <th scope="col">Name</th>
      <th scope="col">Date</th>
      <th scope="col">Complaint</th>
      <th scope="col">Status</th>
    </tr>
  </thead>
  <tbody class="text-center">
  <c:forEach items="${complaints.content}" var="comp">
	  <c:if test="${comp.status == 'Pending'}">
	    <tr>
	      <td><a href = "/wardencomplaint/${comp.id}">${comp.roll}</a></td>
	      <td>${comp.name}</td>
	      <td>${comp.timestamp}</td>
        <td>${comp.comptitle}</td>
	      <td class="text-center bg-secondary text-white">${comp.status}</td>
		  </tr>
	   </c:if>
	  <c:if test="${comp.status == 'Accepted'}">
	    <tr>
	      <td><a href = "/wardencomplaint/${comp.id}">${comp.roll}</a></td>
	      <td>${comp.name}</td>
	      <td>${comp.timestamp}</td>
        <td>${comp.comptitle}</td>
	      <td class="text-center bg-primary text-white">${comp.status}</td>
		  </tr>
	   </c:if>
	  <c:if test="${comp.status == 'Rejected'}">
	    <tr>
	      <td><a href = "/wardencomplaint/${comp.id}">${comp.roll}</a></td>
	      <td>${comp.name}</td>
	      <td>${comp.timestamp}</td>
        <td>${comp.comptitle}</td>
	      <td class="text-center bg-danger text-white">${comp.status}</td>
		  </tr>
	   </c:if>
	  <c:if test="${comp.status == 'Resolved'}">
	    <tr>
	      <td><a href = "/wardencomplaint/${comp.id}">${comp.roll}</a></td>
	      <td>${comp.name}</td>
	      <td>${comp.timestamp}</td>
        <td>${comp.comptitle}</td>
	      <td class="text-center bg-success text-white">${comp.status}</td>
		  </tr>
	   </c:if>
   </c:forEach>

  </tbody>

</table>
<div class="d-flex">
<ul class="pagination list-inline mx-auto justify-content-center">
 <c:forEach begin="0" end="${complaints.totalPages-1}" var="pno">
 <li class="${currentpage==(pno+1)?'page-item active list-inline-item':'list-inline-item page-item'}">
 <a class="page-link" href="/menhostelcom/${pno}"> ${pno+1} </a>
 </li>
 </c:forEach>
 </ul>
 </div>
</c:if>
</body>
</html>
