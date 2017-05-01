<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>

<%	String query, pono;
	int pokey=0;
	pono = request.getParameter("hiddenpono");
	query = "select po_key from purorder where po_no='"+pono+"';";
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory","root","");
		
		Statement stmt=con.createStatement();
		ResultSet rs = stmt.executeQuery(query);
		while(rs.next())
		{
			pokey = rs.getInt(1);
		}
		query = "delete from purorder where po_key="+pokey+";";
		stmt.executeUpdate(query);
		query = "delete from pomaterial where pm_pokey="+pokey+";";
		stmt.executeUpdate(query);
		stmt.close();
		con.close();
%>
		<p>Purchase Order deleted successfully.</p>
		<p><a href="purchaseorder.jsp" target="_self">Back to Purchase Order page</a></p>
<%	}
	catch(SQLException ex)
	{
		out.println("there's a problem "+ex);
	}		
%>
