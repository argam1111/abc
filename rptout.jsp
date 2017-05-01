<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>

<html>
	<head>
		<link rel="stylesheet" type="text/css" href="style.css" />
	</head>
	<body>
		<table class="showdetails" border="0" cellspacing="10px" cellpadding="2px">
			<caption>Outward Regeister Report</caption>
			<tr align="center">
				<th>Outward Transaction ID</th>
				<th>Material ID</th>
				<th>Material Name</th>
				<th>Date</th>
				<th>Quantity</th>
				<th>Job Number</th>
			</tr>
<%
	String query = "select * from outward, material where mat_key=out_matkey order by out_tid;";
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory","root","");
		
		Statement stmt=con.createStatement();
		ResultSet rs=stmt.executeQuery(query);
		String tid, matid, mname, odate, job;
		int mqty;
		while(rs.next())
		{
			tid = rs.getString("out_tid");
			matid = rs.getString("mat_id");
			mname = rs.getString("mat_desc");
			mqty = rs.getInt("out_qty");
			odate = rs.getString("out_date");
			job = rs.getString("out_jobno");
%>
			<tr align="center">
				<td><%=tid%></td>
				<td><%=matid%></td>
				<td><%=mname%></td>
				<td><%=odate%></td>
				<td><%=mqty%></td>
				<td><%=job%></td>
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
