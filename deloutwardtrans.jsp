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
			s = document.deloutwdtrans.tid.options[document.deloutwdtrans.tid.selectedIndex].text
		document.deloutwdtrans.htid.value=s
			if(s=="")
			{
				alert("Please select an ID!")
				return false
			}
			else
				return true
		}
	</script>
	<form name="deloutwdtrans" method=post action="deloutwardtrans1.jsp">
		<table class="flds" border="0" cellspacing="10px" cellpadding="2px">
			<caption>Select Transaction</caption>
			<tr>
				<td>Transaction ID</td>
				<td>:</td>
				<td><select name="tid">
						<option selected></option>
<%
	String query, tid;
	query = "select out_tid from outward order by out_tid;";
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
		<input type="hidden" name="htid" />
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
