<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,java.lang.*,db.*"%>
 <%
 try{
	 String type = request.getParameter("type");
 	 String seatn = request.getParameter("seat");

	 Connection con = DbCon.con();
	 PreparedStatement ps =null; ResultSet rs = null; String sql =""; int done = 0;
	 if(type.equals("insert")){
		 sql="select * from seatbook where seat=? and u_id=? and p_id=? and date=? and time=?";
		 ps = con.prepareStatement(sql);
		 ps.setString(1, seatn);
		 ps.setString(2, session.getAttribute("userId").toString());
		 ps.setString(3, request.getParameter("al"));
		 ps.setString(4, request.getParameter("date"));
		 ps.setString(5, request.getParameter("time"));
		 rs = ps.executeQuery();
		 if(rs.next()){
			 sql="delete from seatbook where s_id=?";
			 ps = con.prepareStatement(sql);
			 ps.setString(1, rs.getString("s_id"));
			 done = ps.executeUpdate();
			 if(done > 0){
				 out.print("white");
			 }else{
				 
			 }
		 }else{
			 ps = con.prepareStatement("insert into seatbook (seat, u_id, p_id, date,time,aid,rout_id) values(?,?,?,?,?,?,?)");
			 ps.setString(1, seatn);
			 ps.setString(2, session.getAttribute("userId").toString());
			 ps.setString(3, request.getParameter("al"));
			 ps.setString(4, request.getParameter("date"));
			 ps.setString(5, request.getParameter("time"));
			 ps.setString(6, request.getParameter("aid"));
			 ps.setString(7, request.getParameter("rout_id"));
			 
			 done = ps.executeUpdate();
			 if(done > 0){
				 out.print("red");
			 }else{
				  
			 }
		 }
	 }else if(type.equals("delete")){
		 
		 sql="delete from seatbook where u_id=?";
		 ps = con.prepareStatement(sql);
		 ps.setString(1, session.getAttribute("userId").toString());
		 done = ps.executeUpdate();
		 if(done > 0){
			
		 }else{
			 
		 }
		 
	 }else if(type.equals("select")){
		 sql="select * from seatbook where u_id=?";
		 ps = con.prepareStatement(sql);
		 ps.setString(1, session.getAttribute("userId").toString());
		 rs = ps.executeQuery();
		 while(rs.next()){
			 out.print(rs.getString("seat")+","); 
	 }
	 }		 
	 
 }catch(Exception e){
	 e.printStackTrace();
 }
 
 %>