<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>

<jsp:include page="header.jsp"></jsp:include>
<div class="container-fluid">
  <div class="row">
    <div class="col-sm-4">
   <jsp:include page="operation.jsp"></jsp:include>
      </div>
     
    <div class="col-sm-8">
    <form action="addcitydb.jsp" method="post">
          <div style="width:400px;">
          <div class="form-horizontal">
          <div class="form-group">
          <label>City</label>
          <input type="text" class="form-control" name="city">
          </div>
         
          <div class="form-group">
          
          <button class="btn btn-primary form-control">Submit</button>
          </div>
          </div>
          </div>
          </form>
     </div> 
  </div>
</div>

</body>
</html>
