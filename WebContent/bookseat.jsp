
<%@page import="db.DbCon"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Airline</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 <link rel="stylesheet" href="css/pstyle.css">
 
</head>
<body>

<jsp:include page="header.jsp"></jsp:include>

<div class="container-fluid">
<br><br>
<div class="row">
  <div class="col-md-8">
   <div class="seatBookingDetail">
     <div class="row">
      <div class="col-md-7">
           <b style="color:white;">Plain Name: <span id=""><%=request.getParameter("plainName") %></span></b>
           <br><br>
       </div>
        <div class="col-md-5">
           <b style="color:white;">Date & Time: <span id=""><%=request.getParameter("date") %> : <%=request.getParameter("time") %></span></b>
           <br><br>
       </div>
         <div class="col-md-7">
           <b style="color:white;">Seat Ticket: <span id="seatTicket"></span></b>
            
         </div>
         <div class="col-md-5">
           <b style="color:white;">Seat Bill: <span id="seatTotal"></span></b>
         </div>
          
          <a class="btn btn-info processToBook" href="bookseatFinel.jsp?plainId=<%=request.getParameter("al") %>&&plainName=<%=request.getParameter("plainName")%>&&date=<%=request.getParameter("date")%>&&price=<%=request.getParameter("price")%>&&time=<%=request.getParameter("time")%>&&aid=<%=request.getParameter("aid")%>&&rout_id=<%=request.getParameter("r_id")%>" style="margin-left: 30%;margin-top: 3%;">Process To Book</a> 
          <a class="btn btn-info processToBook1" href="#" class="btn btn-info" style="margin-left: 30%;margin-top: 3%;">Process To Book</a>
      </div>
       
   </div>
  </div>
 </div>
 </div>

<%
String seat="",al=request.getParameter("al"),datee=request.getParameter("date"),time=request.getParameter("time");
String rout_id=request.getParameter("r_id");

Connection con=DbCon.con();
PreparedStatement ps=null; ResultSet rs=null; String sql="";
 ps=con.prepareStatement("select * from plain_body where al_id=?");
ps.setString(1,al);
 rs=ps.executeQuery();
if(rs.next())
{
	seat=rs.getString(4);
}
%>




<div class="container-fluid">
<br><br>

  <div class="row">
    <div class="col-sm-2">
   
      </div>
        <div class="col-sm-2 ">
        </div>
     
      <div class="col-sm-8 area">
    	<div class="p-body">
    		<div class="p-front"><h3>Front</h3><hr></div>
    		<div class="p-seats">
    		<div class="p-left">    			
    			<div class="seats a">A
    	
    			</div>
    			<div class="seats b">B
    			
    			</div>
    		
    			<div class="seats c">C</div>
    		</div>
    		<div class="p-right">
    			<div class="seats d">D</div>
    			<div class="seats e">E</div>
    			<div class="seats f">F</div>
    		</div>
    		
    	</div>
     </div> 
  </div>
</div>
</div>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
<script>
winHeight=$(window).height()-60;
$('.area').css('height',winHeight);	
	for(i=1;i<=40;i++){
		 var a="a";
	$('.a').append("<div class='seat as-n"+i+"' onclick='seatbook(\""+a+i+"\")' id='a"+i+"'>"+i+"</div>");
	}
	for(i=1;i<=40;i++){
		 var a="b";
	$('.b').append("<div class='seat as-n"+i+"' onclick='seatbook(\""+a+i+"\")' id='b"+i+"' >"+i+"</div>");
	}
	for(i=1;i<=40;i++){
		 var a="c";
	$('.c').append("<div class='seat as-n"+i+"' onclick='seatbook(\""+a+i+"\")' id='c"+i+"' >"+i+"</div>");
	}
	for(i=1;i<=40;i++){
		 var a="d";
	$('.d').append("<div class='seat as-n"+i+"' onclick='seatbook(\""+a+i+"\")' id='d"+i+"' >"+i+"</div>");
	}
	for(i=1;i<=40;i++){
		 var a="e";
	$('.e').append("<div class='seat as-n"+i+"' onclick='seatbook(\""+a+i+"\")' id='e"+i+"' >"+i+"</div>");
	}
	for(i=1;i<=40;i++){
		 var a="f";
	$('.f').append("<div class='seat as-n"+i+"' onclick='seatbook(\""+a+i+"\")' id='f"+i+"' >"+i+"</div>");
	}
 
 
		
	 count=0;
		function seatbook(x){
 	 var al=<%=al%>;
 	 var datee = "<%=request.getParameter("date")%>";
 	 var time = "<%=request.getParameter("time")%>";
 	var aid = "<%=request.getParameter("aid")%>";
 	var rout_id = <%=rout_id%>
 
		$.ajax({
			url : 'bookdb.jsp?type=insert&&al='+al+'&&seat='+x+'&&date='+datee+'&&time='+time+'&&aid='+aid+'&&rout_id='+rout_id,
			method : 'post',
			success : function(data){
				if(data.trim() == "white"){
					$("#"+x+"").css({"background":"white"});
					count--;
					$.ajax({
						url : 'bookdb.jsp?type=select',
						method : 'post',
						success : function(data1){
							$(".seatBookingDetail b #seatTicket").html(data1);
							$("#seatTicketInput").val(data1);
							var cal=<%=request.getParameter("price") %>*count;
							$(".seatBookingDetail b #seatTotal").html(cal);
							 
							if(data1.trim()==""){
								 $(".processToBook").hide();
								 $(".processToBook1").show();
								
							}else{
							
								 $(".processToBook").show();
								 $(".processToBook1").hide();
							}
						}
					});
					
				}else if(data.trim() == "red"){
					$("#"+x+"").css({"background":"red"});
					count++;
					$.ajax({
						url : 'bookdb.jsp?type=select',
						method : 'post',
						success : function(data1){
							$(".seatBookingDetail b #seatTicket").html(data1);
							$("#seatTicketInput").val(data1);
							var cal=<%=request.getParameter("price") %>*count;
							$(".seatBookingDetail b #seatTotal").html(cal);
							
							if(data1.trim()==""){
								 $(".processToBook").hide();
								 $(".processToBook1").show();
							}else{
								 $(".processToBook").show();
								 $(".processToBook1").hide();
							}
						}
					});
				}else{
					
				}
			}
		});
		}
		
		window.onload=function(){
			 
			$.ajax({
				url : 'bookdb.jsp?type=delete',
				method : 'post',
				success : function(data){
					
				}
			});
		}
</script>



<%

 ps=con.prepareStatement("select * from seatbookfinal where p_id=? and time=?");
 ps.setString(1,al);
 ps.setString(2,time);
 rs=ps.executeQuery();
while(rs.next())
{
%>
  
  <script type="text/javascript">
      var seatBooked = '<%=rs.getString("seat")%>';
    $("#"+seatBooked+"").removeAttr('onclick');
    $("#"+seatBooked+"").css({"background-color" : "green"});
   </script>
  
<%}
%>



<script type="text/javascript">

 $(".processToBook").hide();
 $(".processToBook1").show();
</script>

</html>
