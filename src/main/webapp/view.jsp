	<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
  <link rel="stylesheet" type="text/css" href="style.css" />
<title>VIEW </title>
</head>
<body class="return" >

 <div class="contents" style="color:silver;  text-shadow: 0 0 4px black, 0 0 11px black,0 0 19px black, 0 0 19px black, 0 0 40px black, 0 0 40px black, 0 0 90px black, 0 0 100px black,0 0 150px black;" >
  <h1>Customer VIEW</h1>

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
String name1=request.getParameter("name");
String query9 = "Select * from rent where name ='"+name1+"';";
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/luxx", "root", "1234");
System.out.println("Connection Established successfully");
Statement st = con.createStatement();
ResultSet rs = st.executeQuery(query9);
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
	
	<tr class="form"  >
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

st.close(); 

con.close();   %>
	</table>

<center>
<a href = "update.html">
<button class="button"> UPDATE</button></a>
<a href= "main.html">
<button class="button"> HOME</button></a>
</center>
</body>
</html>