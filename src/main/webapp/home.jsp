<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@include file="header.jsp" %>
<%@include file="foot.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>user page</title>
<style>
	th{
	padding-left:80px;
}
td{
	padding-left:80px;
}
</style>
</head>
<body>
	<div style="color:black;text-align:center;font-size:30px;font-family:fantasy;"><b>SELECT YOUR FAVOURITE</b></div><hr>
	<%String msg=request.getParameter("msg");
	if("added".equals(msg))
	{
	%>
	<h3 class="ss">Product added</h3>
	<%} %>
	<% 
	if("exist".equals(msg))
	{	%>
	<h3 class="">product already in the cart, quantity increased!</h3>
	<%} %>
	<%if("invalid".equals(msg))
		{%>
	<h3>oops! something went wrong try again!</h3>
	<%} %>
	<table>
		<thead>
			<tr>
				<th>ID</th>
				<th>NAME</th>
				<th>CATEGORY</th>
				<th>PRICE</th>
				<th>ADD TO CART</th>
			</tr>
		</thead>
		<tbody>
		<%
		try{
			Connection con=ConnectionProvider.getCon();
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery("select * from product where active='Yes'");
			while(rs.next())
			{
		%>
			<tr>
				<td><%=rs.getString(1) %></td>
				<td><%=rs.getString(2) %></td>
				<td><%=rs.getString(3) %></td>
				<td><%=rs.getString(4) %></td>
				<td><a href="addtocartaction.jsp?id=<%=rs.getString(1)%>">Add to cart</a></td>
			</tr>
			
		<%		}
			
		}catch(Exception e)
		{
			System.out.println(e.getMessage());
		}
		%>
		
		</tbody>
	</table>
	
	<br><br><br>
</body>
</html>