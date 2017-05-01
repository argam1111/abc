<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>

<%	String query, tid;
	int mkey, qty, stock=0;
	tid = request.getParameter("tid");
	mkey = Integer.parseInt(request.getParameter("hkey"));
	qty = Integer.parseInt(request.getParameter("qty"));
	query = "delete from outward where out_tid='"+tid+"';";
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory","root","");
		
		Statement stmt=con.createStatement();
		stmt.executeUpdate(query);
		query = "select mat_qty from material where mat_key="+mkey+";";
		ResultSet rs=stmt.executeQuery(query);
		while(rs.next())
		{
			stock = rs.getInt(1);
		}
		stock = stock + qty;
		rs.close();
		query = "update material set mat_qty="+stock+" where mat_key="+mkey+";";
		stmt.executeUpdate(query);
%>
		<p>Transaction deleted successfully.</p>
		<p><a href="deloutwardtrans.jsp" target="_self">Delete another transaction</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="outselmat.jsp" target="_self">Go to Outward page</a></p>
<%		stmt.close();
		con.close();
	}
	catch(SQLException ex)
	{
		out.println("there's a problem "+ex);
	}
%>
