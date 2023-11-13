<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<style>
#ul1 {

  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
  background-color: #333;
}

#l1 {
  float: left;
}

#l1 a {

  display: block;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

#l1 a:hover:not(.active) {
  background-color: #111;
}

.active {
  background-color: #04AA6D;
}
</style>
</head>
<body>
<ul id="ul1">
  <li id="l1"><a class="active" href="index.jsp">Home</a></li>
  <li id="l1"><a href="about.jsp">About</a></li>

  <li id="l1"><a href="privacy.jsp">Privacy</a></li>
  <li id="l1"><a href="Disklmaier.jsp">Disklmaier</a></li>
</ul>

</body>
</html>


