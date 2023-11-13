<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="db.*"%>
<%
Connection con=DbCon.con();
String name,mob,email,pass;
email=request.getParameter("email");
pass=request.getParameter("pass");
if(email.equals("admin")&&pass.equals("admin"))
{	
	session.setAttribute("admin", "admin");
	%>
	<script>
	alert("Login Successfully");
	location.href="admin/index.jsp";
	</script>
	<%
}
else{
String query="select * from registration where email=? and pass=?";
PreparedStatement ps=con.prepareStatement(query);
ps.setString(1,email);
ps.setString(2,pass);
ResultSet rs=ps.executeQuery();
if(rs.next()){
 session.setAttribute("userId", rs.getString("r_id"));
 session.setAttribute("userName", rs.getString("name"));
%>
<script>
location.href="index.jsp";
</script>
<%}
else{
	%>
	<script>
alert("Email and Password is Wrong");
location.href="login.jsp";
</script>
<%}
}%>