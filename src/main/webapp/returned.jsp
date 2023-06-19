<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>RETURNED</title>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width,initial-scale=1" />
  <meta name="description" content="" />
  <link rel="stylesheet" type="text/css" href="style.css" />

 


</head>
<body>
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
	

String query1 = "insert into back(name,dob,phone,brand,price,rdate,sdate,duration,amount) values('"+name+"','"+dob+"',"+phone+",'"+brand+"',"+price+",'"+rdate+"','"+sdate+"',"+duration+","+amount+");";
st1 = con.prepareStatement(query1);
st1.executeUpdate(query1);
 st1.close();
 String query2 = "delete from rent where name='"+name+"' ;";
st2 = con.prepareStatement(query2);
 st2.executeUpdate(query2);
  st2.close();
 st.close(); 
con.close();
}
}

catch (SQLException ex) {
String redirectURL = "back.jsp";
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

</body>
</html>