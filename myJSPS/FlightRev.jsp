<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Flgihts Total Revenue</title>
</head>
<body>
<%
	try {

		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();

		//Create a SQL statement
		Statement stmt = con.createStatement();

		//Get parameters 
		String Fnum = request.getParameter("Flight#");
				ResultSet rs2  = stmt.executeQuery("select sum(fare_economy*filled_seats) from Flights where flight_number="+Fnum);
				rs2.next();
				int total = rs2.getInt(1);
				out.print("Total revenue for Flightnum----");
				out.print(Fnum+"===");
				out.print(total);		
				
				
				//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
				con.close();
				
				
			} catch (Exception ex) {
				out.print(ex);
				out.print("wrong username or password");
				
			}
%>
</body>
</html>