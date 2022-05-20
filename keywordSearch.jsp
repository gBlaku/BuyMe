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
	List<String> list2 = new ArrayList<String>();
	
	try {
	
		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();	
		String keyword = request.getParameter("keyword");
		//Create a SQL statement
		Statement stmt = con.createStatement();
		//Make a SELECT query from the sells table with the price range specified by the 'price' parameter at the index.jsp
		String str = "SELECT * FROM Questions WHERE question LIKE '%" + keyword + "%'";
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
	<br>
		<form method="post" action="HelloWorld.jsp">
		
		<input type="submit" value="Back to Home">
		</form>
	<br>