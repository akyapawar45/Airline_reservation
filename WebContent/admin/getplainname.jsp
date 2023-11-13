<%@page import="db.DbCon"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
Connection con=DbCon.con();
String aid=request.getParameter("aname");

PreparedStatement ps=con.prepareStatement("select a.al_id,a.pname,b.al_id from airline as a left outer  join plain_body as b on a.al_id=b.al_id where b.al_id is null and a.ar_id="+aid);
ResultSet rs=ps.executeQuery();
%>
<option value="0">Select Plain</option>
<% 
while(rs.next())
{%>
<option value="<%=rs.getString(1)%>"><%=rs.getString(2)%></option>	
<%}
%>