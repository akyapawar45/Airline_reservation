<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {
	font-family: Arial, Helvetica, sans-serif;
	
}





button {
	background-color: #4CAF50;
	color: white;
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	cursor: pointer;
	width: 100%;
}
.imgcontainer h2,label{
  color: white;
}


/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
	span.psw {
		display: block;
		float: none;
	}
	.cancelbtn {
		width: 100%;
	}
}
</style>

<jsp:include page="head.jsp"></jsp:include>
</head>
<body>

	<jsp:include page="header.jsp"></jsp:include>

	<div class="container">
     <div class="row">
     <div class="col-md-8">
		<form action="logincheck.jsp" method="post">
			<div class="imgcontainer">
				<h2>Login Form</h2>
			</div>

              <div class="form-group">
			     <label for="uname"><b>Username</b></label> 
			     <input type="text"
				class="form-control" placeholder="Enter Username" name="email"
				required> 
			  </div>	
			  <div class="form-group">
				<label for="psw"><b>Password</b></label> 
				<input
				type="password" class="form-control" placeholder="Enter Password"
				name="pass" required>
              </div>
              
			<button type="submit">Login</button>
		</form>
		</div>
      </div>
	</div>

</body>
</html>
