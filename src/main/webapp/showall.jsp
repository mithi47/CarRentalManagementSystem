<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
 <link rel="stylesheet" type="text/css" href="style.css" />
<title>ENTIRE LIST</title>
</head>
<body class="show" >

 <div class="contents" style="color:silver;  text-shadow: 0 0 4px black, 0 0 11px black,0 0 19px black, 0 0 19px black, 0 0 40px black, 0 0 40px black, 0 0 90px black, 0 0 100px black,0 0 150px black;" >
  <h1>Entire List</h1>
  
  </div>

  <div class="contents" style="color:#e98327;  text-shadow: 0 0 4px black, 0 0 11px black,0 0 19px black, 0 0 19px black, 0 0 40px black, 0 0 40px black, 0 0 90px black, 0 0 100px black,0 0 150px black;" >
  <h1>Pending</h1>

  </div>
  <table style="width :100%" cellpadding = "10">
<tr class="form" style="color:white; text-shadow:0 0 4px gold, 0 0 11px gold,0 0 19px gold, 0 0 19px gold, 0 0 40px gold, 0 0 40px gold, 0 0 90px gold, 0 0 100px gold,0 0 150px gold;">
<th>Name</th>
<th>Date Of Birth</th>
<th>Phone</th>
<th>Brand</th>
<th>Price/Hr</th>
<th>Rented Date</th>
<th>Returned Date</th>
<th>Duration</th>
<th>Total Rent</th>
<th>Returns</th>
</tr>
<%
String query = "select * from rent";
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/luxx", "root", "1234");
System.out.println("Connection Established successfully");
Statement st = con.createStatement();
ResultSet rs = st.executeQuery(query);
while(rs.next())
{
	String name=rs.getString("name");
	String dob=rs.getString("dob");
	int phone=rs.getInt("phone");
	String brand=rs.getString("brand");
	String price=rs.getString("price");
	String rdate=rs.getString("rdate");
	String sdate=rs.getString("sdate");
	String duration=rs.getString("duration");
	String amount=rs.getString("amount");
	
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
	</td>
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


    <td><a href="returned.html">
	<% out.println("Returned" );%>
	</a></td>

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

st.close(); 

con.close();   %>
	</table>

  <div class="contents" style="color:#e98327;  text-shadow: 0 0 4px black, 0 0 11px black,0 0 19px black, 0 0 19px black, 0 0 40px black, 0 0 40px black, 0 0 90px black, 0 0 100px black,0 0 150px black;" >
  <h1>Returned</h1>
  </div>

  <table style="width :100%" cellpadding = "10">
<tr class="form" style="color:white; text-shadow:0 0 4px gold, 0 0 11px gold,0 0 19px gold, 0 0 19px gold, 0 0 40px gold, 0 0 40px gold, 0 0 90px gold, 0 0 100px gold,0 0 150px gold;">
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
String query1 = "select * from back";
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3307/luxx", "root", "1234");
System.out.println("Connection Established successfully");
Statement st1 = con1.createStatement();
ResultSet rs1 = st1.executeQuery(query1);
while(rs1.next())
{
	String name=rs1.getString("name");
	String dob=rs1.getString("dob");
	int phone=rs1.getInt("phone");
	String brand=rs1.getString("brand");
	String price=rs1.getString("price");
	String rdate=rs1.getString("rdate");
	String sdate=rs1.getString("sdate");
	String duration=rs1.getString("duration");
	String amount=rs1.getString("amount");
	
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
	</td>
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

st1.close(); 

con1.close();   %>
	</table>
</div>
<center>
<a href= "Wlc.html">
<button class="button"> HOME</button></a>
</center>
</body>
</html>