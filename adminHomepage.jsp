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
			String str = "SELECT * FROM admins WHERE username ='" +user+ "'  AND pass ='" +pass+ "'";
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
	<br><br>
	Register new Customer Service Rep:
	<br>
		<form method="post" action="registerCustomerServiceRep.jsp">
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
	<br><br>
	
	<form method="post" action="totalEarnings.jsp">
		<input type="submit" value="See total earnings">
	</form>
	
	<br><br>
	Sales Report By Best Buyers
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
			String str = "select sales.buyer as 'Best_Buyers' , count(sales.price) as 'Purchases' from sales group by Best_Buyers order by Purchases desc";
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);

			//Make an HTML table to show the results in:
			out.print("<table>");

			//make a row
			out.print("<tr>");
			//make a column
			out.print("<td>");
			out.print("Best_Buyers");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("Purchases");
			out.print("</td>");
			
			out.print("</tr>");

			//parse out the results
			while (result.next()) {
				//make a row
				out.print("<tr>");
				//make a column
				out.print("<td>");
				
				out.print(result.getString("Best_Buyers"));
				out.print("</td>");
				out.print("<td>");
				
				out.print(result.getString("Purchases"));
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
	
	<br><br>
	Sales Report By Best Selling Items
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
			String str = "select sales.car_type as 'Best_selling_items' , count(sales.price) as 'Sales' from sales group by Best_selling_items order by Sales desc";
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);

			//Make an HTML table to show the results in:
			out.print("<table>");

			//make a row
			out.print("<tr>");
			//make a column
			out.print("<td>");
			out.print("Best_selling_items");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("Sales");
			out.print("</td>");
			
			out.print("</tr>");

			//parse out the results
			while (result.next()) {
				//make a row
				out.print("<tr>");
				//make a column
				out.print("<td>");
				
				out.print(result.getString("Best_selling_items"));
				out.print("</td>");
				out.print("<td>");
				
				out.print(result.getString("Sales"));
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
	
	
	<br><br>
	Earnings Report By Best Selling Items
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
			String str = "select sales.car_type as 'Best_selling_items' , SUM(sales.price) as 'Earnings' from sales group by Best_selling_items order by Earnings desc";
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);

			//Make an HTML table to show the results in:
			out.print("<table>");

			//make a row
			out.print("<tr>");
			//make a column
			out.print("<td>");
			out.print("Best_selling_items");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("Earnings");
			out.print("</td>");
			
			out.print("</tr>");

			//parse out the results
			while (result.next()) {
				//make a row
				out.print("<tr>");
				//make a column
				out.print("<td>");
				
				out.print(result.getString("Best_selling_items"));
				out.print("</td>");
				out.print("<td>");
				
				out.print(result.getString("Earnings"));
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
	
	<br><br>
	Earnings Report By End-Users
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
			String str = "select sales.seller as 'End_Users' , SUM(sales.price) as 'Earnings' from sales group by End_Users order by Earnings desc";
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);

			//Make an HTML table to show the results in:
			out.print("<table>");

			//make a row
			out.print("<tr>");
			//make a column
			out.print("<td>");
			out.print("End_Users");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("Earnings");
			out.print("</td>");
			
			out.print("</tr>");

			//parse out the results
			while (result.next()) {
				//make a row
				out.print("<tr>");
				//make a column
				out.print("<td>");
				
				out.print(result.getString("End_Users"));
				out.print("</td>");
				out.print("<td>");
				
				out.print(result.getString("Earnings"));
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