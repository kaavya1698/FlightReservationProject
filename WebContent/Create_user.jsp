<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	try {

		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();

		//Create a SQL statement
		Statement stmt = con.createStatement();
		//gets the count of the users
		ResultSet rs2  = stmt.executeQuery("Select count(*) from Users");
		rs2.next();
		int rowcount = rs2.getInt(1);
		System.out.println(rowcount);
		//Get parameters from the HTML form at the index.jsp
		String newUser = request.getParameter("username");
		String newpass = request.getParameter("password");
		String name = request.getParameter("name");
		
		if("".equals(newUser.trim()) || "".equals(newpass.trim())||  "".equals(name.trim())){
			throw new IllegalArgumentException();
		}
		
		//Make an insert statement for the user table:
		String insert = "INSERT INTO Users(user_name, password, name)"
						+ "VALUES (?, ?, ?)";
		
		//Make an insert statement for the Customer table
		String insertCustomer = "INSERT INTO Customer(user_name, account_number)"
				+ "VALUES (?, ?)";
		PreparedStatement ps = con.prepareStatement(insert);
		PreparedStatement psCustomer = con.prepareStatement(insertCustomer);
		//Create a Prepared SQL statement allowing you to introduce the parameters of the query
		ps = con.prepareStatement(insert);
		
		//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
		ps.setString(1, newUser);
		ps.setString(2, newpass);
		ps.setString(3, name);
		
		psCustomer.setString(1,newUser);
		psCustomer.setInt(2,rowcount);

		//Run the query against the DB
		ps.executeUpdate();
		psCustomer.executeUpdate();
		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		out.print("Successfuly registered! ");
		out.print("<form method= 'post' action='index.jsp'>");
		out.print("<input type='submit'  name='BackToHome' value='GO '/>");
		out.print("</form>");
		//out.print("insert succeeded");
		
	}catch (IllegalArgumentException ex) {
		//out.print(ex);
		//out.print("Registration failed: Username already exists");
		//out.print("Registration failed: Username already exists");
		out.print("Registration failed: Do not leave fields empty");
		out.print("<form method=\"post\" action=\"Create_user.jsp\">");
		out.print("Username<input name=\"username\" type=\"text\"/>");
		out.print("<br>");
		out.print("Password<input name=\"password\" type=\"text\"/>");
		out.print("<br>");
		out.print("Name<input name=\"name\" type=\"text\"/>");
		out.print("<br>");
		out.print("  <input type=\"submit\" name=\"create\" value=\"create user\"/>");
		out.print("</form>");
	} 
	catch (Exception ex) {
		//out.print(ex);
		out.print("Registration failed: Username already exists");
		out.print("<form method=\"post\" action=\"Create_user.jsp\">");
		out.print("Username<input name=\"username\" type=\"text\"/>");
		out.print("<br>");
		out.print("Password<input name=\"password\" type=\"text\"/>");
		out.print("<br>");
		out.print("Name<input name=\"name\" type=\"text\"/>");
		out.print("<br>");
		out.print("  <input type=\"submit\" name=\"create\" value=\"create user\"/>");
		out.print("</form>");
				
				
	}

%>
</body>
</html>