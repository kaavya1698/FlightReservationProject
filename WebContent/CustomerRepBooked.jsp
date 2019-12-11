<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>booked</title>
</head>
flight booked
<body>
	<%
     	try{
     		ApplicationDB db = new ApplicationDB();	
    		Connection con = db.getConnection();
    		String flynum= request.getParameter("flynum");
    		out.print(flynum+"   ");
    		//gets wether the flight has a waitlist
    		Statement stmt = con.createStatement();
    		ResultSet res= stmt.executeQuery("SELECT seat_id FROM Seats NATURAL JOIN Flights WHERE flight_number = '999' AND seat_id NOT IN (SELECT seat_id FROM Trip) ORDER BY seat_id ASC LIMIT 1;");
    		res.next();
    		String seatnum=res.getString("seat_id"); 
    		out.print(seatnum);
    		
    		String User = request.getParameter("username");
    		String rep = request.getParameter("repName");

    		String Ftype = request.getParameter("Ftype");
    		String fare=request.getParameter("fare");
    		//converts fare to an int
    		int farec= Integer.parseInt(fare);
    		farec=farec+6;
    		Statement stmt2 = con.createStatement();
		    ResultSet res2= stmt2.executeQuery("select MAX(ticket_number) from Ticket");
		    res2.next();
		    int tcknum=res2.getInt("Max(ticket_number)");
		    tcknum++;
		    //out.print(farec);
		    //insert statement for Ticket Table
		    PreparedStatement ps = con.prepareStatement("INSERT INTO `FlightReservationSystem`.`Ticket` (`ticket_number`, `user_name`, `round_trip`, `booking_fee`, `total_fare`) VALUES ('"+tcknum+" ', '"+User+"', '"+Ftype+"', '6', '"+farec+"');");
		    ps.executeUpdate();
		    //insert statement for reserves relation
			PreparedStatement ps2= con.prepareStatement("INSERT INTO `FlightReservationSystem`.`Reserves` (`ticket_number`, `user_name`) VALUES ('"+tcknum+"', '"+User+"');");
		   	ps2.execute();
		   	
		    //insert statement for reserves relation
			PreparedStatement ps3= con.prepareStatement("INSERT INTO `FlightReservationSystem`.`Reserves_Customer_Rep` (`ticket_number`, `user_name`) VALUES ('"+ tcknum +"', '"+rep+"');");
		   	ps3.execute();
		   	//insert statement for the trip table 
		   //	PreparedStatement ps3= con.prepareStatement(INSERT INTO `FlightReservationSystem`.`Trip` (`trip_meal`, `ticket_number`, `flight_number`) VALUES ('0', '2', '999');)
    		con.close();
     		}
		catch(Exception ex){
			out.print(ex);
		}
	%>
</body>
</html>