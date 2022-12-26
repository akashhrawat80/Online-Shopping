<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@include file="changedetailheader.jsp" %>
<%@include file="foot.jsp" %>
<html>
<head>
<title>add or change address</title>
<style>
hr{
	padding-right:30%
}
input{
	width:50%;
}
button{
	width:200px;
	background-color:black;
	color:white;
}
body{
	background-color:light-blue;
}
</style>
</head>
<body>
<%
String msg=request.getParameter("msg");
if("valid".equals(msg))
{
%>
<h3>Address Successfully Updated!!</h3>
<%} %>
<%
if("invalid".equals(msg))
{
%>
<h3>Some thing went wrong!  Try again!</h3>
<%} %>
<%
try{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from users where email='"+email+"'");
	while(rs.next())
	{
%>
<form action="addchangeaddressaction.jsp" method="post">
<h3>Enter Address</h3>
<input type="text" name="address" value="<%=rs.getString(7)%>" placeholder="enter address" class="inputstyle">
<hr>
<h3>Enter City</h3>
<input type="text" name="city" value="<%=rs.getString(8)%>" placeholder="enter city" class="inputstyle">
<hr>
<h3>Enter State</h3>
<input type="text" name="state" value="<%=rs.getString(9)%>" placeholder="enter state" class="inputstyle">
<hr>
<h3>Enter Country</h3>
<input type="text" name="country" value="<%=rs.getString(10)%>" placeholder="enter country" class="inputstyle">
<hr>
<button type="submit">save</button>
</form>
<% 	}
}catch(Exception e)
{
	System.out.println(e);	
}
%>

</body>
</html>