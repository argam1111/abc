<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>

<html>
	<head>
		<link rel="stylesheet" type="text/css" href="style.css" />
	</head>
	<body onLoad="document.outwd.oqty.focus()">
	<script language="javascript" src="outward.js"></script>
	<form name="outwd" method="post">
		<input type="hidden" name="htid" />
		<table class="flds" border="0" cellspacing="10px" cellpadding="2px">
			<caption>Outward Register</caption>
			<tr>
				<td>Model No.</td>
				<td>:</td>
<%	String hmatid;
	hmatid = request.getParameter("hmatid"); %>
				<td><input name="omno" value="<%=hmatid%>" readonly /></td>
			</tr>
<%	String query;
	int ro=0, key=0, mstock=0, min=0, max=0;
	query = "select * from material where mat_id='"+hmatid+"';";
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory","root","");
		
		Statement stmt=con.createStatement();
		ResultSet rs=stmt.executeQuery(query);
		String mdes;
		while(rs.next())
		{
			key = rs.getInt("mat_key");
			mdes = rs.getString("mat_desc");
			mstock = rs.getInt("mat_qty");
			min = rs.getInt("minlvl");
			ro = rs.getInt("rolvl");
%>
			<tr>
				<td>Material Description</td>
				<td>:</td>
				<td><textarea name="omname" rows="5" columns="20" readonly ><%=mdes%></textarea></td>
			</tr>
			<tr>
				<td>Stock</td>
				<td>:</td>
				<td><input type="text" name="mstock" value="<%=mstock%>" readonly /></td>
			</tr>
			<tr>
				<td>Minimum Level</td>
				<td>:</td>
				<td><input type="text" name="min" value="<%=min%>" readonly /></td>
			</tr>
			<tr>
				<td>Quantity</td>
				<td>:</td>
				<td><input type="text" name="oqty" maxlength="10" /></td>
			</tr>
			<tr>
				<td>Date</td>
				<td>:</td>
				<td><input type="text" name="odate" maxlength="10" /></td>
				<td style="font: 12 calibri; color: red;">&nbsp;&nbsp;&nbsp;dd/mm/yyyy&nbsp;</td>
			</tr>
			<tr>
				<td>Job No.</td>
				<td>:</td>
				<td><input type="text" name="ojob" maxlength="20"/></td>
			</tr>
		</table>
<%		}
		stmt.close();
		con.close();
	}
	catch(SQLException ex)
	{
		out.println("there's a problem "+ex);
	}
%>
		<input type="hidden" name="hro" value="<%=ro%>" />
		<input type="hidden" name="hkey" value="<%=key%>" />
		<table class="buttons" border="0" cellspacing="20px" cellpadding="2px">
			<tr>
				<td><input type="submit" name="add" value="Add" onClick="return addClicked()"></td>
				<td><a href="deloutwardtrans.jsp">Click here to delete a transaction</a></td>
			</tr>
		</table>
	</form>
	</body>
</html>
