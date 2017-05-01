<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>

<html>
	<head>
		<link rel="stylesheet" type="text/css" href="style.css" />
	</head>
	<body onLoad="determine()">
	<script language="javascript" src="inwardmat.js"></script>
	<form name="inwdmat" method=post >
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
		int key, mstock, min, max, ro;
		String mdes;
		while(rs.next())
		{
			key = rs.getInt("mat_key");
			mdes = rs.getString("mat_desc");
			mstock = rs.getInt("mat_qty");
			min = rs.getInt("minlvl");
			max = rs.getInt("maxlvl");
			ro = rs.getInt("rolvl");
%>
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
				<td>Minimum Level</td>
				<td>:</td>
				<td><input type="text" name="immin" maxlength="5" value="<%=min%>" /></td>
			</tr>
			<tr>
				<td>Maximum Level</td>
				<td>:</td>
				<td><input type="text" name="immax" maxlength="10" value="<%=max%>" /></td>
			</tr>
			<tr>
				<td>Reorder Level</td>
				<td>:</td>
				<td><input type="text" name="imrolvl" maxlength="6" value="<%=ro%>" /></td>
			</tr>
		</table>
		<input type="hidden" name="hkey" value="<%=key%>" />
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
				<td><input type="submit" name="mod" value="Modify" onClick="return addClicked()" disabled></td>
				<td><input type="submit" name="del" value="Delete" onClick="delClicked()" disabled></td>
			</tr>
		</table>
	</form>
	</body>
</html>
