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
		String name = request.getParameter("carName");
		String miles = request.getParameter("carMiles");
		String year = request.getParameter("carYear");
		String type = request.getParameter("carType");
		String reserve = request.getParameter("carReserve");
		String closingDate = request.getParameter("carClosingDate");
		String closingTime = request.getParameter("carClosingTime");
		String user = request.getParameter("username");


		//Make an insert statement for the Sells table:
		String insert = "INSERT INTO auctions(car_name,miles,make_year,car_type,reserve,closingDate,closingTime,seller) VALUES (?,?,?,?,?,?,?,?)";
		String keywordTable = "SELECT * FROM keywordAlerts";
		//Create a Prepared SQL statement allowing you to introduce the parameters of the query
		PreparedStatement ps = con.prepareStatement(insert);
		
		//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
		ps.setString(1, name);
		ps.setString(2, miles );
		ps.setString(3, year);
		ps.setString(4, type);
		ps.setString(5, reserve);
		ps.setString(6, closingDate);
		ps.setString(7, closingTime);
		ps.setString(8, user);
		//Run the query against the DB
		ps.executeUpdate();
		ResultSet result = stmt.executeQuery(keywordTable);
		
		while(result.next()){
			String username = result.getString("username");
			String keyword = result.getString("keyword");
			
			if (name.contains(keyword)){
				String insert2 = "INSERT INTO alerts(username, alert) values(?,?)";
				PreparedStatement ps2 = con.prepareStatement(insert2);
				ps2.setString(1, username);
				ps2.setString(2, "One of your interested items was listed!");
				ps2.executeUpdate();
			}
			
		}
		
		//Run the query against the DB
		
		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();
		out.print("Item put up for auction. Congratulations!");
		
	} catch (Exception ex) {
		out.print(ex);
	}
%>
	<br>
		<form method="post" action="HelloWorld.jsp">
		
		<input type="submit" value="Back to Home">
		</form>
	<br>