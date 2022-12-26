<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@include file="header.jsp" %>
<%@include file="foot.jsp" %>
<html>
<head>
<title>MyOrders</title>
<style>
body{
background-color:light-blue;
}
th{
	padding-left:10px;
	font-size:15px;
}
td{
	padding-left:15px;
	font-size:12px;
}
</style>
</head>
<body>
<div style="color:Black;text-align:center;font-size:30px;font-family:fantasy;"><b>My Orders</b></div>
<hr>
<table>
	<thead>
		<tr>
			<th scope="col">S.No</th>
			<th scope="col">Product Name</th>
			<th scope="col">Category</th>
			<th scope="col">Price</th>
			<th scope="col">Quantity</th>
			<th scope="col">Sub Total</th>
			<th scope="col">Order Date</th>
			<th scope="col">Expected Delivery Date</th>
			<th scope="col">Payment Method</th>
			<th scope="col">Status</th>
		</tr>
	</thead>
	<tbody>
<%
int sno=0;
try
{
Connection con=ConnectionProvider.getCon();
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from cart inner join product where cart.productid=product.id and cart.email='"+email+"' and cart.orderdate is not NULL");
while(rs.next())
{
	sno=sno+1;
%>
		<tr>
			<td><%out.println(sno); %></td>
			<td><%=rs.getString(17) %></td>
			<td><%=rs.getString(18) %></td>
			<td><%=rs.getString(19) %></td>
			<td><%=rs.getString(3) %></td>
			<td><%=rs.getString(5) %></td>
			<td><%=rs.getString(11) %></td>
			<td><%=rs.getString(12) %></td>
			<td><%=rs.getString(13) %></td>
			<td><%=rs.getString(15) %></td>
		</tr>
<%}
}catch(Exception e){System.out.println(e);}%>
	</tbody>	
</table>
</body>

</html>