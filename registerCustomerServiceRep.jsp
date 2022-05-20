<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="ISO-8859-1">
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

		//Get parameters from the HTML form at the index.jsp
		String newUser = request.getParameter("username");
		String newPass = request.getParameter("pass");


		//Make an insert statement for the Sells table:
		String insert = "INSERT INTO customerServiceReps(username,pass)"
				+ "VALUES (?,?)";
		//Create a Prepared SQL statement allowing you to introduce the parameters of the query
		PreparedStatement ps = con.prepareStatement(insert);
		//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
		ps.setString(1, newUser);
		ps.setString(2, newPass);
		//Run the query against the DB
		ps.executeUpdate();
		//Run the query against the DB
		
		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();
		out.print("Account created.");
		
	} catch (Exception ex) {
		//out.print(ex);
		out.print("Username already exists. Try another one!");
	}
%>
<br><br>
	<br>
		<form method="post" action="HelloWorld.jsp">
		<input type="submit" value="Back to Home">
		</form>
	<br>

</body>
</html>