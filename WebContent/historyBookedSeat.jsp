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
     <%
        Connection con = DbCon.con();
        String sql="select sf.*,al.* from seatbookfinal as sf inner join airline as al on sf.p_id=al.al_id where sf.u_id=? group by gtotal,date,time";
        PreparedStatement ps=con.prepareStatement(sql);
        ps.setString(1, session.getAttribute("userId").toString());
        ResultSet rs=ps.executeQuery();
        
        while(rs.next()){
     %>
       <div class="col-md-12 detail">
          <p>Plain Name : <span><%=rs.getString("pname") %></span></p>
          <div class="row">
           <div class="col-md-2">
            <p>Plain Price : <span><%=rs.getString("price") %></span></p>
          </div>
         <%--  <div class="col-md-2">
            <p>Grand Total : <span><%=rs.getString("gtotal") %></span></p>
          </div> --%>
           <div class="col-md-2">
            <p>Date : <span><%=rs.getString("date") %></span></p>
          </div>
          <div class="col-md-2">
            <p>Time : <span><%=rs.getString("time") %></span></p>
          </div>
           <div class="col-md-2">
            <a href="historyBookedSeatDetail.jsp?pId=<%=rs.getString("p_id") %>&&date=<%=rs.getString("date") %>&&time=<%=rs.getString("time") %>&&gtotal=<%=rs.getString("gtotal") %>" class="btn btn-info">View Detail</a>
          </div>
          </div>
       </div>
    <%} %>
    </div>
  </div>

</body>
</html>