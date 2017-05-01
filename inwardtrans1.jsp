<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>

<html>
	<head>
		<link rel="stylesheet" type="text/css" href="style.css" />
	</head>
	<body onLoad="document.inwdtrans.itqty.focus()">
	<script language="javascript" src="inwardtrans1.js"></script>
	<form name="inwdtrans" method=post >
		<table class="flds" border="0" cellspacing="10px" cellpadding="2px">
			<caption>Inward Register</caption>
			<tr>
				<td>Model No.</td>
				<td>:</td>
<%	String hmatid;
	hmatid = request.getParameter("hmatid"); %>
				<td><input type="text" name="imno" value="<%=hmatid%>" readonly />
				</td>
			</tr>
<%	String query;
	query = "select * from material where mat_id='"+hmatid+"';";
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory","root","");
		
		Statement stmt=con.createStatement();
		ResultSet rs=stmt.executeQuery(query);
		String mdes;
		int key, mstock, max;
		while(rs.next())
		{
			key = rs.getInt("mat_key");
			mdes = rs.getString("mat_desc");
			mstock = rs.getInt("mat_qty");
			max = rs.getInt("maxlvl"); %>
			<tr>
				<td>Material</td>
				<td>:</td>
				<td><textarea name="imname" rows="5" columns="20" readonly><%=mdes%></textarea></td>
			</tr>
			<tr>
				<td>Stock</td>
				<td>:</td>
				<td><input type="text" name="imstock" maxlength="10" value="<%=mstock%>" readonly /></td>
			</tr>
			<tr>
				<td>Maximum Level</td>
				<td>:</td>
				<td><input type="text" name="immax" maxlength="10" value="<%=max%>" readonly /></td>
			</tr>
			<tr>
				<td>Quantity</td>
				<td>:</td>
				<td><input type="text" name="itqty" maxlength="10"></td>
			</tr>
			<tr>
				<td>Date</td>
				<td>:</td>
				<td><input type="text" name="itdate" maxlength="10"/></td>
				<td style="font: 12 calibri; color: red;">&nbsp;&nbsp;&nbsp;dd/mm/yyyy&nbsp;</td>
			</tr>
		</table>
		<input type="hidden" name="hkey" value="<%=key%>" />
		<input type="hidden" name="htid" />
<%		}
		stmt.close();
		con.close();
	}
	catch(SQLException ex)
	{
		out.println("there's a problem "+ex);
	}
%>
		<table class="buttons" border="0" cellspacing="20px" cellpadding="2px">
			<tr>
				<td><input type="submit" name="add" value="Add" onClick="return addClicked()"></td>
				<td><a href="delinwardtrans.jsp" target="_self">Click here to Delete a transaction</a></td>
			</tr>
		</table>
		</form>
	</body>
</html>
