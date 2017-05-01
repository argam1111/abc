<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>

<%
	String query, matno;
	matno = request.getParameter("hiddenmatno");
	query = "delete from material where mat_id='"+matno+"';";
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory","root","");
		
		Statement stmt=con.createStatement();
		stmt.executeUpdate(query); 
		stmt.close();
		con.close(); %>
		<p>Material deleted successfully.</p>
		<p><a href="material.jsp" target="_self">Back to Material page</a></p>
<%	}
	catch(SQLException ex)
	{
		out.println("there's a problem "+ex);
	}
%>
