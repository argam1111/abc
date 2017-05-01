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
				<th>Inward Transaction ID</th>
				<th>Material ID</th>
				<th>Material Name</th>
				<th>Date</th>
				<th>Quantity</th>
			</tr>
<%
	String query = "select * from inward, material where mat_key=in_matkey order by in_tid;";
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory","root","");
		
		Statement stmt=con.createStatement();
		ResultSet rs=stmt.executeQuery(query);
		String tid, matid, mname, idate;
		int mqty;
		while(rs.next())
		{
			tid = rs.getString("in_tid");
			matid = rs.getString("mat_id");
			mname = rs.getString("mat_desc");
			mqty = rs.getInt("in_qty");
			idate = rs.getString("in_date");
%>
			<tr align="center">
				<td><%=tid%></td>
				<td><%=matid%></td>
				<td><%=mname%></td>
				<td><%=idate%></td>
				<td><%=mqty%></td>
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
