<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>

<%	String query;
	int hkey;
	hkey = Integer.parseInt(request.getParameter("hkey"));
	query = "update material set minlvl="+0+",maxlvl="+0+",rolvl="+0+" where mat_key="+hkey+";";
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory","root","");
		
		Statement stmt=con.createStatement();
		stmt.executeUpdate(query); %>
		<p>Material levels deleted successfully.</p>
		<p><a href="inselmat.jsp" target="_self">Go Back to Select Material page</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="inward.html" target="_self">Go to Inward page</a></p>
<%		stmt.close();
		con.close();
	}
	catch(SQLException ex)
	{
		out.println("there's a problem "+ex);
	}
%>
