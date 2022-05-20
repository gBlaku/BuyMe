<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Hi Beer World</title>
	</head>
	
	<body>

	Existing User Log-in:
	<br>
		<form method="post" action="BuyMeHome.jsp">
		<table>
		<tr>    
		<td><input type="text" name="username" placeholder ="Username"></td>
		</tr>
		<tr>
		<td><input type="password" name="pass" placeholder = "Password"></td>
		</tr>
		<tr>
		</table>
		<input type="submit" value="Login">
		</form>
	<br>
	Register new account:
	<br>
		<form method="post" action="register.jsp">
		<table>
		<tr>    
		<td><input type="text" name="username" placeholder ="Username"></td>
		</tr>
		<tr>
		<td><input type="password" name="pass" placeholder = "Password"></td>
		</tr>
		<tr>
		</table>
		<input type="submit" value="Register">
		</form>
	<br>
	Administrator Log-in:
	<br>
		<form method="post" action="adminHomepage.jsp">
		<table>
		<tr>    
		<td><input type="text" name="username" placeholder ="Username"></td>
		</tr>
		<tr>
		<td><input type="password" name="pass" placeholder = "Password"></td>
		</tr>
		<tr>
		</table>
		<input type="submit" value="Login">
		</form>
	<br>
	Customer Service Rep Log-in:
	<br>
		<form method="post" action="customerServiceRepHomepage.jsp">
		<table>
		<tr>    
		<td><input type="text" name="username" placeholder ="Username"></td>
		</tr>
		<tr>
		<td><input type="password" name="pass" placeholder = "Password"></td>
		</tr>
		<tr>
		</table>
		<input type="submit" value="Login">
		</form>
	<br>
	
	
	

</body>
</html>