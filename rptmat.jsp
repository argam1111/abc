<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>

<html>
	<head>
		<link rel="stylesheet" type="text/css" href="style.css" />
	</head>
	<body>
		<table class="showdetails" border="0" cellspacing="10px" cellpadding="2px">
			<caption>Inward Regeister Report</caption>
			<tr align="center">
				<th>Material ID</th>
				<th>Material Description</th>
				<th>Quantity</th>
				<th>Mininmun Level</th>
				<th>Maximum Level</th>
				<th>Reorder Level</th>
			</tr>
<%
	String query = "select * from material where mat_key!=1 order by mat_key;";
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory","root","");
		
		Statement stmt=con.createStatement();
		ResultSet rs=stmt.executeQuery(query);
		String matid, mdesc;
		int mqty, min, max, ro;
		while(rs.next())
		{
			matid = rs.getString("mat_id");
			mdesc = rs.getString("mat_desc");
			mqty = rs.getInt("mat_qty");
			min = rs.getInt("minlvl");
			max = rs.getInt("maxlvl");
			ro = rs.getInt("rolvl");
%>
			<tr align="center">
				<td><%=matid%></td>
				<td><%=mdesc%></td>
				<td><%=mqty%></td>
				<td><%=min%></td>
				<td><%=max%></td>
				<td><%=ro%></td>
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
		</table>
	</body>
</html>
