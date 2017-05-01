<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>

<html>
	<head>
		<link rel="stylesheet" type="text/css" href="style.css" />
	</head>
	<body>
		<script language="javascript" src="supplier.js"></script>
		<form name="supp" method=post action="modifysupp.jsp">
<%
	String selected, query;
	selected = request.getParameter("suppid");
	query = "select * from supplier where supp_id='"+selected+"';";
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory","root","");
		
		Statement stmt=con.createStatement();
		ResultSet rs=stmt.executeQuery(query);
		String sname=" ", saddr=" ", sphno=" ";
		int skey=0, svat=0, stin=0;
		while(rs.next())
		{
			skey = rs.getInt("supp_key");
			sname = rs.getString("supp_name");
			saddr = rs.getString("supp_addr");
			sphno = rs.getString("supp_phno");
			svat = rs.getInt("supp_vat");
			stin = rs.getInt("supp_tin");
		} %>
		<input type="hidden" name="hiddenskey" value="<%=skey%>" />
		<input type="hidden" name="hiddensid" value="<%=selected%>" />
		<table class="flds" border="0" cellspacing="10px" cellpadding="2px">
			<caption>Supplier Details</caption>
			<tr>
				<td>Selected Supplier</td>
				<td>:</td>
				<td><%out.println(selected);%></td>
			</tr>
			<tr>
				<td>Supplier ID</td>
				<td>:</td>
				<td><input type="text" name="sid" maxlength="10" value="<%=selected%>"></input></td>
			</tr>
			<tr>
				<td>Name</td>
				<td>:</td>
				<td><input type="text" name="sname" maxlength="50" value="<%=sname%>"></input></td>
			</tr>
			<tr>
				<td>Address</td>
				<td>:</td>
				<td><textarea name="saddr" rows="5" columns="20"><%=saddr%></textarea></td>
			</tr>
			<tr>
				<td>Phone No.</td>
				<td>:</td>
				<td><input type="text" name="sph" maxlength="12" value="<%=sphno%>"></input></td>
			</tr>
			<!--<tr>
				<td>Email</td>
				<td>:</td>
				<td><input type="text" name="semail" maxlength="30"/></td>
			</tr>-->
			<tr>
				<td>VAT No.</td>
				<td>:</td>
				<td><input type="text" name="vat" value="<%=svat%>"> </input></td>
			</tr>
			<tr>
				<td>TIN No.</td>
				<td>:</td>
				<td><input type="text" name="tin" value="<%=stin%>"> </input></td>
			</tr>
		</table>
<%		stmt.close();
		con.close();
	}
	catch(SQLException ex)
	{
		out.println("there's a problem "+ex);
	}
%>
		<table class="buttons" border="0" cellspacing="20px" cellpadding="2px">
			<tr>
				<td>
					<input type="submit" name="mod" value="Modify" onClick="return addsupp()">
				</td>
				<td>
					<a href="supplier.jsp">Go to Supplier</a>
				</td>
			</tr>
		</table>
		</form>
	</body>
</html>
