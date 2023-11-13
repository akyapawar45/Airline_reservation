<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="index.jsp">MyTicket</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="index.jsp">Home</a></li>
  
     <li><a href=""><span class="glyphicon glyphicon-user"></span> <%=session.getAttribute("admin") %></a></li>
      <%
      if(session.getAttribute("admin")=="admin"){
    	  %>
    	  <li><a href="../logout.jsp"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
    	  <%
      }else{
    	  
    	  %>
    	  <li><a href="../login.jsp"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
    	  <script>
    	  	location.reload(true);
    	  	location.href="../login.jsp";
    	  </script>
    	  <%
    	  
      }
      %>
 
    </ul>
  </div>
</nav>