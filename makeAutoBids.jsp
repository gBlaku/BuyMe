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
		String user = request.getParameter("username");
		String id = request.getParameter("id");
		String maximum_bid = request.getParameter("maximum_bid");
		String increment = request.getParameter("increment");
		
		//Make an insert statement for the Sells table:
		String insert = "Insert into auto_bidding_info(car_id, bidder, maximum_bid, increment) values(?,?,?,?)";
		//Create a Prepared SQL statement allowing you to introduce the parameters of the query
		PreparedStatement ps = con.prepareStatement(insert);
		//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
		ps.setString(2,user);
		ps.setString(1,id);
		ps.setString(3,maximum_bid);
		ps.setString(4,increment);
		//Run the query against the DB
		ps.executeUpdate();
		//Run the query against the DB
		
		
		
		out.print("Set Auto-Bid");
		
		
		
		

		
		//putting the first bid in
		
		String insert0 = "SELECT MAX(bid) FROM bids WHERE car_id =  '" +id+ "'";
		ResultSet result = stmt.executeQuery(insert0); 		
		
		try{
			String resultMax = ""; 
			while (result.next()){
				resultMax = result.getString("max(bid)");	
			}
			
			double resultMaxDouble = Double.parseDouble(resultMax);
			double incrementDouble = Double.parseDouble(increment);
			double newBid = resultMaxDouble + incrementDouble;
			
			if (newBid <= Double.parseDouble(maximum_bid) ){
				String insert1 = "Insert Into bid(car_id, bid,bidder) values(?,?,?)";
				PreparedStatement ps1 = con.prepareStatement(insert1);
				ps1.setString(1,id);
				ps1.setString(2,String.valueOf(newBid));
				ps1.setString(3,user);
				ps1.executeUpdate();
			}
			else{
				String insert2 = "Insert into alerts(user, alert) values(?,?)";
				PreparedStatement ps2 =  con.prepareStatement(insert2);
				ps2.setString(1,user);
				ps2.setString(2, "Upper limit Reached!");
				ps2.executeUpdate();
			}
			
			
		}
		catch (Exception e)
		{
			out.print(e);	
		}
		
		
		

//		String insert3 = "SELECT MAX(bid), bidder FROM bids WHERE car_id =  '" +id+ "'";
	//	ResultSet result3 = stmt.executeQuery(insert3); 
//		String resultMax = ""; 
	//	String resultPerson = "";
	//	while (result3.next()){
		//	resultPerson = result3.getString("bidder");
			//resultMax = result3.getString("max(bid)");	
	//	}
	//	double resultMaxDouble = Double.parseDouble(resultMax);
	//	double incrementDouble = Double.parseDouble(increment);
		//double newBid = resultMaxDouble + incrementDouble;
		
		
//		while (maximum_bid.compareTo(resultMax) > 0 )
//		{
//			if (user.compareTo(resultPerson) != 0){
//				String insert6 = "Insert into bids(car_id, bid, bidder) values(?,?,?)";
//				PreparedStatement ps6 =  con.prepareStatement(insert6);
//				ps6.setString(1,id);
//				ps6.setString(2,String.valueOf(newBid));
//				ps6.setString(3,user);
//			}
//		
//			String insert7 = "SELECT MAX(bid), bidder FROM bids WHERE car_id =  '" +id+ "'";
//			ResultSet result7 = stmt.executeQuery(insert7); 
//			resultMax = ""; 
//			resultPerson = "";
//			while (result7.next()){
//				resultPerson = result7.getString("bidder");
//				resultMax = result7.getString("max(bid)");	
//			}
//			resultMaxDouble = Double.parseDouble(resultMax);
//			incrementDouble = Double.parseDouble(increment);
//			newBid = resultMaxDouble + incrementDouble;
//		}
//		
//		String insert8 = "Insert into alerts(user, alert) values(?,?)";
//		PreparedStatement ps8 =  con.prepareStatement(insert8);
//		ps8.setString(1,user);
//		ps8.setString(2, "Upper limit Reached!");
//		ps8.executeUpdate();
		
		
		
		
		
		
		
		
		
		
		
		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();
		
		
	} catch (Exception ex) {
		out.print(ex);
	}
%>
	<br>
		<form method="post" action="HelloWorld.jsp">
		
		<input type="submit" value="Back to Home">
		</form>
	<br>