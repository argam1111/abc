<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>

<html>
	<head>
		<style type="text/css">
			body {
				background: #f5f5dc;
				border: thin solid;
			}
			table{
				margin: 0px 1px 0px 10px;
			}
			caption {
				caption-side:top;
				font: bold 18 cambria;
				color: #330099;
			}
			table.head {
				font-family: verdana;
				font-size: 14;
				/*border: thin solid;*/
			}
			table.items {
				font-family: calibri;
				font-size: 14;
				/*border: thin solid;*/
			}
			hr {
				margin: 5px 0px 5px 0px;
				color: #000000;
			}
		</style>
	</head>
	<body onLoad="document.rptpo.ptax.focus()" >
	<form name="rptpo" >
<%
	String pono, sid="", pdate="", query, mt="", sname="";
	int pkey=0, qt=0;
	pono = request.getParameter("hpono");
	query = "select * from purorder where po_no='"+pono+"';";
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory","root","");
		
		Statement stmt=con.createStatement();
		ResultSet rs=stmt.executeQuery(query);
		while(rs.next())
		{
			pkey = rs.getInt(1);
			sid = rs.getString(3);
			pdate = rs.getString(4);
		}
		rs.close();
		query = "select supp_name from supplier where supp_id='"+sid+"'";
		rs=stmt.executeQuery(query);
		while(rs.next())
		{
			sname = rs.getString(1);
		}
		rs.close();
%>
		<table class="head" border="0" cellspacing="12px" cellpadding="2px">
			<caption>Purchase Order</caption>
			<tr>
				<td>P.O. Number</td>
				<td>:&nbsp;<input type="text" name="pno" size="10" value="<%=pono%>" readonly /></td>
			</tr>
			<tr>
				<td>Supplier</td>
				<td>:&nbsp;<input type="text" name="supp" size="20" value="<%=sname%>" readonly /></td>
				<td>Date</td>
				<td>:&nbsp;<input type="text" name="dt" size="10" value="<%=pdate%>" readonly /></td>
			</tr>
		</table>
		<hr>
		<table class="items" border="0" cellspacing="12px" cellpadding="2px">
			<tr>
				<th>Material</th>
				<th>Quantity</th>
			</tr>
<%		query = "select pm_mat, pm_qty from pomaterial where pm_pokey="+pkey+";";
		rs=stmt.executeQuery(query);
		while(rs.next())
		{
			mt = rs.getString(1);
			qt = rs.getInt(2);
%>
			<tr>
				<td><%=mt%></td>
				<td><%=qt%></td>
			</tr>
<%		}
		rs.close(); 
		stmt.close();
		con.close();
	}
	catch(SQLException ex)
	{
		out.println("there's a problem "+ex);
	}
%>
		</table>
		<hr>
		<table class="head" border="0" cellspacing="12px" cellpadding="2px">
			<tr>
				<td>Plus Tax</td>
				<td>:&nbsp;<input type="text" name="ptax" size="10" /></td>
				<td>VAT</td>
				<td>:&nbsp;<input type="text" name="vat" size="5" /></td>
				<td>CST</td>
				<td>:&nbsp;<input type="text" name="cst" size="5" /></td>
			</tr>
			<tr>
				<td>Delivery Schedule</td>
				<td>:&nbsp;<input type="text" name="dsc" size="10" /></td>
			</tr>
			<tr>
				<td>Payment</td>
				<td>:&nbsp;<input type="text" name="pymt" size="10" /></td>
			</tr>
		</table>
	</form>
	</body>
</html>
