<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
 <center>
  <table style="width :100%" cellpadding = "10">
<tr  class="form" style="color:white; text-shadow:0 0 4px gold, 0 0 11px gold,0 0 19px gold, 0 0 19px gold, 0 0 40px gold, 0 0 40px gold, 0 0 90px gold, 0 0 100px gold,0 0 150px gold;">
<th>Successfully Delete</th>
</tr>
</center>
<br>
<br>
  
 
<%
Connection con = null;
PreparedStatement st1 = null;
PreparedStatement st2 = null;
Statement st = null;
ResultSet rs= null;
try{
String name1=request.getParameter("name");
String query = "Select * from rent where name ='"+name1+"';";
Class.forName("com.mysql.cj.jdbc.Driver");
con = DriverManager.getConnection("jdbc:mysql://localhost:3307/luxx", "root", "1234");
System.out.println("Connection Established successfully");
st = con.createStatement();
rs= st.executeQuery(query);
while(rs.next())
{
	String name=rs.getString("name");
	String dob= rs.getString("dob");
	String phone=rs.getString("phone");
	String brand=rs.getString("brand");
	String price=rs.getString("price");
	String rdate= rs.getString("rdate");
	String sdate= rs.getString("sdate");
	String duration=rs.getString("duration");
	String amount=rs.getString("amount");

 String query2 = "delete from rent where name='"+name+"' ;";
st2 = con.prepareStatement(query2);
 st2.executeUpdate(query2);
  st2.close();
 st.close(); 
con.close();
}
}

catch (SQLException ex) {
String redirectURL = "del.html";
response.sendRedirect(redirectURL);
}
finally {
    // close all database objects
    try { rs.close(); } catch (Exception ex) { /* ignore */ }
    try { st.close(); } catch (Exception ex) { /* ignore */ }
    try { st1.close(); } catch (Exception ex) { /* ignore */ }
    try { st2.close(); } catch (Exception ex) { /* ignore */ }
    try { con.close(); } catch (Exception ex) { /* ignore */ }
}

%>
</table>

<center>
<a href= "main.html">
<button class="button"> HOME</button></a>
</center>
</body>
</html>