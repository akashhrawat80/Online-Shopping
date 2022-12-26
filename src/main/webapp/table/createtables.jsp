<%@ page import="project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%
try{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	String ql="create table if not exists users(name varchar(100),email varchar(100)primary key,mobilenumber bigint,"+
			"securityQuestion varchar(200),answer varchar(200),password varchar(100),address varchar(500),city varchar(100),state varchar(100),country varchar(100))";
	String q2="create table if not exists product(id int,name varchar(100),category varchar(200),price int,active varchar(10))";
	String q3="create table if not exists cart(email varchar(100),productid int,quantity int,price int,total int,address varchar(500),city varchar(100),state varchar(100),country varchar(100),mobilenumber bigint,orderdate varchar(100),deliverydate varchar(100),paymentmethod varchar(100),transactionid varchar(100),status varchar(10))";
	String q4="create table if not exists message(id int AUTO_INCREMENT,email varchar(100),subject varchar(200),body varchar(1000),PRIMARY KEY(id))";
	System.out.println(ql);
	System.out.println(q2);
	System.out.println(q3);
	System.out.println(q4);
	st.execute(ql);
	st.execute(q2);
	st.execute(q3);
	st.execute(q4);
	System.out.println("Table Created!");
	con.close();
}catch(Exception e)
{
	System.out.println(e.getMessage());
	}
%>