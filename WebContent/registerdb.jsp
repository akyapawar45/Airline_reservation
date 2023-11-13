<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="db.*"%>
<%
Connection con=DbCon.con();
String name,mob,email,pass;
name=request.getParameter("name");
mob=request.getParameter("mob");
email=request.getParameter("email");
pass=request.getParameter("pass");
String query="insert into registration (name, mob, email, pass)values(?,?,?,?)";
PreparedStatement ps=con.prepareStatement(query);
ps.setString(1,name);
ps.setString(2,mob);
ps.setString(3,email);
ps.setString(4,pass);
int i=ps.executeUpdate();
if(i==1){%>
<script>
alert("Register Successfully");
location.href="login.jsp";
</script>
<%}%>