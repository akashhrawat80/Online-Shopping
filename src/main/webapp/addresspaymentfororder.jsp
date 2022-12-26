<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@include file="foot.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
<title></title>
<script>
if(window.history.forward(1)!=null)
	window.history.forward(1);
</script>
<style>
	.div1{
	width:26em;
	display:inline-block;
}
	body{
		font-family:Arial,Helvetica;
		background-color:lightblue;
	}
	th{
		padding-left:45px;
	}
	td{
		padding-left:45px;
	}
	.inputstyle{
		width:280px;
	}
</style>
</head>
<body>
<table>
<thead>
<%
String email=session.getAttribute("email").toString();
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
	<th scope="col"><a href="cart.jsp"><i class='fas fa-arrow-circle-left'>Back</i></a></th>
	<th scope="col" style="background-color:yellow;">Total:<i class="fa fa-inr"></i><%out.println(total); %></th>
	</tr>
</thead>
<thead>
<tr>
	<th scope="col">S.No</th>
	<th scope="col">Product Name</th>
	<th scope="col">Category</th>
	<th scope="col"><i class="fa fa-inr"></i>Price</th>
	<th scope="col">Quantity</th>
	<th scope="col">Sub Total</th>
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
		<td> <%=rs1.getString(8)%></td>
		<td><i class="fa fa-inr"></i> <%=rs1.getString(10)%></td>	
	</tr>
	<%}
		ResultSet rs2=st.executeQuery("select * from users where email='"+email+"'");
		while(rs2.next())
		{
		%>
</tbody>
</table>
<hr style="width:100%">
<form action="addresspaymentfororderaction.jsp" method="post">
<div class="div1">
<h3>Enter Address</h3>
<input type="text" class="inputstyle" name="address" value="<%=rs2.getString(7)%>" placeholder="enter the address" required>
</div>
<div class="div1">
<h3>Enter City</h3>
<input type="text" class="inputstyle" name="city" value="<%=rs2.getString(8)%>" placeholder="enter the city" required>
</div>

<div class="div1">
<h3>Enter State</h3>
<input type="text" class="inputstyle" name="state" value="<%=rs2.getString(9)%>" placeholder="enter the state" required>
</div>

<div class="div1">
<h3>Enter Country</h3>
<input type="text" class="inputstyle" name="country" value="<%=rs2.getString(10)%>" placeholder="enter the country" required>
</div>

<hr style="width:100%">
<div class="div1">
<h3>Select payment method:</h3>
<select class="inputstyle" name="paymentmethod">
<option value="Cash On Delivery">Cash On Delivery</option>
<option value="Pay Online">Pay Online</option>
</select>
</div>

<div class="div1">
<h3>Pay Online on this</h3>
<input type="text" class="inputstyle" name="transactionid" placeholder="enter the transaction id">
<h3 style="color:red">*</h3>
</div>
<hr style="width:100%">
<div class="div1">
<h3>Mobile Number</h3>
<input type="text" class="inputstyle" name="mobilenumber" value="<%=rs2.getString(3) %>" placeholder="enter your mobile number" required><p style="color:red">*</p>
</div>
<button class="btn" type="submit">Proceed to generate bill and save<i class="far fa-arrow-alt-circle-right"></i></button>

</form>
<%
		}}catch(Exception e){
	System.out.println(e);
}
%>
</body>
</html>