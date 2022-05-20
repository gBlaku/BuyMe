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
		String id = request.getParameter("id");
		//Make an insert statement for the Sells table:
		String insert = "DELETE FROM bids WHERE car_id = '" +id+ "'";
		//Create a Prepared SQL statement allowing you to introduce the parameters of the query
		PreparedStatement ps = con.prepareStatement(insert);
		//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
		//Run the query against the DB
		ps.executeUpdate();
		//Run the query against the DB
		String insert2 = "DELETE FROM auctions WHERE id = '" +id+ "'";
		//Create a Prepared SQL statement allowing you to introduce the parameters of the query
		PreparedStatement ps2 = con.prepareStatement(insert2);
		//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
		//Run the query against the DB
		ps2.executeUpdate();
		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();
		out.print("Removed Auction");
		
	} catch (Exception ex) {
		out.print(ex);
	}
%>
	<br>
		<form method="post" action="HelloWorld.jsp">
		
		<input type="submit" value="Back to Home">
		</form>
	<br>