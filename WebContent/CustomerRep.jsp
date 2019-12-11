<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Customer Rep Page</title>
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
		String RAdmin = request.getParameter("RepName");
		String RPass = request.getParameter("RepPass");
		
		
		//Get the user name and check for login
		ResultSet rs2  = stmt.executeQuery("Select user_name from Customer_Rep Natural join Users where user_name ='"+RAdmin+"'AND password='"+RPass+"'");
		rs2.next();
		String usrname = rs2.getString(1);
		
	
		
		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();
		out.print("Weclome, "+RAdmin +"\n");
		out.print("<br>");
		out.print("Enter username that you would like to reserve on behalf of:\n");
		%>
		
	    <form method= "post" action="CustomerRepRes.jsp">
		<br>
		Username<input name="UserName" type="text">
		<input name="RepName" type="hidden" value=<%=RAdmin %>>
		<input type="submit" name="Go" value="Go">
		</form>	
		<br>
		Please enter a flight number to view its waitlist:
		<form method= 'post' action='CustomerRepWaitlist.jsp'>
		<br>
		Flight<input name="flightnumber" type="text">
		<input type="submit" name="Go" value="Go">		
		
		
		</form>
		<br>
	
		Please enter a username to edit a users reservation(s):
		<form method= 'post' action='CustomerRepEdit.jsp'>
		<br>
		Username<input name="username" type="text">
		<input type="submit" name="Go" value="Go">		
		</form>
		
		<form method= 'post' action='CustomerRepAirports.jsp'>
		<br>
		Edit, Add, or Delete Airports
		<input type="submit" name="Go" value="Go">		
		</form>
		<br>
		
		
		<form method= 'post' action='CustomerRepAircrafts.jsp'>
		<br>
		Edit, Add, or Delete Aircrafts
		<input type="submit" name="Go" value="Go">		
		</form>
		
		
		<form method= 'post' action='CustomerRepEditFlights.jsp'>
		<br>
		Edit, Add, or Delete Flights
		<input type="submit" name="Go" value="Go">		
		</form>
		<%} catch (Exception ex) {
		//out.print(ex);
		out.print("wrong username or password");
		%>
		<input type='submit'  name='logout' value='Back to Login Page/Logout'/>
		<%}%>


</body>
</html>