<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		List<String> list = new ArrayList<String>();

		try {

			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();	
			String carType = request.getParameter("carType");
			//Create a SQL statement
			Statement stmt = con.createStatement();
			//Make a SELECT query from the sells table with the price range specified by the 'price' parameter at the index.jsp
			String str = "SELECT id,car_name,miles,make_year,car_type,closingDate,closingTime,seller FROM auctions WHERE car_type = '" +carType+ "'";
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
	
	
	<br>
		<form method="post" action="BuyMeHome.jsp">
		 <input type ="hidden" name = "username" value = "<%= request.getParameter("username") %>">
		<input type="submit" value="Back To Home">
		</form>
	<br>

</body>
</html>