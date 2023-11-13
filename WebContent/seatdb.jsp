<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,db.DbCon"%>
<%
Connection con=DbCon.con();
String alname,pname,seat,f,t;
alname=request.getParameter("alname");
System.out.println(alname);
pname=request.getParameter("pname");
seat=request.getParameter("seat");
f=request.getParameter("fr");
t=request.getParameter("t");
String query="insert into plain_body(ar_id, al_id, seat_row, bfrom, bto)values(?,?,?,?,?)";
PreparedStatement ps=con.prepareStatement(query);
ps.setString(1,alname);
ps.setString(2,pname);
ps.setString(3,seat);
ps.setString(4,f);
ps.setString(5,t);
int rs=ps.executeUpdate();
if(rs>0)
{%>
	<script>alert("Data added successfully");
	location.href="setseatarrangment.jsp";
	</script>
<%}
%>