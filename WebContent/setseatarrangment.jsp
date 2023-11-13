
<%@page import="db.DbCon"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 <link rel="stylesheet" href="css/pstyle.css">
</head>
<body>

<jsp:include page="header.jsp"></jsp:include>
<%Connection con=DbCon.con();
PreparedStatement ps=con.prepareStatement("select * from airlinename");
ResultSet rs=ps.executeQuery();
%>
<div class="container-fluid">
  <div class="row">
    <div class="col-sm-2">
   <jsp:include page="operation.jsp"></jsp:include>
      </div>
     
    <div class="col-sm-4">
    <form action="seatdb.jsp"  method="post">
      
          <div class="form-horizontal">
          <div class="form-group">
          <label>Airline Name</label>
         	<select class="airline form-control" name="alname"><option value="0" >Select Airline</option>
         	<%while(rs.next()){ %>
         	<option value="<%=rs.getString(1)%>"><%=rs.getString(2)%></option>
         	<%} %>
         	</select>
          </div>
            <div class="form-group">
          <label>Plain Name</label>
          <select class="pname form-control" name="pname"><option>Select Plain</option></select>
          </div>
           <div class="form-group">
          <label>Seat rows</label>
          <input type="text" class="form-control s-row" name="seat">
          </div>
          
          </div>
   		<div class="form-inline"> 
   				<div class="form-group">
   			<label>Select Business Class</label>
   			
   			</div>
   			
<!--    			<div class="form-group"> -->
<!--    			<label>Select Wing</label> -->
<!--    			<select class="form-control wing"> -->
<!--    			<option value="0">Select Wing</option> -->
<!--    			<option value="a">A</option> -->
<!--    			<option value="b">B</option> -->
<!--    			<option value="c">C</option> -->
<!--    			<option value="d">D</option> -->
<!--    			<option value="e">E</option> -->
<!--    			<option value="f">F</option> -->
<!--    			</select> -->
<!--    			</div> -->
   		
   			<div class="form-group">
   			<label>From</label>
   			<input type="text" class="fr" name="fr">
   			<label>to</label>
   			<input type="text" class="to" name="t">
   			</div>
   			
   		 <div class="form-group">
          
          <button class="btn btn-primary form-control">Submit</button>
          </div>
   		</div>
         </form>
     </div> 
      <div class="col-sm-5 area">
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
</body>
<script>
$('.area').css('height',winHeight=$(window).height()-60);
$('.s-row').change(function(){
	$('.seat').remove();
	for(i=1;i<=$(this).val();i++){
	$('.a,.b,.c,.d,.e,.f').append('<div class="seat as-n'+i+'">'+i+'</div>');
	}
});
$('.cl-add').click(function(){
	
	var f=t=0,wing,cl;
	f=$('.fr').val();
	cl=$('.cl').val();
	alert(f);
	t=Number($('.to').val());
	wing=$('.wing').val();
	if(f>t)
		{
		alert("select ascending order sequence");
		
		}
	else
		{
		while(f<=t)
			{
			$('.'+wing+' .as-n'+f+'').css({'background-color':''+cl+''});
			f++;
			}
		}
});
$('.airline').change(function(){
	var t=$(this).val();
	if(t!=0)
		{
		$.ajax({url:'getplainname.jsp',
			data:'aname='+t,
			type:'post',
			success:function(r)
			{
			$('.pname').html(r);	
			}	
			});
		}
	else{
		$('.pname').html("<option value='0'>Select Plain name</option>");	
	}
});
</script>
</html>
