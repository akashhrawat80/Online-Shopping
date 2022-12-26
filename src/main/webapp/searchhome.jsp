<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@include file="header.jsp" %>
<%@include file="foot.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>home</title>
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
	<div style="color:black;text-align:center;font-size:20px;margin-top:-30px;"><b>SELECT YOUR FAVOURITE</b></div><hr>
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
		int z=0;
		try{
			String search=request.getParameter("search");
			Connection con=ConnectionProvider.getCon();
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery("select * from product where name like '%"+search+"%' or category like '%"+search+"%' and active='Yes'");
			while(rs.next())
			{
				z=1;
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
	<%if(z==0)
	{
		%>
		<h1 style="color:voilet;text-align:center;">Nothing to show here search another!</h1>
		
		<%} %>
	<br><br><br>
</body>
</html>