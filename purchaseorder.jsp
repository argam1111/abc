<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>

<html>
	<head>
		<link rel="stylesheet" type="text/css" href="style.css" />
	</head>
	<body onLoad="document.po.pono.focus()">
		<script language="javascript" src="purchaseorder.js"></script>
		<form name="po" method="post">
		<p class="heading" align="center">Purchase Order</p>
		<input type="hidden" name="hiddenpono" />
		<table class="flds" border="0" cellspacing="10px" cellpadding="2px">
			<caption>P.O. Header</caption>
			<tr>
				<td>Select P.O.</td>
				<td>:&nbsp;<select name="selpo" onChange="poSelected()">
	<%	String query = "select po_no from purorder order by po_no;";
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory","root","");
			
			Statement stmt=con.createStatement();
			ResultSet rs=stmt.executeQuery(query);
			while(rs.next())
			{ %>
					<option><%=rs.getString(1)%></option>
	<%	}
			stmt.close();
			con.close();
		}
		catch(SQLException ex)
		{
			out.println("there's a problem "+ex);
		}
	%>
					</select>
				</td>
			</tr>
			<tr>
				<td>P.O. No.</td>
				<td>:&nbsp;<input type="text" name="pono" maxlength="8" size="10" onBlur="checkpono()" /></td>
			</tr>
			<tr>
				<td>Select Supplier</td>
				<td>:&nbsp;<select name="supp">
	<%	query = "select supp_id from supplier order by supp_id;";
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory","root","");
			
			Statement stmt=con.createStatement();
			ResultSet rs=stmt.executeQuery(query);
			while(rs.next())
			{ %>
					<option><%=rs.getString(1)%></option>
	<%	}
			stmt.close();
			con.close();
		}
		catch(SQLException ex)
		{
			out.println("there's a problem "+ex);
		}
	%>
					</select>
				</td>
				<td align="right">Date</td>
				<td>:&nbsp;<input type="text" name="pdate" size="10" maxlength="10" /></td>
				<td><text style="font: 12 calibri; color: red;">dd/mm/yyyy</text></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" name="addpo" value="Create Purchase Order" onClick="return addClicked()" /></td>
				<td align="center"><input type="submit" name="mod" value="Modify" onClick="modClicked()" disabled /></td>
				<td align="center"><input type="submit" name="del" value="Delete" onClick="delClicked()" disabled /></td>
			</tr>
		</table>
		</form>
	</body>
</html>
