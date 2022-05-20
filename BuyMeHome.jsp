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
			String str = "SELECT * FROM users WHERE username ='" +user+ "'  AND pass ='" +pass+ "'";
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
	<br>
		<form method="post" action="HelloWorld.jsp">
		<input type="submit" value="Logout">
		</form>
	<br>
	
	Sell new item:
	<br>
		<form method="post" action="addCar.jsp">
		<table>
		<tr>    
		<td>Car name</td><td><input type="text" name="carName"></td>
		</tr>
		<tr>
		<td>Miles</td><td><input type="number" name="carMiles"></td>
		</tr>
		<tr>
		<td>Year of car (1900-2022)</td><td><input type="number" min = "1900" max = "2022" name="carYear"></td>
		</tr>
		<tr>
		<td> Type of Car </td> <td>
			<select name="carType" size=1>
				<option value="sport">sport</option>
				<option value="suv">suv</option>
				<option value="luxury">luxury</option>
				<option value="crossover">crossover</option>
				<option value="coupe">coupe</option>
				<option value="minivan">minivan</option>
				<option value="truck">truck</option>
				<option value="sedan">sedan</option>
				<option value="convertible">convertible</option>
				<option value="hatchback">hatchback</option>
			</select>
			</td>
		</tr>
		<tr>
		<td>Hidden minimum price (reserve) - OPTIONAL</td><td><input type="number" name="carReserve"></td>
		</tr>
		<tr>
		<td>Closing date(yyyy-mm-dd)</td><td><input type="text" name="carClosingDate" placeholder ="2022-05-10"></td>
		</tr>
		<tr>
		<td>Closing time(hh:mm:ss)</td><td><input type="text" name="carClosingTime" placeholder = "12:00:00"></td>
		</tr>
		</table>
		<input type ="hidden" name = "username" value = "<%= request.getParameter("username") %>">
		<input type="submit" value="Add me!">
		</form>
	<br>
	
	<!--  Check existing user's listings
	<br>
		<form method="get" action="getUserAuctions.jsp">
			<table>
				<tr>    
					<td>Username</td><td><input type="text" name="username"></td>
				</tr>
			</table>
			<input type="submit" value="Go!">
		</form>
	<br>
	-->
	
	
	
	Check Auctions by Similar Car Type
	<br>
		<form method="get" action="auctionsByType.jsp">
			<select name="carType" size=1>
				<option value="sport">sport</option>
				<option value="suv">suv</option>
				<option value="luxury">luxury</option>
				<option value="crossover">crossover</option>
				<option value="coupe">coupe</option>
				<option value="minivan">minivan</option>
				<option value="truck">truck</option>
				<option value="sedan">sedan</option>
				<option value="convertible">convertible</option>
				<option value="hatchback">hatchback</option>
			</select>
			 <input type="submit" value="Go!">
		</form>
	<br>
	
	Check Auctions Sorted by:
	<br>
		<form method="get" action="auctionsSortedByType.jsp">
			 <input type="submit" value="Sorted By Type">
			 
		</form>
		
		<form method="get" action="auctionsSortedByName.jsp">
			 <input type="submit" value="Sorted By Name">
		</form>
		
		<form method="get" action="auctionsSortedById.jsp">
			 <input type="submit" value="Sorted By Id">
		</form>
		
		<form method="get" action="auctionsSortedByMiles.jsp">
			 <input type="submit" value="Sorted By Miles">
		</form>
		
	<br>
	
	Check Participation of User in all auctions:
	<br>
		<form method="get" action="salesOfUser.jsp">
		 	<input type="text" name = "username">
			<input type="submit" value="Go!">
			 
		</form>
		
		
	<br>
	
	Check all listings:
	<br>
		<form method="get" action="getAllAuctions.jsp">
	        <input type ="hidden" name = "username" value = "<%= request.getParameter("username") %>">
			<input type="submit" value="$$$$">
			
		</form>
	<br>
	
	Set Alert for Item(s) Including Keyword:
	<br>
		<form method="post" action="setAlertForKeyword.jsp">
		<input type ="hidden" name = "username" value = "<%= request.getParameter("username") %>">
		<input type ="text" name = "keyword" placeholder = "keyword here">
		<input type="submit" value="Add me!">
		</form>
	<br>
	
	See Your Alerts
	<br>
		<form method="get" action="getUserAlerts.jsp">
			<input type="submit" value="Go!">
			<input type ="hidden" name = "username" value = "<%= request.getParameter("username") %>">
		</form>
	<br>
	
	<br><br>
	Questions
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
	<br><br><br>
	Search Question by keyword
	<br>
		<form method="get" action="keywordSearch.jsp">
			<table>
				<tr>    
					<td>Keyword</td><td><input type="text" name="keyword"></td>
				</tr>
			</table>
			<input type="submit" value="Search!">
		</form>
	<br>

	<br><br><br>
	
	Ask a question
	<br>
		<form method="post" action="submitQuestion.jsp">
			<table>
				<tr>    
					<td>Question</td><td><input type="text" name="question"></td>
				</tr>
			</table>
			 <input type ="hidden" name = "username" value = "<%= request.getParameter("username") %>">
			<input type="submit" value="Go!">
		</form>
	<br>
	
	<%-- 
--%>

</body>
</html>