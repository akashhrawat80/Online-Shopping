<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@include file="adminHead.jsp" %>
<%@include file="../foot.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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
	<div style="color:brown;text-align:center;font-size:20px;"><u>Edit products here</u></div>
	<%
		String msg=request.getParameter("msg");
		if("done".equals(msg)){
	%>
	<h1>Product updated !</h1>
	<%} %>
	<%
	if("wrong".equals(msg)){
	%>
	<h1>Something is wrong !!Try again!!</h1>
	<%} %>
	
	<table>
		<thead>
			<tr>
				<th>ID</th>
				<th>NAME</th>
				<th>CATEGORY</th>
				<th>PRICE($)</th>
				<th>STATUS</th>
				<th>EDIT</th>
			</tr>
		</thead>
		<tbody>
		<%
			try{
				Connection con=ConnectionProvider.getCon();
				Statement st=con.createStatement();
				ResultSet rs=st.executeQuery("select * from product");
				while(rs.next())
				{
		%>
			<tr>
				<td><%=rs.getString(1)%></td>
				<td><%=rs.getString(2)%></td>
				<td><%=rs.getString(3)%></td>
				<td><%=rs.getString(4)%></td>
				<td><%=rs.getString(5)%></td>
				<td><a href="editingproduct.jsp?id=<%=rs.getString(1)%>" style="text-decoration:none">Edit</a></td>
			</tr>
		
		
		<% 	}
				
			}catch(Exception e)
			{
				System.out.println(e.getMessage());
			}%>
		</tbody>
	</table>
</body>
</html>