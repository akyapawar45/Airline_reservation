<%@page import="db.DbCon"%>
<%@page import="java.sql.*"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

	<title>Airline Reservation</title>
	<link rel="stylesheet" href="css/style.css">
	<link href='//fonts.googleapis.com/css?family=Open+Sans:400,300italic,300,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
	<link href='//fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="keywords" content="Flight Ticket Booking  Widget Responsive, Login Form Web Template, Flat Pricing Tables, Flat Drop-Downs, Sign-Up Web Templates, Flat Web Templates, Login Sign-up Responsive Web Template, Smartphone Compatible Web Template, Free Web Designs for Nokia, Samsung, LG, Sony Ericsson, Motorola Web Design" />
	<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style>
h3
{
color:#FFC107;
}
</style>
</head>
<body>

<jsp:include page="header.jsp"></jsp:include>

<%String  from,to,depart,retur,clas,adul,child,sql;
//query="select a.al_id,a.pname,a.image,b.ar_name,r.* from rout as r inner join airline as a inner join airlinename as b on a.ar_id=b.ar_id=r.ar_id where source=? and date=?";
/* retur=request.getParameter("return");
from=request.getParameter("from");
to=request.getParameter("to");
depart=request.getParameter("depart");
clas=request.getParameter("clas");
adul=request.getParameter("adul");
child=request.getParameter("child");
System.out.print(depart);
if(retur=="")
{
session.setAttribute("retur",retur);
session.setAttribute("from",from);
session.setAttribute("depart",depart);
session.setAttribute("clas",clas);
session.setAttribute("adul",adul);
session.setAttribute("cild",child);
session.setAttribute("to",to);

}
else
{
	session.setAttribute("from",from);
	session.setAttribute("depart",depart);
	session.setAttribute("clas",clas);
	session.setAttribute("adul",adul);
	session.setAttribute("cild",child);
	session.setAttribute("to",to);	

} */

%>

<div class="container">
<div class="row" style="background-color: white">
<div class="col-md-1"></div>
<div class="col-md-9">
<h2>Searched Results</h2><hr>
<div class="plains-t">
<%Connection con=DbCon.con(); 
sql="select r.*,ap.*,ar.ar_name,al.* from rout as r inner join airpoort as ap on r.a_id=ap.name inner join airlinename as ar on r.ar_id=ar.ar_id inner join airline as al on r.al_id=al.al_id";
PreparedStatement ps=con.prepareStatement(sql);
//ps.setString(1,from);
//ps.setString(2,depart);
ResultSet rs=ps.executeQuery();
String date="";
int i =1;
while(rs.next()){
	date=rs.getString("date");
%>
	<div style="padding:10px;border:1px solid;" id="<%=i%>">++
	 <div style="float:right">
	 <a  id="book<%=i%>" onclick="return expireDate(<%=i%>)" class="btn btn-primary"href="bookseat.jsp?al=<%=rs.getString("al_id")%>&&plainName=<%=rs.getString("pname")%>&&date=<%=rs.getString("date")%>&&price=<%=rs.getString("price")%>&&time=<%=rs.getString("time")%>&&aid=<%=rs.getString("aid")%>&&r_id=<%=rs.getString("r_id")%>">Book</a>
	 </div>
	<p>
	   <img src="images/<%=rs.getString("image")%>" height="50" width="50">
	   Plain Name: <%=rs.getString("pname")%> / Airline Name: <%=rs.getString("ar_name")%>
	</p> 
	
	<p>
	<span><b>Source:</b> <%=rs.getString("source")%></span> <span><b>Destination:</b> <%=rs.getString("destination")%></span>
	</p>
    
    <p>Date & Time: <%=rs.getString("date")%> : <%=rs.getString("time")%>  <br><span>Seat Type: <%=rs.getString("seattype")%></span></p>
    
    <p>seats:<span></span>Ticket Price : <%=(Integer.parseInt(rs.getString("price")))%> Rs.</p>
		
	</div>
<%i++;} %>
</div>
</div>
</div>
</div>


 <script>  
    function expireDate(x){
         var date1, date2;  
        
         date1 = new Date("<%=date%>");
        
         date2 = new Date();  
  
       
         var time_difference = date2.getTime() - date1.getTime();  
  
       
         var days_difference = time_difference / (1000 * 60 * 60 * 24);  
           
         if(days_difference >= 1){
        	 /* alert("Date Are OuteDated Book Another Flight"); */
         }else{
        	/*  alert("no"); */
         }
         
         console.log(x);  
    }
    
  
      </script>    
      

</body>
</html>