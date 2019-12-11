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
		Please enter an airport to add:
		<form method= 'post' action='CustomerRepAddAircraft.jsp'>
		<br>
		Aircraft ID:<input name="aircraftid" type="text">
		Airline ID:<input name="airlineid" type="text">
		Capacity:<input name="capacity" type="text">
		<input type="submit" name="Go" value="Add">		
		</form>
<table id="t01">
        <thead>
            <tr>
                <td>Aircraft ID</td>
                <td>Airline ID</td>
                <td>Capacity</td>
                
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
    		ResultSet res= stmt.executeQuery("SELECT * FROM FlightReservationSystem.Aircraft;");
    		while(res.next()){
    		%>
    		<form method="post" action="CustomerRepDeleteAircraft.jsp">
    		<tr><td><%=res.getString("aircraft_id")%></td><td><%=res.getString("airline_id")%></td><td><%=res.getString("capacity")%></td>
    		<input type="hidden" name=aircraftid value=<%=res.getString("aircraft_id")%>>
    		<td><input type="submit" name=book value="delete"></td> </tr>
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