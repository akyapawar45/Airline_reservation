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
 <link rel="stylesheet" href="../css/pstyle.css">
<style>
form {
	background: rgb(250 245 245/ 57%);
	padding: 25px;
}
</style>

</head>
<body>
	<%
		Connection con = DbCon.con();
		PreparedStatement ps = con.prepareStatement("select * from airlinename");
		ResultSet rs = ps.executeQuery();
	%>
	<jsp:include page="header.jsp"></jsp:include>

	<div class="container-fluid">
		<div class="row" style="background-color: white">

			<div class="col-md-12">
				<h2>Admin Panel</h2>
				<hr>
				<div class="plains-t">
					<div class="row">
						<div class="col-md-2">
							<jsp:include page="sidebar.jsp"></jsp:include>
						</div>
						<div class="col-md-10"
							style="background-color: white; border: 1px solid red;">
							<h2>Add Airport's</h2>
							<div class="col-sm-3">
								<form action="../seatdb.jsp" method="post">
									<div class="form-horizontal">
										<div class="form-group">
											<label>Airline Name</label> <select
												class="airline form-control" name="alname"><option
													value="0">Select Airline</option>
												<%
													while (rs.next()) {
												%>
												<option value="<%=rs.getString(1)%>"><%=rs.getString(2)%></option>
												<%
													}
												%>
											</select>
										</div>
										<div class="form-group">
											<label>Plain Name</label> <select class="pname form-control"
												name="pname"><option>Select Plain</option></select>
										</div>
										<div class="form-group">
											<label>Seat rows</label> <input type="text"
												class="form-control s-row" name="seat">
										</div>

									</div>

									<div class="form-group">
										<label>From</label> <br>
										<input type="text" class="fr" name="fr"> <br> <label>to</label>
										<br>
										<input type="text" class="to" name="t"><br>
									</div>

									<div class="form-group">

										<button class="btn btn-primary form-control">Submit</button>
									</div>
							</div>
							</form>

							<div class="col-sm-6 area">
								<div class="p-body">
									<div class="p-front">
										<h3>Front</h3>
										<hr>
									</div>
									<div class="p-seats">
										<div class="p-left">
											<div class="seats a">A</div>
											<div class="seats b">B</div>

											<div class="seats c">C</div>
										</div>
										<div class="p-right">
											<div class="seats d">D</div>
											<div class="seats e">E</div>
											<div class="seats f">F</div>
										</div>

									</div>
								</div>
							</div>
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
		$('.area').css('height', winHeight = $(window).height() - 60);
		$('.s-row').change(
				function() {
					$('.seat').remove();
					for (i = 1; i <= $(this).val(); i++) {
						$('.a,.b,.c,.d,.e,.f').append(
								'<div class="seat as-n'+i+'">' + i + '</div>');
					}
				});
		$('.cl-add').click(function() {

			var f = t = 0, wing, cl;
			f = $('.fr').val();
			cl = $('.cl').val();
			alert(f);
			t = Number($('.to').val());
			wing = $('.wing').val();
			if (f > t) {
				alert("select ascending order sequence");

			} else {
				while (f <= t) {
					$('.' + wing + ' .as-n' + f + '').css({
						'background-color' : '' + cl + ''
					});
					f++;
				}
			}
		});
		$('.airline')
				.change(
						function() {
							var t = $(this).val();
							if (t != 0) {
								$.ajax({
									url : 'getplainname.jsp',
									data : 'aname=' + t,
									type : 'post',
									success : function(r) {
										$('.pname').html(r);
									}
								});
							} else {
								$('.pname')
										.html(
												"<option value='0'>Select Plain name</option>");
							}
						});
	</script>
</body>
</html>