<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>

<%
	String query;
	int hkey, min, max, ro;
	hkey = Integer.parseInt(request.getParameter("hkey"));
	min = Integer.parseInt(request.getParameter("immin"));
	max = Integer.parseInt(request.getParameter("immax"));
	ro = Integer.parseInt(request.getParameter("imrolvl"));
	query = "update material set minlvl="+min+",maxlvl="+max+",rolvl="+ro+" where mat_key="+hkey+";";
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory","root","");
		Statement stmt=con.createStatement();
		stmt.executeUpdate(query); %>
		<p>Material levels defined successfully.</p>
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
