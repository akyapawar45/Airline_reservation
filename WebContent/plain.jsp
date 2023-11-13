<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="db.*"%>
<%
Connection con=DbCon.con();
String Aname,city,address;
Aname=request.getParameter("name");
String query="select * from airline where ar_id=?";
PreparedStatement ps=con.prepareStatement(query);
ps.setString(1,Aname);
ResultSet rs=ps.executeQuery();%>
<option value="0">Select Plain</option>

<%
while(rs.next()){%>
<option value="<%=rs.getString(1) %>"><%=rs.getString(3) %></option>
<%}%>