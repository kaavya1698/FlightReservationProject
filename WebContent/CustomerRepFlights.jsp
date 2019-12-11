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
    		String User= request.getParameter("username");
    		out.print("user:" +User);
    		String maxp = request.getParameter("maxp");
    		String stps= request.getParameter("maxs");
    		String sortr= request.getParameter("sort_type");
    		String ftype= request.getParameter("flighttype");
    		String Airl = request.getParameter("Airline");
    		String dt= request.getParameter("DDate");
    		String rep= request.getParameter("repName");

    		//out.print(dt);
    		//Create a SQL statement
    		Statement stmt = con.createStatement();
    		ResultSet res= stmt.executeQuery("Select * from Flights where fare_economy<= "+maxp+" and num_stops<="+stps+" and flight_type='"+ftype +"' and airline_id= "+Airl+" and depart_date= '"+dt+"' order by "+sortr);
    		while(res.next()){
    		%>
    		<form method="post" action="CustomerRepBooked.jsp">
    		<tr><td><%=res.getString("flight_number")%></td><td><%=res.getString("destination_id")%></td><td><%=res.getString("departure_id")%></td><td><%=res.getString("airline_id")%></td><td><%=res.getString("aircraft_id")%></td><td><%=res.getString("flight_type")%></td><td><%=res.getString("depart_time")%></td><td><%=res.getString("Landing_time")%></td><td><%=res.getString("depart_date")%></td><td><%=res.getString("fare_economy")%>
    		<input type="submit" name=book >
    		<%String f=request.getParameter("username"); %>
			<input type="hidden" name="username" value=<%=f%>>
			<input type="hidden" name="Ftype" value=<%=res.getString("flight_type")%>>
			<input type="hidden" name="fare" value=<%=res.getString("fare_economy")%>>
			<input type="hidden" name="flynum" value=<%=res.getString("flight_number")%>>
			<input type="hidden" name="repName" value=<%=rep%>>
			
    		Book</button></td></tr>
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