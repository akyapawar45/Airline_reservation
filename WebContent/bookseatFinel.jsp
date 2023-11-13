<%@page import="db.DbCon"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Airline</title>
<jsp:include page="head.jsp"></jsp:include>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style type="text/css">
.paymentDetail {
	width: 100%;
	height: auto;
	padding: 20px;
	background: purple;
	color: white;
	text-align: center;
}
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>

	<div class="container">

		<div class="row">
			<div class="col-md-3"></div>

			<div class="col-md-5">
				<form action="bookseatfinaldb.jsp" id="bookseatfinaldb">
					<div class="paymentDetail">
						<div class="row">

							<div class="col-md-12">
								<h3>
									<i class="fa fa-plane" style="font-size: 48px; color: red"></i>
									<%=request.getParameter("plainName")%></h3>
								<input type="hidden" name="planeName"
									value="<%=request.getParameter("plainName")%>"> <br>
							</div>
							<div class="col-md-6">
								<h5>
									Date & Time:
									<%=request.getParameter("date")%> : <%=request.getParameter("time")%></h5>
								<input type="hidden" name="date"
									value="<%=request.getParameter("date")%>">

							</div>
							<div class="col-md-6">
								<h4>
									Price : &#8377;<%=" " + request.getParameter("price")%></h4>
								<input type="hidden" name="price"
									value="<%=request.getParameter("price")%>"> <br>
									<input type="hidden" name="al"
									value="<%=request.getParameter("plainId")%>">
									<input type="hidden" name="time"
									value="<%=request.getParameter("time")%>">
									<input type="hidden" name="aid"
									value="<%=request.getParameter("aid")%>">
									<input type="hidden" name="rout_id"
									value="<%=request.getParameter("rout_id")%>">
							</div>
							<h4 style="font-weight: bold;">Seat Number :</h4>
							<%
								int price = Integer.parseInt(request.getParameter("price"));
								Connection con = DbCon.con();
								PreparedStatement ps = con.prepareStatement("select * from seatbook where u_id=? and p_id=?");
								ps.setString(1, session.getAttribute("userId").toString());
								ps.setString(2, request.getParameter("plainId"));
								ResultSet rs = ps.executeQuery();
								int n = 0,i=1;
								while (rs.next()) {
							%>

							<div style="display: inline-block;">
								<span style="font-size: 25px;"><b><%=rs.getString("seat")%>,</b></span>
								<input type="hidden" name="seat<%=i %>"
									value="<%=rs.getString("seat")%>">

							</div>


							<%
								n++;i++;
								}
							%>

						</div>
						<h3>
							Total Price :<span style="color: red;"> &#8377; <%=price * n%></span>
							<input type="hidden" name="gtotal"
									value="<%=price * n%>">
									<input type="hidden" name="count" value="<%=n %>">
						</h3>
						<br> <input type="submit" class="btn btn-primary">
				</form>
			</div>

		</div>
	</div>

	</div>
</body>
</html>