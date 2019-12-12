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
     		String airport = request.getParameter("airport");


    		PreparedStatement ps = con.prepareStatement("INSERT INTO FlightReservationSystem.`Airports` (airport_id) VALUES ('"+airport+"');");
		    ps.executeUpdate();
 %>
		    Airport Successfully Added!
			<form method= 'post' action='CustomerRepAirports.jsp'>
			<input type='submit'  name='logout' value='Back to Airports'/>
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