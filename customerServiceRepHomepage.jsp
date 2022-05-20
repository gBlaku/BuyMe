<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
		List<String> list = new ArrayList<String>();

		try {

			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();	
			
			//Create a SQL statement
			Statement stmt = con.createStatement();
			//Get the combobox from the index.jsp
			String user = request.getParameter("username");
			String pass = request.getParameter("pass");
			//Make a SELECT query from the sells table with the price range specified by the 'price' parameter at the index.jsp
			String str = "SELECT * FROM customerServiceReps WHERE username ='" +user+ "'  AND pass ='" +pass+ "'";
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);
			if (result.next() == false)
				out.println("User doesn't exist.");
			else
				out.println("Successful login!");
			//close the connection.
			con.close();
		
		} catch (Exception e) {
			out.print(e);
		}
	%>
	
	<%
		List<String> list2 = new ArrayList<String>();

		try {

			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();	
			String user = request.getParameter("username");
			//Create a SQL statement
			Statement stmt = con.createStatement();
			//Make a SELECT query from the sells table with the price range specified by the 'price' parameter at the index.jsp
			String str = "SELECT * FROM Questions";
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);

			//Make an HTML table to show the results in:
			out.print("<table>");

			//make a row
			out.print("<tr>");
			//make a column
			out.print("<td>");
			out.print("questionId");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("username");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("question");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("reply");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("customerServiceRep");
			out.print("</td>");
			
			out.print("</tr>");

			//parse out the results
			while (result.next()) {
				//make a row
				out.print("<tr>");
				//make a column
				out.print("<td>");
				
				out.print(result.getString("questionId"));
				out.print("</td>");
				out.print("<td>");
				
				out.print(result.getString("username"));
				out.print("</td>");
				out.print("<td>");
				
				out.print(result.getString("question"));
				out.print("</td>");
				out.print("<td>");
			
				out.print(result.getString("reply"));
				out.print("</td>");
				out.print("<td>");
				
				out.print(result.getString("customerServiceRep"));
				out.print("</td>");
				out.print("<td>");
				
				out.print("</tr>");

			}
			out.print("</table>");

			//close the connection.
			con.close();

		} catch (Exception e) {
			out.println(e);
			out.println("Exception happened!");
		}
	%>
	
	Answer Question
	<br>
		<form method="post" action="replyQuestion.jsp">
		<table>
		<tr>    
		<td><input type="number" name="questionId" placeholder ="id"></td>
		</tr>
		<tr>
		<td><input type="text" name="reply" placeholder = "reply"></td>
		</tr>
		<tr>
		
		</table>
		<input type ="hidden" name = "username" value = "<%= request.getParameter("username") %>">
		<input type="submit" value="Answer Question">
		</form>
	<br>
	
	<%
		List<String> list3 = new ArrayList<String>();

		try {

			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();	
			String user = request.getParameter("username");
			//Create a SQL statement
			Statement stmt = con.createStatement();
			//Make a SELECT query from the sells table with the price range specified by the 'price' parameter at the index.jsp
			String str = "SELECT * FROM users";
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);

			//Make an HTML table to show the results in:
			out.print("<table>");

			//make a row
			out.print("<tr>");
			//make a column
			out.print("<td>");
			out.print("username");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("pass");
			out.print("</td>");
			
			out.print("</tr>");

			//parse out the results
			while (result.next()) {
				//make a row
				out.print("<tr>");
				//make a column
				out.print("<td>");
				
				out.print(result.getString("username"));
				out.print("</td>");
				out.print("<td>");
				
				out.print(result.getString("pass"));
				out.print("</td>");
				out.print("<td>");
				
				
				out.print("</tr>");

			}
			out.print("</table>");

			//close the connection.
			con.close();

		} catch (Exception e) {
			out.println(e);
			out.println("Exception happened!");
		}
	%>
	
	Change Existing User Password
	<br>
		<form method="post" action="changedPassword.jsp">
		<table>
		<tr>    
		<td><input type="text" name="username" placeholder ="user"></td>
		</tr>
		<tr>
		<td><input type="password" name="pass" placeholder = "new password"></td>
		</tr>
		<tr>
		
		</table>
		<input type="submit" value="Change Password">
		</form>
	<br>
	
	
	
	
	<%
		List<String> list4 = new ArrayList<String>();

		try {

			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();	
			String user = request.getParameter("username");
			//Create a SQL statement
			Statement stmt = con.createStatement();
			//Make a SELECT query from the sells table with the price range specified by the 'price' parameter at the index.jsp
			String str = "SELECT * FROM bids";
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);

			//Make an HTML table to show the results in:
			out.print("<table>");

			//make a row
			out.print("<tr>");
			//make a column
			out.print("<td>");
			out.print("car_id");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("bid");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("bidder");
			out.print("</td>");
			
			out.print("</tr>");

			//parse out the results
			while (result.next()) {
				//make a row
				out.print("<tr>");
				//make a column
				out.print("<td>");
				
				out.print(result.getString("car_id"));
				out.print("</td>");
				out.print("<td>");
				
				out.print(result.getString("bid"));
				out.print("</td>");
				out.print("<td>");
				
				out.print(result.getString("bidder"));
				out.print("</td>");
				out.print("<td>");
				
				
				out.print("</tr>");

			}
			out.print("</table>");

			//close the connection.
			con.close();

		} catch (Exception e) {
			out.println(e);
			out.println("Exception happened!");
		}
	%>
	
	Remove Bid
	<br>
		<form method="post" action="removeBid.jsp">
		<table>
		<tr>    
		<td><input type="number" name="car_id" placeholder ="car_id"></td>
		</tr>
		<tr>    
		<td><input type="number" name="bid" placeholder ="bid"></td>
		</tr>
		<tr>
		<td><input type="text" name="bidder" placeholder = "bidder"></td>
		</tr>
		<tr>
		
		</table>
		<input type="submit" value="Remove Bid">
		</form>
	<br>
	
	<%
		List<String> list5 = new ArrayList<String>();

		try {

			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();	
			String user = request.getParameter("username");
			//Create a SQL statement
			Statement stmt = con.createStatement();
			//Make a SELECT query from the sells table with the price range specified by the 'price' parameter at the index.jsp
			String str = "SELECT * FROM auctions";
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);

			//Make an HTML table to show the results in:
			out.print("<table>");

			//make a row
			out.print("<tr>");
			//make a column
			out.print("<td>");
			out.print("id");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("car_name");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("miles");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("make_year");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("car_type");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("reserve");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("closingDate");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("closingTime");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("seller");
			out.print("</td>");
		
			
			out.print("</tr>");

			//parse out the results
			while (result.next()) {
				//make a row
				out.print("<tr>");
				//make a column
				out.print("<td>");
				
				out.print(result.getString("id"));
				out.print("</td>");
				out.print("<td>");
				
				out.print(result.getString("car_name"));
				out.print("</td>");
				out.print("<td>");
			
				out.print(result.getString("miles"));
				out.print("</td>");
				out.print("<td>");
			
				out.print(result.getString("make_year"));
				out.print("</td>");
				out.print("<td>");
				
				out.print(result.getString("car_type"));
				out.print("</td>");
				out.print("<td>");
		
				out.print(result.getString("reserve"));
				out.print("</td>");
				out.print("<td>");
		
				out.print(result.getString("closingDate"));
				out.print("</td>");
				out.print("<td>");
			
				out.print(result.getString("closingTime"));
				out.print("</td>");
				out.print("<td>");
		
				out.print(result.getString("seller"));
				out.print("</td>");
				out.print("<td>");
		
				
				out.print("</tr>");

			}
			out.print("</table>");

			//close the connection.
			con.close();

		} catch (Exception e) {
			out.println(e);
			out.println("Exception happened!");
		}
	%>
	
	Remove Auction
	<br>
		<form method="post" action="removeAuction.jsp">
		<table>
		<tr>    
		<td><input type="number" name="id" placeholder ="id"></td>
		</tr>
		<tr>
		
		</table>
		<input type="submit" value="Remove Auction">
		</form>
	<br>
	
	
	
	
	<br><br>
	<br><br>
	<br><br>
	<br><br>
	<br>
		<form method="post" action="HelloWorld.jsp">
		<input type="submit" value="Logout">
		</form>
	<br>
	
	
	
	<%-- 
--%>

</body>
</html>