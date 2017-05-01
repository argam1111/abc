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
			s = document.rptpo.pono.options[document.rptpo.pono.selectedIndex].text
		document.rptpo.hpono.value=s
			if(s=="")
			{
				alert("Please select a material!")
				return false
			}
			else
				return true
		}
	</script>
	<form name="rptpo" method=post action="rptpo1.jsp">
		<table class="flds" border="0" cellspacing="10px" cellpadding="2px">
			<caption>Select Purchase Order</caption>
			<tr>
				<td>P.O. Number</td>
				<td>:</td>
				<td><select name="pono">
<%
	String query;
	query = "select po_no from purorder order by po_no;";
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory","root","");
		
		Statement stmt=con.createStatement();
		ResultSet rs=stmt.executeQuery(query);
		while(rs.next())
		{
%>
						<option><%=rs.getString(1)%></option>
<%		} %>
					</select>
				</td>
				<td><input type="submit" name="go" value="Go" onClick="return check()" /></td>
			</tr>
		</table>
		<input type="hidden" name="hpono" />
<%		stmt.close();
		con.close();
	}
	catch(SQLException ex)
	{
		out.println("there's a problem "+ex);
	}
%>
	</form>
	</body>
</html>
