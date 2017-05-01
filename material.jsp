<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>

<html>
	<head>
		<link rel="stylesheet" type="text/css" href="style.css" />
	</head>
	<body onLoad="focusfirst()">
	<form name="mat" method="post" action="addmat.jsp">
		<script language="javascript" src="material.js"></script>
		<input type="hidden" name="hiddenmatno" />
		<table class="flds" border="0" cellspacing="10px" cellpadding="2px">
			<caption>Material Details</caption>
			<tr>
				<td>Select Material</td>
				<td>:</td>
				<td><select name="matname" onChange="matSelected()">
		<%	String query = "select mat_id from material order by mat_id;";
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
				<td style="font: 12 calibri; color: red;">*Please select to &quot;Modify&quot; or &quot;Delete&quot;</td>
			</tr>
			<tr>
				<td>Model No.</td>
				<td>:</td>
				<td><input type="text" name="mno" maxlength="10"/></td>
				<td style="font: 12 calibri; color: red;">*Please fill in the details and then click on &quot;Modify&quot;</td>
			</tr>
			<tr>
				<td>Description</td>
				<td>:</td>
				<td> <textarea name="mdes" rows="5" columns="20"></textarea>
				</td>
			</tr>
			<tr>
				<td>Quantity</td>
				<td>:</td>
				<td><input type="text" name="mqty" maxlength="12"/></td>
			</tr>
		</table>
		<table class="buttons" border="0" cellspacing="20px" cellpadding="2px">
			<tr>
				<td><input type="submit" name="add" value="Add" onClick="return addmat()"></td>
				<td><input type="submit" name="mod" value="Modify" onClick="return modmat()" disabled></td>
				<td><input type="submit" name="del" value="Delete" onClick="return delmat()" disabled></td>
			</tr>
		</table>
	</form>
	</body>
</html>
