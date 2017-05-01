<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>

<%
	String matno, matdes, query;
	int matqty;
	matno = request.getParameter("mno");
	matdes = request.getParameter("mdes");
	matqty = Integer.parseInt(request.getParameter("mqty"));
	query = "select max(mat_key) from material;";
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory","root","");
		Statement stmt=con.createStatement();
		ResultSet rs=stmt.executeQuery(query);
		int t=0;
		while(rs.next())
		{
			t = rs.getInt(1);
			t++;
		}
		query = "select mat_id from material;";
		rs = stmt.executeQuery(query);
		boolean flag=false;
		while(rs.next())
		{
			String str = rs.getString("mat_id");
			if(str.matches(matno))
			{
				out.println("<center><p style=\"font: bold 14 arial; color: red\">Error:</p>"); 
				out.println("<p>Duplicate Material Number<p>");
				out.println("<a href=\"material.jsp\" target=\"_self\">Go Back</a></center>");
				flag = true;
			}
		}
		if(!flag)
		{
			query = "insert into material (mat_key,mat_id,mat_desc,mat_qty) values("+t+",'"+matno+"','"+matdes+"',"+matqty+");";
			stmt.executeUpdate(query);
			out.println("<p>Material added successfully</p>");
			out.println("<p><a href=\"material.jsp\" target=\"_self\">Back to Material page</a></p>");
		}
		stmt.close();
		con.close();
	}
	catch(SQLException ex)
	{
		out.println("there's a problem "+ex);
	}
	
%>
