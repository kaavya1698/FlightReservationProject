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
<table id="t01">
        <thead>
            <tr>
                <td>User Name</td>
                <td>Ticket Number</td>
                <td>Flight Number</td>
                <td>Destination ID</td>
                <td>Departure ID</td>
                <td>Airline ID</td>
                <td>Depart time</td>
            </tr>
        </thead>
        <tbody>
     	<%
     	try{
     		ApplicationDB db = new ApplicationDB();	
    		Connection con = db.getConnection();
    		String User= request.getParameter("username");
    		String rep= request.getParameter("repName");

    		//out.print(dt);
    		//Create a SQL statement
    		Statement stmt = con.createStatement();
    		ResultSet res= stmt.executeQuery("SELECT user_name, ticket_number, flight_number, destination_id, departure_id, airline_id, depart_date,depart_time FROM FlightReservationSystem.Trip NATURAL JOIN Reserves NATURAL JOIN Flights WHERE user_name= '"+"chase"+"'"+";");
    		while(res.next()){
    		%>
    		<form method="post" action="CustomerRepDeleted.jsp">
    		<tr><td><%=res.getString("user_name")%></td><td><%=res.getString("ticket_number")%></td><td><%=res.getString("flight_number")%></td><td><%=res.getString("destination_id")%></td><td><%=res.getString("departure_id")%></td><td><%=res.getString("airline_id")%></td><td><%=res.getString("depart_date")%></td><td><%=res.getString("depart_date")%></td><td><%=res.getString("depart_time")%>
    		<input type="submit" name=book value="delete">
    		<input type="hidden" name=ticketnumber value=<%=res.getString("ticket_number")%>>
    		<input type="hidden" name=flightnumber value=<%=res.getString("flight_number")%>>
    		<input type="hidden" name=username value=<%=res.getString("user_name")%>>
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