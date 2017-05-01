<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>

<html>
	<head>
		<link rel="stylesheet" type="text/css" href="style.css" />
	</head>
	<body>
	<script language="javascript" >
		function delClicked()
		{
			document.delintrans.action="delintrans.jsp"
			document.delintrans.target="_self"
		}
	</script>
	<form name="delintrans" method=post >
		<table class="flds" border="0" cellspacing="10px" cellpadding="2px">
			<caption>Delete Transaction</caption>
			<tr>
				<td>Transaction ID</td>
				<td>:</td>
<%
	String query, tid="", tdate="", mdes="";
	int mkey=0, qty=0;
	tid = request.getParameter("htid");
	query = "select in_matkey, in_qty, in_date from inward where in_tid='"+tid+"';";
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory","root","");
		
		Statement stmt=con.createStatement();
		ResultSet rs=stmt.executeQuery(query);
		while(rs.next())
		{
			mkey = rs.getInt(1);
			qty = rs.getInt(2);
			tdate = rs.getString(3);
		}
		rs.close();
		query = "select mat_desc from material where mat_key="+mkey+";";
		rs = stmt.executeQuery(query);
		while(rs.next())
		{
			mdes = rs.getString(1);
		}
		stmt.close();
		con.close();
	}
	catch(SQLException ex)
	{
		out.println("there's a problem "+ex);
	}
%>
				<td><input type="text" name="tid" value="<%=tid%>" readonly /></td>
			</tr>
			<tr>
				<td>Material</td>
				<td>:</td>
				<td><input type="text" name="mdes" value="<%=mdes%>" readonly /></td>
			</tr>
			<tr>
				<td>Date</td>
				<td>:</td>
				<td><input type="text" name="tdate" value="<%=tdate%>" readonly /></td>
			</tr>
			<tr>
				<td>Quantity</td>
				<td>:</td>
				<td><input type="text" name="qty" value="<%=qty%>" readonly /></td>
			</tr>
		</table>
		<input type="hidden" name="hkey" value="<%=mkey%>" />
		<table class="buttons" border="0" cellspacing="20px" cellpadding="2px">
			<tr>
				<td><input type="submit" name="del" value="Delete" onClick="delClicked()"></td>
				<td><a href="delinwardtrans.jsp" target="_self" >Go to Select Material page</a></td>
			</tr>
		</table>
	</form>
	</body>
</html>
