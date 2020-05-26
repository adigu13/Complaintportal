<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
     
	 response.setHeader("Cache-Control" , "no-cache , no-store , must-revalidae");   
     if(session.getAttribute("username") == null){
    	 response.sendRedirect("/saclogin");
     }
  %>

<a href = "/saclogout">Logout</a>

</br>
<h1>${complaint.roll}  <br> ${complaint.name}</h1>

<div class="form-group purple-border">
  <label for="exampleFormControlTextarea4">Complaint Message : </label>
  <textarea readonly class="form-control" id="exampleFormControlTextarea4" rows="3">${complaint.compbody}</textarea>
</div>

</div>

<br>
<div class="container">
	<div class="row">
      <div class="col-md-6 col-md-offset-3">
        <div class="well well-sm">
          <form class="form-horizontal" action="view/${complaint.id}" >
          <fieldset>
            <legend class="text-center">Response</legend>
   		<div class="form-group col-sm-12">
		    <label for="exampleFormControlSelect1">Status</label>
		    <select class="form-control " id="exampleFormControlSelect1" name = "status">
		      <option value = "Accepted">Accepted</option>
		      <option value = "Resolved">Resolved</option>
		      <option value = "Rejected">Rejected</option>
		    </select>
		  </div>
		  <div class="form-group col-sm-12">
		    <label for="exampleFormControlTextarea1">Message</label>
		    <textarea class="form-control " id="exampleFormControlTextarea1" rows="3" name = "message"></textarea>
		  </div>


            <!-- Form actions -->
            <div class="form-group">
              <div class="col-md-12 text-center">
                <button type="submit" class="btn btn-primary btn-lg">Submit</button>
              </div>
            </div>
          </fieldset>
          </form>
        </div>
      </div>
	</div>
</div>


</body>
</html>