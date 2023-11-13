<%@page import="db.DbCon"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="head.jsp"></jsp:include>
</head>
<body>

	<jsp:include page="header.jsp"></jsp:include>

	<div class="container">
		<div class="row" style="background-color: white">
			<div class="col-md-1"></div>
			<div class="col-md-9">
				<h2>Admin Panel</h2>
				<hr>
				<div class="plains-t">
					<div class="row">
						<div class="col-md-3">
						<jsp:include page="sidebar.jsp"></jsp:include>
						</div>
						<div class="col-md-9">
								<h2>Welcome To Admin Panel</h2>
							</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>