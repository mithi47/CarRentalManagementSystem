	<%@ page import="java.sql.*" %>
	<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>UPDATE</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
<% 
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/luxx", "root", "1234");
	System.out.println("Connection Established successfully");
String name=request.getParameter("name");
String brand=request.getParameter("brand");
String sdate=request.getParameter("sdate");
Map<String, Integer> prices = new HashMap<>();
prices.put("Bugatti", 100);
prices.put("Ferrari", 50);
prices.put("Lamborgini", 70);
prices.put("Jaguar", 10);
prices.put("BMW", 10);
prices.put("Mercedes Benz", 10);
prices.put("Range Rover", 10);
int price = prices.get(brand);
int duration=Integer.parseInt(request.getParameter("dura"));
int duration1 = duration * 24;
int amount=price;
int amount1= amount*duration1;
String query = "update rent set brand='"+brand+"', price="+price+", sdate='"+sdate+"', duration="+duration1+", amount="+amount1+" where name='"+name+"';";


	PreparedStatement st = con.prepareStatement(query);
	st.executeUpdate(query);
	 st.close();
	    con.close();
	

%>
<div class="h2" style="width:50%;">

<h1 style="color:white;text-align:center; 
text-shadow: 0 0 4px #ff8000, 0 0 11px #ff8000,0 0 19px #ff8000, 0 0 19px #ff8000, 0 0 40px #ff8000, 0 0 40px #ff8000, 0 0 90px #ff8000, 0 0 100px #ff8000,0 0 150px #ff8000;"> DETAILS STORED SUCCESSFULLY</h1>
</div>
<%String redirectURL = "up.html";
response.sendRedirect(redirectURL); %>
</body>
</html>