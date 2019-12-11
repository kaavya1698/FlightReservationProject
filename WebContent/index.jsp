<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style>
input[type=text], select {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}

input[type=submit] {
  width: 100%;
  background-color: #d82424;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

input[type=submit]:hover {
  background-color: #b42424;
}
</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>RU Flying</title>
</head>
<body>
Create Customer Account 								  
<br>


<form method="post" action="Create_user.jsp">
  	Username<input name="username" type="text"/>
  	<br>
  	Password<input name="password" type="text"/>
  	<br>
  	Name<input name="name" type="text"/>
  <br>
  <input type="submit" name="create" value="create user"/>
</form>
<br>
<br>
<br>
<form method= "post" action="Login.jsp">
	Username<input name="username" type="text"/>
	<br>
	Password<input name="password" type="text"/>
	<br>
	<input type="submit"  name="login" value="Login"/>
</form>
<form method= "post" action="Admin.jsp">
	<br>
	<br>
	<br>
	Admins
	<br>
	Username<input name="AdminName" type="text">
	<br>
	Password<input name="AddPass" type="text">	
	<br>
	<input type="submit" name="loginA" value="LoginA">
</form>	
<br>
<form method= "post" action="CustomerRep.jsp">
	<br>
	<br>
	<br>
	Customer Rep
	<br>
	Username<input name="RepName" type="text">
	<br>
	Password<input name="RepPass" type="text">	
	<br>
	<input type="submit" name="loginR" value="LoginR">
</form>	
</body>
</html>