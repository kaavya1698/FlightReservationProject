<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
</head>
<body>
	<%
     	try{
			

     		ApplicationDB db = new ApplicationDB();	
    		Connection con = db.getConnection();
     		String ticketnumber=request.getParameter("ticketnumber");
     		String customername=request.getParameter("customername");
     		String seatclass=request.getParameter("class");
     		String seat=request.getParameter("seat");
			
     		if (customername != null){
     			out.print("ASDF!!!");
     			PreparedStatement ps = con.prepareStatement("UPDATE Reserves SET user_name = '"+customername +"' WHERE ticket_number = '"+ticketnumber+"';");
    		    ps.executeUpdate(); 
     			PreparedStatement ps2 = con.prepareStatement("UPDATE Ticket SET user_name = '"+customername +"' WHERE ticket_number = '"+ticketnumber+"';");
    		    ps2.executeUpdate(); 
    		  
    		    
     		}
     		if (seatclass != null){
     			PreparedStatement ps = con.prepareStatement("UPDATE Reserves SET user_name = '"+customername +"' WHERE ticket_number = '"+ticketnumber+"';");
    		    ps.executeUpdate(); 
     		}
 		   
 %>
		    Changes Made!
			<form method= 'post' action='CustomerRepEditFlights.jsp'>
			<input type='submit'  name='logout' value='Back to flights'/>
			</form>		    
		    
<%		    
    		con.close();
     		}
		catch(Exception ex){
			out.print(ex);
		}
	%>
</body>
</html>