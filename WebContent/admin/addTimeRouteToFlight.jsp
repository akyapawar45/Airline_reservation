<%@page import="db.DbCon"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="head.jsp"></jsp:include>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
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
							<h2>Add Time and Route To Flight's</h2>
							<%
								Connection con = DbCon.con();
								String query1 = "select * from airpoort";
								String query = "select * from city";
								PreparedStatement ps = con.prepareStatement(query);
								PreparedStatement p1 = con.prepareStatement(query1);
								ResultSet rs = ps.executeQuery();
								ResultSet rt = p1.executeQuery();
							%>
							<form action="addroutdb.jsp">
								<div style="width: 400px;">
									<div class="form-horizontal">

										<div class="form-group">
											<label>Airport Name</label> <select class="form-control"
												name="apname">
												<option value="select Airport Name">select Airport
													Name</option>
												<%
													while (rt.next()) {
												%>
												<option value="<%=rt.getString(2)%>"><%=rt.getString(2)%></option>
												<%
													}
												%>
											</select>
										</div>
										<div class="form-group">

											<label>Source</label> <select name="src" class="form-control"
												name="src">
												<option value="Select Source">Select Source</option>
												<%
													while (rs.next()) {
												%>
												<option value="<%=rs.getString(2)%>"><%=rs.getString(2)%></option>
												<%
													}
												%>
											</select>
										</div>


										<div class="form-group">
											<select name="dest" class="form-control" name="dest">
												<option value="Select Destination">Select
													Destination</option>
												<%
													rs = ps.executeQuery();
													while (rs.next()) {
												%>
												<option value="<%=rs.getString(2)%>"><%=rs.getString(2)%></option>
												<%
													}
												%>
											</select>
										</div>

										<div class="form-group">
											<label>Airline Name</label> <select class="form-control ch"
												name="airname">
												<option value="Select Destination">Select Airline</option>

												<%
													query = "select distinct b.ar_name,a.ar_id from airline as a inner join airlinename as b on a.ar_id=b.ar_id";
													ps = null;
													ps = con.prepareStatement(query);
													rs = ps.executeQuery();
													while (rs.next()) {
												%>
												<option value="<%=rs.getString(2)%>"><%=rs.getString(1)%></option>
												<%
													}
												%>
											</select>
										</div>
										<div class="form-group">
											<label>Plain Name</label> <select class="form-control op"
												name="pname">
												<option value="0">Select Plain</option>
											</select>
										</div>
										<div class="form-group" >
											<label>Seat Type</label> <select id="w3_country1"
												onchange="change_country(this.value)"
												class="frm-field required form-control" name="stype">
												<option value="Economy">Economy</option>
												<option value="Premium Economy">Premium Economy</option>
												<option value="Business">Business</option>
												<option value="First class">First class</option>
											</select>
										</div>
										<div class="form-group">
											<label>Price</label> <input type="text" class="form-control"
												name="price" required>
										</div>
										<div class="form-group">
											<label>Time</label> <input type="time" class="form-control"
												name="time" required>
										</div>
										<div class="form-group">
											<label>Date</label> <input type="Date" class="form-control"
												name="date" required>
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
			</div>
		</div>
	</div>
	<br>
	<br>
	<br>
	<script>
		$('.ch').change(function() {
			$.ajax({
				url : 'plain.jsp',
				data : 'name=' + $(this).val(),
				success : function(r) {
					$('.op').html(r);
				}
			});
		});
	</script>
</body>
</html>