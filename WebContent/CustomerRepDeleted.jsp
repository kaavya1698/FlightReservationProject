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
     		String User = request.getParameter("username");
     		String ticketnumber=request.getParameter("ticketnumber");
     		String flightnumber=request.getParameter("flightnumber");

    		PreparedStatement ps = con.prepareStatement("DELETE FROM Reserves_Customer_Rep WHERE (ticket_number = '"+ ticketnumber +"'"+")");
		    ps.executeUpdate();

    		PreparedStatement ps1 = con.prepareStatement("DELETE FROM Reserves WHERE (ticket_number = '"+ ticketnumber +"'"+")");
		    ps1.executeUpdate();
		    
    		PreparedStatement ps2 = con.prepareStatement("DELETE FROM Trip WHERE (ticket_number = '"+ ticketnumber +"'"+")");
		    ps2.executeUpdate();
		    
    		PreparedStatement ps3 = con.prepareStatement("DELETE FROM Ticket WHERE (ticket_number = '"+ ticketnumber +"'"+")");
		    ps3.executeUpdate(); %>
		    Reservation Successfully Deleted!
			<form method= 'post' action='CustomerRepEdit.jsp'>
			<input type='submit'  name='logout' value='Back to reservations'/>
			<input type='hidden'  name='username' value=<%=User%>/>
			</form>
		    
		    
		    
		    
		    
<%		    
/*     		PreparedStatement ps4 = con.prepareStatement("INSERT INTO `FlightReservationSystem`.`Ticket` (`ticket_number`, `user_name`, `round_trip`, `booking_fee`, `total_fare`) VALUES ('"+tcknum+" ', '"+User+"', '"+Ftype+"', '6', '"+farec+"');");
		    ps4.executeUpdate();
		    
    		PreparedStatement ps5 = con.prepareStatement("INSERT INTO `FlightReservationSystem`.`Ticket` (`ticket_number`, `user_name`, `round_trip`, `booking_fee`, `total_fare`) VALUES ('"+tcknum+" ', '"+User+"', '"+Ftype+"', '6', '"+farec+"');");
		    ps5.executeUpdate();
		    
    		PreparedStatement ps6 = con.prepareStatement("INSERT INTO `FlightReservationSystem`.`Ticket` (`ticket_number`, `user_name`, `round_trip`, `booking_fee`, `total_fare`) VALUES ('"+tcknum+" ', '"+User+"', '"+Ftype+"', '6', '"+farec+"');");
		    ps6.executeUpdate(); */
    		con.close();
     		}
		catch(Exception ex){
			out.print(ex);
		}
	%>
</body>
</html>