<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Page</title>
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
		String Admin = request.getParameter("AdminName");
		String APass = request.getParameter("AddPass");
		
		
		//Get the user name and check for login
		ResultSet rs2  = stmt.executeQuery("Select user_name from Admins Natural join Users where user_name ='"+Admin+"'AND password='"+APass+"'");
		rs2.next();
		String usrname = rs2.getString(1);
		
	
		
		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();
		out.print("Weclome, "+Admin +"\n");
		out.print("<br>");
		out.print("<br>");
		out.print("<br>");

		//out.print("Account Number: "+acctnumber +"\n");
		out.print("<form method= 'post' action='index.jsp'>");
		out.print("<input type='submit'  name='logout' value='Logout'/>");
		out.print("</form>");
		
	} catch (Exception ex) {
		out.print(ex);
		out.print("wrong username or password");
		
	}
	
%>

<form method="post" action="FlgihtRev.jsp">
<br>
<br>
Select an airline to display Total Revenue
<br>
<Select  name="Airline">
	<option value="'SW'">Southwest</option>
	<option value="'AA'">American</option>
	<option value="'UN'">United</option>
	<option value="'JB'">JetBlue</option>
</Select>

<input type="submit" name="Asubmit" value="Asubmit">
</form>

<form method="post" action="FlightRev.jsp">
<br>
<br>
certain flights revenue
Flgiht#<input name="Flight#" type="text">
<br>
<input type="submit" name="Fsubmit" value="Fsubmit">
</form>

<form method="post" action="FlightRev.jsp">
<br>
<br>
certain customers revenue
Customer_ID<input name="Flight#" type="text">
<br>
<input type="submit" name="Fsubmit" value="Fsubmit">
</form>






</body>
</html>