<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="db.*"%>
<%
Connection con=DbCon.con();
String Aname,city,address;
Aname=request.getParameter("aname");
String query="insert into airlinename(ar_name)values(?)";
PreparedStatement ps=con.prepareStatement(query);
ps.setString(1,Aname);
int i=ps.executeUpdate();
if(i==1){%>
<script>
alert("Register Successfully");
location.href="addairport.jsp";
</script>
<%}%>