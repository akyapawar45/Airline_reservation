<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="db.*"%>
<%
Connection con=DbCon.con();
String apname,src,dest,airname,pname,stype,price,time,date;
apname=request.getParameter("apname");
src=request.getParameter("src");
dest=request.getParameter("dest");
date=request.getParameter("date");
airname=request.getParameter("airname");

pname=request.getParameter("pname");
stype=request.getParameter("stype");
price=request.getParameter("price");
time=request.getParameter("time");
String query="insert into rout (a_id, source, destination, ar_id, al_id, seattype, price, time, date)values(?,?,?,?,?,?,?,?,?)";
PreparedStatement ps=con.prepareStatement(query);
ps.setString(1,apname);
ps.setString(2,src);
ps.setString(3,dest);
ps.setString(4,airname);
ps.setString(5,pname);
ps.setString(6,stype);
ps.setString(7,price);
ps.setString(8,time);
ps.setString(9,date);

int i=ps.executeUpdate();
if(i==1){%>
<script>
alert("Register Successfully");
location.href="addtimerout.jsp";
</script>
<%}%>