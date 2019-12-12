<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>RU Flying</title>
</head>
<body>
	<%
     	try{
			

     	
     		String ticketnumber=request.getParameter("ticktnumber");
			
    	
 %>

			<form method="post" action="CustomerRepMakeChange.jsp">
    		<input type=hidden name="ticketnumber" value=<%=ticketnumber%>>
    		Change Username<input type=text name="name">
			<Select  name="class">
		    <option value=null>none</option>
			<option value="economy">economy</option>
			<option value="'first class'">class</option>
		
			</Select>
    		<input type="submit" name=book value="Make changes">
    		
    		</form>
    		
    	
<%		    
     		}
		catch(Exception ex){
			out.print(ex);
		}
	%>
</body>
</html>