<%@page import="db.DbCon"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="head.jsp"></jsp:include>
<style>
form {
	background: rgb(250 245 245/ 57%);
	padding: 25px;
}
</style>

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
						<div class="col-md-9"
							style="background-color: white; border: 1px solid red;">
							<h2>Add Airport's</h2>
							<%
								Connection con = DbCon.con();
								PreparedStatement ps = con.prepareStatement("select * from airlinename");
								ResultSet rs = ps.executeQuery();
							%>

							<form action="addairportdb.jsp" method="post">
								<div style="width: 400px;">
									<div class="form-horizontal">
										<div class="form-group">
											<label>Airport Name</label> <input type="text"
												class="form-control" name="aname" required>
										</div>
										<div class="form-group">
											<label>City</label> <input type="text" class="form-control"
												name="city" required>
										</div>
										<div class="form-group">
											<label>Address</label> <input type="text"
												class="form-control" name="address" required>
										</div>
										<div class="form-group">

											<button class="btn btn-primary form-control">Submit</button>
										</div>
									</div>
								</div>
							</form>
							<br>
							<hr>
							<h2>Allready Added Airport's</h2>
							<table class="table">
								<thead>
									<tr>
										<th scope="col">Sr. Number</th>
										<th scope="col">Airport Name</th>
										<th scope="col">Airport City</th>
										<th scope="col">Airport Address</th>
									</tr>
								</thead>
								<tbody>
									<%
										int n = 1;

										ps = con.prepareStatement("select * from airpoort");
										rs = ps.executeQuery();
										while (rs.next()) {
									%>
									<tr>
										<td><%=n%></td>
										<td><%=rs.getString("name")%></td>
										<td><%=rs.getString("city")%></td>
										<td><%=rs.getString("address")%></td>
									</tr>
									<%
										n++;
										}
									%>
								</tbody>
							</table>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<br>
	<br>
	<br>

</body>
</html>