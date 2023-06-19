<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
   <html>
<head>
<meta charset="ISO-8859-1">
  <link rel="stylesheet" type="text/css" href="style.css" />
<title>ADMIN SIGNUP</title>
</head>
<body class="return" >

<% 
try{
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/luxx", "root", "1234");
System.out.println("Connection Established successfully");
String name=request.getParameter("name");
String passs=request.getParameter("passs");
String query = "insert into admin(uname,pass) values ('"+name+"','"+passs+"');";

	PreparedStatement st = con.prepareStatement(query);
	st.executeUpdate(query);
	 st.close();
	    con.close();
	    String redirectURL = "Wlc.html";
	    response.sendRedirect(redirectURL);
}


catch (SQLException ex) {
String redirectURL = "Wlc.html";
response.sendRedirect(redirectURL);
}

%>

</body>

</html>