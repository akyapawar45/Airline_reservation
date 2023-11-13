<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="about.jsp">MyTicket</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="index.html">Home</a></li>
       <li class="active"><a href="about.jsp">About</a></li>
 
         <li class="active"><a href="privacy.jsp">Privacy</a></li>
          <li class="active"><a href="Disklmaier.jsp">Disclaimer</a></li>
     <!--  <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">About <span ></span></a>
        <ul class="dropdown-menu">
          <li><a href="#">About</a></li>
          
        </ul>
      </li> -->
     <!--  <li><a href="#">Contact</a></li> -->
      
      <%
    if(session.getAttribute("userId")==null){
    %>
      <li class="active"><a href="login.jsp">History Booked Seat</a></li>
    <%}else{ %>
     <li class="active"><a href="historyBookedSeat.jsp">History Booked Seat</a></li>
    <%} %>
      
    </ul>
    <ul class="nav navbar-nav navbar-right">
    <%
    if(session.getAttribute("userId")==null){
    %>
      <li><a href="sign_up.jsp"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
      <li><a href="login.jsp"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
    <%}else{ %>
    <li><a href="#"><span class="glyphicon glyphicon-user"></span> <%=session.getAttribute("userName") %></a></li>
      <li><a href="logout.jsp"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
    <%} %>
    </ul>
  </div>
</nav>