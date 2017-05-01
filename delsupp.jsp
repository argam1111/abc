<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>

<%
	String selected, query;
	selected = request.getParameter("suppid");
	query = "delete from supplier where supp_id='"+selected+"';";
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory","root","");
		
		Statement stmt=con.createStatement();
		stmt.executeUpdate(query);
		stmt.close();
		con.close();%>
		<p>Supplier deleted successfully.</p>
		<p><a href="supplier.jsp" target="_self">Back to Supplier page</a></p>

<%	}
	catch(SQLException ex)
	{
		out.println("there's a problem "+ex);
	}
%>
