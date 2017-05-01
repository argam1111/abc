<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>

<html>
	<head>
		<link rel="stylesheet" type="text/css" href="style.css" />
	</head>
	<body>
	<script language="javascript">
		var s
		function check()
		{
			s = document.selmattrans.imno.options[document.selmattrans.imno.selectedIndex].text
		document.selmattrans.hmatid.value=s
			if(s=="")
			{
				alert("Please select a material!")
				return false
			}
			else
				return true
		}
	</script>
	<form name="selmattrans" method=post action="inwardtrans1.jsp">
		<table class="flds" border="0" cellspacing="10px" cellpadding="2px">
			<caption>Select Material</caption>
			<tr>
				<td>Model No.</td>
				<td>:</td>
				<td><select name="imno">
<%
	String query;
	query = "select mat_id from material where maxlvl>0";
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory","root","");
		
		Statement stmt=con.createStatement();
		ResultSet rs=stmt.executeQuery(query);
		while(rs.next())
		{ %>
						<option><%=rs.getString(1)%></option>
<%		} %>
					</select>
				</td>
				<td><input type="submit" name="go" value="Go" onClick="return check()" /></td>
			</tr>
		</table>
		<p><br><a href="delinwardtrans.jsp" target="_self">Click here to Delete a transaction</a></p>
		<input type="hidden" name="hmatid" />
<%	}
	catch(SQLException ex)
	{
		out.println("there's a problem "+ex);
	}
%>
	</form>
	</body>
</html>
