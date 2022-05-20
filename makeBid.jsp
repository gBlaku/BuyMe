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
		Statement stmt2 = con.createStatement();

		//Get parameters from the HTML form at the index.jsp
		String user = request.getParameter("username");
		String id = request.getParameter("id");
		String bid = request.getParameter("bid");

		
		
		
		//Check if new value is Max
		
		String insert0 = "SELECT MAX(bid) FROM bids WHERE car_id =  '" +id+ "'";
		ResultSet result = stmt.executeQuery(insert0); 		
		
		try{
			String resultMax = ""; 
			while (result.next()){
				resultMax = result.getString("max(bid)");	
			}
			if (bid.compareTo(resultMax) > 0){
				String insert2 = "select bidder from bids  WHERE car_id =  '" +id+ "'group by bidder";
				ResultSet result2 = stmt.executeQuery(insert2);
				while (result2.next()){
					String thisUser = result2.getString("bidder");
					
					if (thisUser.compareTo(user) != 0){
						String insert3 = "INSERT INTO alerts(username, alert) VALUES (?,?)";
						PreparedStatement ps0 = con.prepareStatement(insert3);
						ps0.setString(1,thisUser);
						ps0.setString(2,"You were outbid on an item!");
						ps0.executeUpdate();
					}
					
				}
			}
			
		}catch (Exception e)
		{
			//out.print(e);	
		}
		
		//End of checking new value is MAX
		
		
		
		
		

		//Make an insert statement for the Sells table:
		String insert = "INSERT INTO bids VALUES (?,?,?)";
		//Create a Prepared SQL statement allowing you to introduce the parameters of the query
		PreparedStatement ps = con.prepareStatement(insert);
		//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
		ps.setString(1, id);
		ps.setString(2, bid );
		ps.setString(3, user);
		//Run the query against the DB
		ps.executeUpdate();
		//Run the query against the DB
		
		
		
		
		
		//new? max
		String SelectMax = "SELECT MAX(bid) FROM bids WHERE car_id =  '" +id+ "'";
		ResultSet resultOfSelect = stmt.executeQuery(SelectMax); 		
		String resultMax = ""; 
			while (resultOfSelect.next()){
				resultMax = resultOfSelect.getString("max(bid)");	
			}
		
		
		
		
		//Checking auto_bidders
		String getBidders = "SELECT * from auto_bidding_info where car_id ='" +id+ "'";
		ResultSet bidderSet = stmt.executeQuery(getBidders); 
		
		while (bidderSet.next()){
			
			
			
			
			
			String thisBidder = bidderSet.getString("bidder");
			String thisMaximum = bidderSet.getString("maximum_bid");
			String thisIncrement = bidderSet.getString("increment");
			
			double maxDouble = Double.parseDouble(resultMax);
			double incrementDouble = Double.parseDouble(thisIncrement);
			double newBid = maxDouble + incrementDouble;
			
			
			String FindThisBiddersMaxBid = "Select bid, bidder from bids where bidder = '" +thisBidder+ "' AND car_id = '" +id+ "' order by bid ASC";
			ResultSet biddersBid = stmt2.executeQuery(FindThisBiddersMaxBid);
			String currentHighest = "";
			
			while (biddersBid.next()){
				currentHighest = biddersBid.getString("bid");
			}
			
			
			
			if (thisMaximum.compareTo(String.valueOf(newBid)) > 0 && newBid > Double.parseDouble(currentHighest)){
				String insert4 = "Insert into bids(car_id, bid, bidder) values(?,?,?) ";
				PreparedStatement psAutoBid = con.prepareStatement(insert4);
				psAutoBid.setString(1,id);
				psAutoBid.setString(2,String.valueOf(newBid));
				psAutoBid.setString(3,thisBidder);
				psAutoBid.executeUpdate();
			}
			
			if (thisMaximum.compareTo(String.valueOf(newBid)) <= 0 ){
				String insertAlert = "Insert into alerts (username,alert) values (?,?)";
				PreparedStatement psAlert = con.prepareStatement(insertAlert);
				psAlert.setString(1,thisBidder);
				psAlert.setString(2,"Upper Limit Reached!");
				psAlert.executeUpdate();
			}
	
			
			
		}
		
		
		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();
		out.print("Bid placed.");
		
	} catch (Exception ex) {
		//out.print(ex);
	}
%>
	<br>
		<form method="post" action="HelloWorld.jsp">
		<input type="submit" value="Back to Home">
		</form>
	<br>

</body>
</html>