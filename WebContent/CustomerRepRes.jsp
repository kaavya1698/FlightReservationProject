<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User page</title>
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
	String newUser = request.getParameter("UserName");
	String rep = request.getParameter("RepName");
	try {

		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();

		//Create a SQL statement
		Statement stmt = con.createStatement();

		//Get parameters 


		//String newpass = request.getParameter("password");
		
		//Get the user name and check for login
		ResultSet rs2  = stmt.executeQuery("Select user_name from Users where user_name='"+newUser+"'");
		rs2.next();
		String usrname = rs2.getString(1);
		
		ResultSet rs3  = stmt.executeQuery("Select account_number from Customer where user_name='"+usrname+"'");
		rs3.next();
		int acctnumber = rs3.getInt(1);
		
		
		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();
		
		%>
		Customer Rep: <%=rep%>
		Now Acting on behalf of <%=usrname%> , Account Number <%=acctnumber %>
		<form method= 'post' action='index.jsp'>
		<input type='submit'  name='logout' value='Logout'/>
		</form>

		
	<% } catch (Exception ex) {
		out.print(ex);
		out.print("wrong username or password");
		%>
		<form method= 'post' action='index.jsp'>
		<input type='submit'  name='logout' value='Logout'/>
		</form>
		
	<% } %>
	

<form method= "post" action="CustomerRepFlights.jsp">
<input type='radio' name='flighttype' checked="checked" value='1way' onclick="document.getElementById('datepicker').removeAttribute('disabled');document.getElementById('datepicker2').setAttribute('disabled');">

one way
<input type='radio' name='flighttype' value='Round' onclick="document.getElementById('datepicker2').removeAttribute('disabled');document.getElementById('datepicker').removeAttribute('disabled');">
round trip
<input type='radio' name='flex' value= 'flexed'>
Flex
<input type='radio' name='flex' value= 'nonflex' checked="checked">
no-Flex
<br>
max price<input type="number" id="maxp"  name="maxp" min="0" value="1000">
<br>
max#of stops<input name="maxs" type="number" min="1" value="0">
<br>
Airline
<Select  name="Airline">
	<option value="any(select airline_id from Flights) ">all</option>
	<option value="'SW'">Southwest</option>
	<option value="'AA'">American</option>
	<option value="'UN'">United</option>
	<option value="'JB'">JetBlue</option>
</Select>
<label for="datepicker">Daprture date:</label>
                <input type="text" name="DDate" id="datepicker">
  <label for="datepicker">Return date:</label>
                <input type="text" name="RDate" id="datepicker2" disabled>
<input type="submit" id="GO"  name="GO" value="GO"/>
<br>
sort by:<input type='radio' name='sort_type' value='fare_economy' checked='checked' >price
<input type='radio' name='sort_type' value='depart_time'  >take off
<input type='radio' name='sort_type' value='Landing_time' >land
<%String f=request.getParameter("username"); %>
<input type="hidden" name="username" value=<%=newUser%> >
<input type="hidden" name="repName" value=<%=rep%> >

</form>

</body>
</html>