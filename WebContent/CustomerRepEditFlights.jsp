<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Flight Tables </title>
</head>
<body>

		Please enter a flight to add:
		<form method= 'post' action='CustomerRepAddAircraft.jsp'>
		<br>
		Flight Number:<input name="aircraftid" type="text">
		Destination ID:<input name="airlineid" type="text">
		Departure ID:<input name="capacity" type="text">
		Airline ID:<input name="airlineid" type="text">
		Aircraft ID:<input name="aircraftid" type="text">
		Flight Type:<input name="capacity" type="text">
		Price:<input name="airlineid" type="text">
		Number of Stops:<input name="capacity" type="text">
		Landing Time:<input name="capacity" type="text">
		Depart Time:<input name="aircraftid" type="text">
		Filled Seats:<input name="aircraftid" type="text">
		Depart Date:<input name="aircraftid" type="text">
		
		
		<input type="submit" name="Go" value="Add">		
		</form>





<table id="t01">
        <thead>
            <tr>
                <td>Flight_number</td>
                <td>Destination</td>
                <td>Departure</td>
                <td>Airline</td>
                <td>Aircraft</td>
                <td>Flight Type</td>
                <td>Depart time</td>
                <td>Landing time</td>
                <td>Date</td>
                  <td>Fare</td>
            </tr>
        </thead>
        <tbody>
     	<%
     	try{
     		ApplicationDB db = new ApplicationDB();	
    		Connection con = db.getConnection();
    		

    		//out.print(dt);
    		//Create a SQL statement
    		Statement stmt = con.createStatement();
    		ResultSet res= stmt.executeQuery("Select * from Flights");
    		while(res.next()){
    		%>
    		<form method="post" action="CustomerRepDeleteFlight.jsp">
    		<tr><td><%=res.getString("flight_number")%></td><td><%=res.getString("destination_id")%></td><td><%=res.getString("departure_id")%></td><td><%=res.getString("airline_id")%></td><td><%=res.getString("aircraft_id")%></td><td><%=res.getString("flight_type")%></td><td><%=res.getString("depart_time")%></td><td><%=res.getString("Landing_time")%></td><td><%=res.getString("depart_date")%></td><td><%=res.getString("fare_economy")%>
    	
			<input type="hidden" name="flynum" value=<%=res.getString("flight_number")%>>
			<td><input type="submit" name=book value="delete" ></td></tr>
    	
    		</form>
			<%
    		}
    		res.close();
    		stmt.close();
    		con.close();
     	}
     	catch(Exception ex){
     		out.print(ex);
     	}
     	%>
            </tbody>
            </table>
</body>	
</html>