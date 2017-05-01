<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>

<%	String supp, pdate, query;
	int key;
	key = Integer.parseInt(request.getParameter("hkey"));
	//pono = request.getParameter("hpono");
	supp = request.getParameter("supp");
	pdate = request.getParameter("pdate");
	query = "update purorder set po_suppid='"+supp+"',po_date='"+pdate+"' where po_key="+key+";";
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory","root","");
		
		Statement stmt=con.createStatement();
		stmt.executeUpdate(query); %>
		<p>Purchase Order modified successfully.</p>
		<p><a href="purchaseorder.jsp" target="_self">Back to Purchase Order page</a></p>
<%		stmt.close();
		con.close();
	}
	catch(SQLException ex)
	{
		out.println("there's a problem "+ex);
	}
%>
