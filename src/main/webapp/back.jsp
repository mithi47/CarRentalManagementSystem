<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
  <link rel="stylesheet" type="text/css" href="style.css" />
<title>RETURNED LIST</title>
</head>
<body class="back" >

 <div class="contents" style="color:silver;  text-shadow: 0 0 4px black, 0 0 11px black,0 0 19px black, 0 0 19px black, 0 0 40px black, 0 0 40px black, 0 0 90px black, 0 0 100px black,0 0 150px black;" >
  <h1>Returned Customer List</h1>
  </div>
  
  <br>
  <br>

  <table  style="width :100%" cellpadding = "10">
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



 
<%
String query7 = "select * from back";
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con7 = DriverManager.getConnection("jdbc:mysql://localhost:3307/luxx", "root", "1234");
System.out.println("Connection Established successfully");
Statement st7 = con7.createStatement();
ResultSet rs7 = st7.executeQuery(query7);
while(rs7.next())
{
	String name=rs7.getString("name");
	String dob=rs7.getString("dob");
	int phone=rs7.getInt("phone");
	String brand=rs7.getString("brand");
	String price=rs7.getString("price");
	String rdate=rs7.getString("rdate");
	String sdate=rs7.getString("sdate");
	String duration=rs7.getString("duration");
	String amount=rs7.getString("amount");
	
	%>
	
	<tr class="form">
	<td>
	<%out.println(name);%>
	</td>
	<td >
	<% out.println(dob);%>
	</td>
	<td >
	<% out.println(phone);%>
	</td>
	<td >
	<% out.println(brand);%>
		<td >
	<% out.println(price);%>
	</td >

	<td >
	<% out.println(rdate);%>
	</td >
<td >
	<% out.println(sdate);%>
	</td >
	<td >
	<% out.println(duration+"Hrs");%>
	</td >
	<td >
	<% out.println(amount);%>
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

st7.close(); 

con7.close();   %>
	</table>
</div>
<center>
<a href= "Wlc.html">
<button class="button"> HOME</button></a>
</center>
</body>
</html>