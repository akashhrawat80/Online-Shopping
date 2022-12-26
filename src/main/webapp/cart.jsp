<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@include file="header.jsp" %>
<%@include file="foot.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
<title>cart</title>
<style>
	th{
		padding-left:45px;
	}
	td{
		padding-left:45px;
	}
</style>
</head>
<body>
	<div style="color:Black;text-align:center;font-size:30px;font-family:fantasy;"><b>Cart</b></div>
	<hr>
	<%
	String msg=request.getParameter("msg");
	if("notpossible".equals(msg))
	{
	%>
	<h3 class="cart1">there is only one quantity so click on remove! </h3>
	<%} %>
	<% 
	if("inc".equals(msg))
	{
		%>
	<h3 class="cart1">Quantity Increased Successfully</h3>
	<%} %>
	<%
		if("dec".equals(msg)){	
	%>
	<h3 class="cart1">Quantity Decreased Successfully</h3>
	<%} %>
	<%
		if("removed".equals(msg)){
	%>
	<h3 class="cart1">Product Successfully Removed</h3>
	<%} %>
	<table>
		<thead>
		<%
		int total=0;
		int sno=0;
		try
		{
			Connection con=ConnectionProvider.getCon();
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery("select sum(total) from cart where email='"+email+"' and address is NULL");
			while(rs.next())
			{
				total=rs.getInt(1);
			}
		%>
		<tr>
			<th scope="col" style="background-color:yellow;">Total:<%out.println(total); %></th>
			<% if(total>0){%><th><a href="addresspaymentfororder.jsp">Go to order</a></th><% }%>
		</tr>
		</thead>
		<thead>
		<tr>
		<th scope="col">S.No</th>
		<th scope="col">Product Name</th>
		<th scope="col">Category</th>
		<th scope="col">Price</th>
		<th scope="col">Quantity</th>
		<th scope="col">Sub Total</th>
		<th scope="col">Remove</th>
		</tr>
		</thead>
		<tbody>
		<%
		ResultSet rs1=st.executeQuery("select * from product inner join cart on product.id=cart.productid and cart.email='"+email+"' and cart.address is NULL");
		while(rs1.next())
		{
		%>
		<tr>
		<%sno=sno+1; %>
		<td><%out.println(sno); %></td>
		<td><%=rs1.getString(2) %></td>
		<td><%=rs1.getString(3) %></td>
		<td><i class="fa fa-inr"></i> <%=rs1.getString(4)%> </td>
		<td><a href="incdecquantityaction.jsp?id=<%=rs1.getString(1)%>&quantity=inc"><i class="fas fa-plus-circle"></i></a> <%=rs1.getString(8)%> <a href="incdecquantityaction.jsp?id=<%=rs1.getString(1)%>&quantity=dec"><i class="fas fa-minus-circle"></i></a></td>
		<td><i class="fa fa-inr"></i> <%=rs1.getString(10)%></td>
		<td><a href="removefromcart.jsp?id=<%=rs1.getString(1)%>">Remove</a></td>	
		</tr>
		<%
		}
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		%>
		</tbody>
	</table>
</body>
</html>