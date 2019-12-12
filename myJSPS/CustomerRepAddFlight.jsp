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
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script>
            $(function () {
                $("#datepicker").datepicker();
            });
        </script>

</head>
<body>
	<%
     	try{
			

			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
			String flightnumber = request.getParameter("flightnumber");
			String destinationid = request.getParameter("destination_id");
			String departureid = request.getParameter("departure_id");
			String airlineid = request.getParameter("airlineid");
			String aircraftid = request.getParameter("aircraftid");
			String flighttype = request.getParameter("flighttype");
			String price = request.getParameter("price");
			String stops = request.getParameter("stops");
			String landingtime = request.getParameter("landing");
			String departtime = request.getParameter("departtime");
			String filledseats = request.getParameter("filled_seats");
			String departdate=request.getParameter("DDate");
				//"++"
					
			//LocalDate date = LocalDate.parse("2018-05-05");

    		PreparedStatement ps = con.prepareStatement("INSERT INTO FlightReservationSystem.`Flights` (flight_number, destination_id, departure_id, airline_id, aircraft_id, flight_type, fare_economy, num_stops, Landing_time, depart_time, filled_seats, depart_date) VALUES ('"+flightnumber+"', '"+destinationid+"', '"+departureid+"', '"+airlineid+"', '"+aircraftid+"', '"+flighttype+"', '"+price+"', '"+stops+"', '"+ landingtime+"', '"+departtime+"', '"+filledseats+"', '"+departdate+"')");
		   	//out.print(ps);
    		ps.executeUpdate();
 %>
		    Aircraft Successfully Added!
			<form method= 'post' action='CustomerRepEditFlights.jsp'>
			<input type='submit'  name='logout' value='Back to Flights'/>
			</form>
		    
		    
<%		    

    		con.close();
     		}
		catch(Exception ex){
			//out.print(ex);
			%>
			Input Error!!!
			<form method= 'post' action='CustomerRepEditFlights.jsp'>
			<input type='submit'  name='logout' value='Back to Flights'/>
			</form>
			
			
			<%
		}
	%>
</body>
</html>