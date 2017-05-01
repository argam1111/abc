<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>

<html>
	<head>
		<link rel="stylesheet" type="text/css" href="style.css" />
	</head>
	<body onLoad="document.po1.mno.focus()">
		<script language="javascript" src="newpo.js"></script>
		<form name="po1" method="post">
		<p class="heading" align="center">Purchase Order</p>
<%	String pono, psupp, pdate;
	pono = request.getParameter("pono");
	psupp = request.getParameter("supp");
	pdate = request.getParameter("pdate");
	int t=0;
	String query = "select max(po_key) from purorder;";
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory","root","");
		
		Statement stmt=con.createStatement();
		ResultSet rs=stmt.executeQuery(query);
		while(rs.next())
		{
			t = rs.getInt(1);
			t++;
		}
		query = "insert into purorder values ("+t+",'"+pono+"','"+psupp+"','"+pdate+"');";
		stmt.executeUpdate(query);
		stmt.close();
		con.close();
	}
	catch(SQLException ex)
	{
		out.println("there's a problem "+ex);
	}
	%>
		<input type="hidden" name="hpokey" value="<%=t%>" />
		<table class="flds" border="0" cellspacing="10px" cellpadding="2px">
			<caption>P.O. Header</caption>
			<tr>
				<td>P.O. No.</td>
				<td>:&nbsp;<input type="text" name="pono" maxlength="8" size="10" value="<%=pono%>" readonly="readonly" /></td>
			</tr>
			<tr>
				<td>Supplier</td>
				<td>:&nbsp;<input type="text" name="supp" maxlength="8" size="10" value="<%=psupp%>" readonly="readonly" /></td>
				</td>
				<td align="right">Date</td>
				<td>:&nbsp;<input type="text" name="pdate" size="10" maxlength="10" value="<%=pdate%>" readonly="readonly" /></td>
				<td><text style="font: 12 calibri; color: red;">dd/mm/yyyy</text></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="button" name="newpo" value="Create Purchase Order" disabled /></td>
				<td align="center"><input type="button" name="mod" value="Modify" disabled /></td>
				<td align="center"><input type="button" name="del" value="Delete" disabled /></td>
			</tr>
		</table>
		<hr>
		<table class="flds" border="0" cellspacing="12px" cellpadding="2px">
			<caption>P.O. Details</caption>
			<tr>
				<td>Model No.</td>
				<td>:&nbsp;<input type="text" name="mno" size="10" maxlength="20" /></td>
				</td>
				<td>Material</td>
				<td>:&nbsp;<input type="text" name="mat" size="15" maxlength="20" /></td>
			</tr>
			<tr>
				<td>Quantity</td>
				<td>:&nbsp;<input type="text" name="qty" maxlength="8" size="10" /></td>
				<td>&nbsp;</td>
				<td align="right"><input type="submit" name="add" value="Add Detail" onClick="return addmat()" /></td>
			</tr>
		</table>
		<hr>
		<!--
		<table class="flds" border="0" cellspacing="10px" cellpadding="2px">
			<tr>
				<td>Added Material :&nbsp;&nbsp;&nbsp;</td>
			</tr>
		</table>
		-->
		</form>
	</body>
</html>
