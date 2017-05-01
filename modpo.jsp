<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>

<html>
	<head>
		<link rel="stylesheet" type="text/css" href="style.css" />
	</head>
	<body onLoad="document.mpo.supp.focus()">
		<script language="javascript" src="modpo.js"></script>
		<form name="mpo" method="post">
		<p class="heading" align="center">Purchase Order</p>
<%	String hpono, query, supp, pdate;
	int pkey=0;
	supp=" ";
	pdate=" ";
	hpono = request.getParameter("hiddenpono");
	query = "select * from purorder where po_no='"+hpono+"';";
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory","root","");
		
		Statement stmt=con.createStatement();
		ResultSet rs=stmt.executeQuery(query);
		while(rs.next())
		{
			pkey = rs.getInt(1);
			supp = rs.getString(3);
			pdate = rs.getString(4);
		}
		stmt.close();
		con.close();
	}
	catch(SQLException ex)
	{
		out.println("there's a problem "+ex);
	}
 %>
		<input type="hidden" name="hkey" value="<%=pkey%>" />
		<table class="flds" border="0" cellspacing="10px" cellpadding="2px">
			<caption>P.O. Header</caption>
			<tr>
				<td>P.O. No.</td>
				<td>:&nbsp;<input type="text" name="pono" maxlength="8" size="10" value="<%=hpono%>" readonly /></td>
			</tr>
			<tr>
				<td>Supplier</td>
				<td>:&nbsp;<input type="text" name="supp" maxlength="8" size="10" value="<%=supp%>" /></td>
				<td align="right">Date</td>
				<td>:&nbsp;<input type="text" name="pdate" size="10" maxlength="10" value="<%=pdate%>" /></td>
				<td><text style="font: 12 calibri; color: red;">dd/mm/yyyy</text></td>
			</tr>
			<tr>
				<td colspan="3" align="center"><input type="submit" name="mod" value="Modify" onClick="modClicked()" /></td>
				<td colspan="2" align="right"><a href="purchaseorder.jsp" target="_self" >Go Back to Purchase Order</a></td>
			</tr>
		</table>
		<hr>
	<!--	<table class="flds" border="0" cellspacing="12px" cellpadding="2px">
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
	-->
		<table class="showdetails" border="0" cellspacing="10px" cellpadding="2px">
			<tr>
				<th>Model No.</th>
				<th>Material</th>
				<th>Quantity</th>
			</tr>
<%	query = "select * from pomaterial where pm_pokey="+pkey+";";
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
