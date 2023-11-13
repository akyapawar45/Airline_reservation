<%@page import="db.DbCon"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="head.jsp"></jsp:include>
<style type="text/css">
.detail{
   width: 100%;
   border: 2px solid black;
   padding: 20px;
   color: white;
   background: purple;
   opacity: 0.9;
   
}
</style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>


  <div class="container">
    <div class="row">
    <div class="col-md-12 detail">
    <h4>Seat Detail</h4>
     <%
        Connection con = DbCon.con();
        String sql="select sf.*,al.*,ap.*,ar.*,r.* from seatbookfinal as sf inner join airline as al on sf.p_id=al.al_id inner join airpoort as ap on sf.aid=ap.aid inner join airlinename as ar on al.ar_id=ar.ar_id inner join rout as r on sf.rout_id=r.r_id where sf.u_id=? and sf.p_id=? and sf.date=? and sf.time=? and sf.gtotal=?";
        PreparedStatement ps=con.prepareStatement(sql);
        ps.setString(1, session.getAttribute("userId").toString());
        ps.setString(2, request.getParameter("pId"));
        ps.setString(3, request.getParameter("date"));
        ps.setString(4, request.getParameter("time"));
        ps.setString(5, request.getParameter("gtotal"));
        ResultSet rs=ps.executeQuery();
        String price=""; String date=""; String time=""; String gtotal="";
        String airlineName="",Source="",Destination="",seatType="",pname="";
        int count=0;
        while(rs.next()){
        	price=rs.getString("price");
        	date=rs.getString("date");
        	time=rs.getString("time");
        	gtotal=rs.getString("gtotal");
        	airlineName=rs.getString("ar_name");
        	Source=rs.getString("Source");
        	Destination=rs.getString("Destination");
        	seatType=rs.getString("seattype");
        	pname=rs.getString("pname");
        	
     %>
       
          <span style="font-size: 22px;">[ <%=rs.getString("seat") %> ] &nbsp;&nbsp;</span>
          
              <%count++;} %>
              <br><br>
          <div class="row">
          
           <div class="col-md-3">
            <p>Plain Name : <span><%=pname %></span></p>
          </div>
          
           <div class="col-md-3">
            <p>Airline Name : <span><%=airlineName %></span></p>
          </div>
          
          <div class="col-md-3">
            <p>Source : <span><%=Source %></span></p>
          </div>
          
          <div class="col-md-3">
            <p>Destination: <span><%=Destination %></span></p>
          </div>
          
          <div class="col-md-2">
            <p>seatType: <span><%=seatType %></span></p>
          </div>
          
           <div class="col-md-2">
            <p>Plain Price : <span><%=price %></span></p>
          </div>
          <div class="col-md-2">
            <p>Grand Total : <span><%=Integer.parseInt(price)*count %></span></p>
          </div>
           <div class="col-md-2">
            <p>Date : <span><%=date %></span></p>
          </div>
          <div class="col-md-2">
            <p>Time : <span><%=time %></span></p>
          </div>
          
          </div>
       

    </div>
    </div>
  </div>

</body>
</html>