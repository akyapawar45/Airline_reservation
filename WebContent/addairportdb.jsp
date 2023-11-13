<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="db.*"%>
<%
Connection con=DbCon.con();
String Aname,city,address;
Aname=request.getParameter("aname");
city=request.getParameter("city");
address=request.getParameter("address");
String query="insert into airpoort (name, city, address)values(?,?,?)";
PreparedStatement ps=con.prepareStatement(query);
ps.setString(1,Aname);
ps.setString(2,city);
ps.setString(3,address);

int i=ps.executeUpdate();
if(i==1){%>
<script>
alert("Register Successfully");
location.href="addairport.jsp";
</script>
<%}%>