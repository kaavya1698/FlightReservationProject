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
                <td>Waitlist ID</td>
                <td>User Name</td>
                <td>Flight Number</td>
            </tr>
        </thead>
        <tbody>
     	<%
     	try{
     		ApplicationDB db = new ApplicationDB();	
    		Connection con = db.getConnection();
    		String flightnumber= request.getParameter("flightnumber");
    		String rep= request.getParameter("repName");

    		//out.print(dt);
    		//Create a SQL statement
    		Statement stmt = con.createStatement();
    		ResultSet res= stmt.executeQuery("Select * from Waiting where flight_number= "+"'"+flightnumber +"'");
    		while(res.next()){
    		%>
    		
    		<tr><td><%=res.getString("waitlist_id")%></td><td><%=res.getString("user_name")%></td><td><%=res.getString("flight_number")%></td>

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