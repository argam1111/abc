<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>

<html>
	<head>
		<link rel="stylesheet" type="text/css" href="style.css" />
	</head>
	<body onLoad="focusfirst()">
		<script language="javascript" src="supplier.js"></script>
		<form name="supp" method=post action="addsupp.jsp">
		<table class="flds" border="0" cellspacing="10px" cellpadding="2px">
			<caption>Supplier Details</caption>
			<tr>
				<td>Select Supplier</td>
				<td>:</td>
				<td><select name="suppid" onChange="suppSelected()" >
	<%	String query = "select supp_id from supplier order by supp_id;";
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory","root","");
			
			Statement stmt=con.createStatement();
			ResultSet rs=stmt.executeQuery(query);
			while(rs.next())
			{ %>
					<option><% out.println(rs.getString(1));%></option>
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
				<td>Supplier ID</td>
				<td>:</td>
				<td><input type="text" name="sid" maxlength="10"/></td>
			</tr>
			<tr>
				<td>Name</td>
				<td>:</td>
				<td><input type="text" name="sname" maxlength="50"/></td>
			</tr>
			<tr>
				<td>Address</td>
				<td>:</td>
				<td><textarea name="saddr" rows="5" columns="20"></textarea></td>
			</tr>
			<tr>
				<td>Phone No.</td>
				<td>:</td>
				<td><input type="text" name="sph" maxlength="12"/></td>
			</tr>
			<!--<tr>
				<td>Email</td>
				<td>:</td>
				<td><input type="text" name="semail" maxlength="30"/></td>
			</tr>-->
			<tr>
				<td>VAT No.</td>
				<td>:</td>
				<td><input type="text" name="vat"/></td>
			</tr>
			<tr>
				<td>TIN No.</td>
				<td>:</td>
				<td><input type="text" name="tin"/></td>
			</tr>
		</table>
		<table class="buttons" border="0" cellspacing="20px" cellpadding="2px">
			<tr>
				<td>
					<input type="submit" name="add" value="Add" onClick="return addsupp()">
				</td>
				<td>
					<input type="submit" name="mod" value="Modify" onClick="modsupp()" disabled>
				</td>
				<td>
					<input type="submit" name="del" value="Delete" onClick="delsupp()" disabled>
				</td>
			</tr>
		</table>
		</form>
	</body>
</html>
