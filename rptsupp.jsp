<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>

<html>
	<head>
		<link rel="stylesheet" type="text/css" href="style.css" />
	</head>
	<body>
		<table class="showdetails" border="0" cellspacing="10px" cellpadding="2px">
			<caption>Supplier Report</caption>
			<tr align="center">
				<th>Supplier ID</th>
				<th>Supplier Name</th>
				<th>Address</th>
				<th>Phone No.</th>
				<th>VAT No.</th>
				<th>TIN No.</th>
			</tr>
<%
	String query = "select * from supplier where supp_key!=1 order by supp_id;";
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory","root","");
		
		Statement stmt=con.createStatement();
		ResultSet rs=stmt.executeQuery(query);
		String sid, sname, saddr, ph;
		int vat, tin;
		while(rs.next())
		{
			sid = rs.getString("supp_id");
			sname = rs.getString("supp_name");
			saddr = rs.getString("supp_addr");
			ph = rs.getString("supp_phno");
			vat = rs.getInt("supp_vat");
			tin = rs.getInt("supp_tin");
%>
			<tr align="center">
				<td><%=sid%></td>
				<td><%=sname%></td>
				<td><%=saddr%></td>
				<td><%=ph%></td>
				<td><%=vat%></td>
				<td><%=tin%></td>
			</tr>
<%		}
		stmt.close();
		con.close();
	}
	catch(SQLException ex)
	{
		out.println("there's a problem "+ex);
	}
%>
	</body>
</html>
