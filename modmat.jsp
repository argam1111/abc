<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>

<%
	String hmatno, matno, matdes, query;
	int matqty, key=0;
	hmatno = request.getParameter("hiddenmatno");
	matno = request.getParameter("mno");
	matdes = request.getParameter("mdes");
	matqty = Integer.parseInt(request.getParameter("mqty"));
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory","root","");
		
		Statement stmt=con.createStatement();
		query = "select mat_id from material;";
		ResultSet rs = stmt.executeQuery(query);
		String str;
		boolean flag=false;
		while(rs.next())
		{
			str = rs.getString(1);
			if(str.matches(hmatno))
			{
				flag = false;
				break;
			}
			else if(str.matches(matno))
			{
				out.println("<center><p style=\"font: bold 14 arial; color: red\">Error:</p>"); 
				out.println("<p>Duplicate Material Number<p>");
				out.println("<a href=\"material.jsp\" target=\"_self\">Go Back</a></center>");
				flag = true;
				break;
			}
		}
		rs.close();
		if(!flag)
		{
			query = "select mat_key from material where mat_id='"+hmatno+"';";
			rs = stmt.executeQuery(query);
			while(rs.next())
			{
				key = rs.getInt(1);
			}
			rs.close();
			query = "update material set mat_id='"+matno+"',mat_desc='"+matdes+"',mat_qty="+matqty+" where mat_key="+key+";";
			stmt.executeUpdate(query);
		}
		stmt.close();
		con.close();%>
		<p>Material modified successfully.</p>
		<p><a href="material.jsp" target="_self">Back to Material page</a></p>
<%	}
	catch(SQLException ex)
	{
		out.println("there's a problem "+ex);
	}

%>
