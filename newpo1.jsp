<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>

<html>
	<head>
		<link rel="stylesheet" type="text/css" href="style.css" />
	</head>
	<body onLoad="document.po2.mno.focus()">
		<script language="javascript" src="newpo1.js"></script>
		<form name="po2" method="post">
		<p class="heading" align="center">Purchase Order</p>
<%	String pono, psupp, pdate, mno, mat, pokey;
	int qty;
	pono = request.getParameter("pono");
	psupp = request.getParameter("supp");
	pdate = request.getParameter("pdate");
	mno = request.getParameter("mno");
	mat = request.getParameter("mat");
	qty = Integer.parseInt(request.getParameter("qty"));
	pokey = request.getParameter("hpokey");
%>
		<input type="hidden" name="hpokey" value="<%=pokey%>" />
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
<%	
	String query = "insert into pomaterial values ("+pokey+",'"+mno+"','"+mat+"',"+qty+");";
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory","root","");
		
		Statement stmt=con.createStatement();
		stmt.executeUpdate(query);
		stmt.close();
		con.close();
	}
	catch(SQLException ex)
	{
		out.println("there's a problem "+ex);
	}
%>
		<hr>
		<table class="showdetails" border="0" cellspacing="10px" cellpadding="2px">
			<tr>
				<th>Model No.</th>
				<th>Material</th>
				<th>Quantity</th>
			</tr>
<%	query = "select * from pomaterial where pm_pokey="+pokey+";";
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory","root","");
		
		Statement stmt=con.createStatement();
		ResultSet rs=stmt.executeQuery(query);
		String mnum, mt;
		int qt;
		while(rs.next())
		{
			mnum = rs.getString(2);
			mt = rs.getString(3);
			qt = rs.getInt(4);
%>
			<tr>
				<td><%=mnum%></td>
				<td><%=mt%></td>
				<td><%=qt%></td>
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
		</form>
	</body>
</html>