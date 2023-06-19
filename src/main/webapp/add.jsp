<%@ page import="java.sql.*" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
   <html>
<head>
<meta charset="ISO-8859-1">
  <link rel="stylesheet" type="text/css" href="style.css" />
<title>RENTING LIST</title>
</head>
<body class="return" >

 <div class="contents" style="color:silver;  text-shadow: 0 0 4px black, 0 0 11px black,0 0 19px black, 0 0 19px black, 0 0 40px black, 0 0 40px black, 0 0 90px black, 0 0 100px black,0 0 150px black;" >
  <h1>Customer List</h1>

  </div>
  <br>
  <br>
    <table style="width :100%" cellpadding = "10">
<tr  class="form" style="color:white; text-shadow:0 0 4px gold, 0 0 11px gold,0 0 19px gold, 0 0 19px gold, 0 0 40px gold, 0 0 40px gold, 0 0 90px gold, 0 0 100px gold,0 0 150px gold;">
<th>Name</th>
<th>Date Of Birth</th>
<th>Phone</th>
<th>Brand</th>
<th>Price/Hr</th>
<th>Rented Date</th>
<th>Returned Date</th>
<th>Duration</th>
<th>Total Rent</th>
</tr>

<br>
<br>

<% 

Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/luxx", "root", "1234");
System.out.println("Connection Established successfully");
String name=request.getParameter("name");
String dob=request.getParameter("dob");
String phone=request.getParameter("phone");
String brand=request.getParameter("brand");
String rdate=request.getParameter("rdate");
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
String query = "insert into rent(name,dob,phone,brand,price,rdate,sdate,duration,amount) values('"+name+"','"+dob+"',"+phone+",'"+brand+"',"+price+",'"+rdate+"','"+sdate+"',"+duration1+","+amount1+");";

	PreparedStatement st = con.prepareStatement(query);
	st.executeUpdate(query);
	String query1 = "Select * from rent where name ='"+name+"';";;
	PreparedStatement st1 = con.prepareStatement(query1);
	ResultSet rs = st.executeQuery(query1);
	while(rs.next())
	{
		String name1=rs.getString("name");
		String dob1=rs.getString("dob");
		int phone1=rs.getInt("phone");
		String brand1=rs.getString("brand");
		String price1=rs.getString("price");
		String rdate1=rs.getString("rdate");
		String sdate1=rs.getString("sdate");
		String duration2=rs.getString("duration");
		String amount2=rs.getString("amount");
		
		%>
		
		<tr class="form"  >
		<td>
		<%out.println(name1);%>
		</td>
		<td >
		<% out.println(dob1);%>
		</td>
		<td >
		<% out.println(phone1);%>
		</td>
		<td >
		<% out.println(brand1);%>
			<td >
		<% out.println(price1);%>
		</td >
		</td>
		<td >
		<% out.println(rdate1);%>
		</td >
	<td >
		<% out.println(sdate1);%>
		</td >
		<td >
		<% out.println(duration1+"Hrs");%>
		</td >
		<td >
		<% out.println(amount1);%>
		</td >
		</tr>
		<tr>
		</tr>
		<tr>
		</tr>
		<tr>
		</tr>
		<tr>
		</tr>
		<tr>
		</tr>
		<tr>
		</tr>
		<% 
	}
	 st1.close();
	 st.close();
	    con.close();
	

%>
</table>
<center>
<a href = "update.html">
<button class="button"> UPDATE</button></a>
<a href = "payment.html">
<button class="button"> PAYMENT</button></a>
<a href= "main.html">
<button class="button"> HOME</button></a>
</center>
</body>

</html>