<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="db.*"%>
<%
MultipartRequest m=new MultipartRequest(request,"C:\\Users\\Akash Pawar\\workspace\\FlightReservation\\WebContent\\images\\airline\\",10024*10024);
Connection con=DbCon.con();
String Aname,city,address;
Aname=m.getParameter("aname");
city=m.getParameter("pname");
address=m.getFilesystemName("image");
String query="insert into airline (ar_id, pname, image)values(?,?,?)";
PreparedStatement ps=con.prepareStatement(query);
ps.setString(1,Aname);
ps.setString(2,city);
ps.setString(3,"airline/"+address);

int i=ps.executeUpdate();
if(i==1){%>
<script>
alert("Register Successfully");
location.href="addairport.jsp";
</script>
<%}%>