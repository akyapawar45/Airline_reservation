<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.lang.*,java.sql.*,db.*"%>
<%
Connection con = DbCon.con();
int done=0; PreparedStatement  ps=null;
 int count=Integer.parseInt(request.getParameter("count"));
 for(int i = 1;i<=count;i++){
	 String u_id = session.getAttribute("userId").toString();
	 String p_id=request.getParameter("al");
	 String seat = request.getParameter("seat"+i);
	 String price = request.getParameter("price");
	 String gtotal = request.getParameter("gtotal");
	 String date = request.getParameter("date");
	 String time = request.getParameter("time");
	 String aid = request.getParameter("aid");
	 String rout_id = request.getParameter("rout_id");
	 
	 ps = con.prepareStatement("insert into seatbookfinal(u_id, p_id, seat, price, gtotal, date,time,aid,rout_id) values(?,?,?,?,?,?,?,?,?)");
	 ps.setString(1, u_id);
	 ps.setString(2, p_id);
	 ps.setString(3, seat);
	 ps.setString(4, price);
	 ps.setString(5, gtotal);
	 ps.setString(6, date);
	 ps.setString(7, time);
	 ps.setString(8, aid);
	 ps.setString(9, rout_id);
	 
	 done = ps.executeUpdate();
	 
 }
 
 if(done > 0){
	 ps = con.prepareStatement("delete from seatbook where u_id=? and p_id=? and date=? and time=?");
	 ps.setString(1, session.getAttribute("userId").toString());
	 ps.setString(2, request.getParameter("al"));
	 ps.setString(3, request.getParameter("date"));
	 ps.setString(4, request.getParameter("time"));
	 done = ps.executeUpdate();
 	 %>
	 <script>
	 	alert("Booking Succesful");
	 	location.href="index.jsp";
	 </script>
	 <%
 }else{
	 %>
	 <script>
	 	alert("We are facing some issue try again");
	 	location.href="index.jsp";
	 </script>
	 <%
 }
%>