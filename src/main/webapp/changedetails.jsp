<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@include file="changedetailheader.jsp" %>
<%@include file="foot.jsp" %>
<!DOCTYPE html>
<html>
<head>
<title>Change Details</title>
<style>
body{
background-color:light-blue;
}
</style>
</head>
<body>
<%
try{
	
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from users where email='"+email+"'");
	while(rs.next())
	{
%>
<h3>Name:     <%=rs.getString(1) %></h3>
<hr>
<h3>Email:     <%=rs.getString(2) %></h3>
<hr>
<h3>Mobile Number:    <%=rs.getString(3) %></h3>
<hr>
<h3>Security Question:    <%=rs.getString(4) %></h3>
<hr>
<br><br><br>
<%}}
catch(Exception e){System.out.println(e);}%>
</body>
</html>