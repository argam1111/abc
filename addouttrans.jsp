<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>

<%
	String query, odate, ojob, tid;
	int mkey, mstock, oqty;
	odate = request.getParameter("odate");
	ojob = request.getParameter("ojob");
	tid = request.getParameter("htid");
	oqty = Integer.parseInt(request.getParameter("oqty"));
	mkey = Integer.parseInt(request.getParameter("hkey"));
	mstock = Integer.parseInt(request.getParameter("mstock"));
	query = "select out_tid from outward;";
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory","root","");
		Statement stmt=con.createStatement();
		ResultSet rs=stmt.executeQuery(query);
		String str;
		boolean flag=false;
		while(rs.next())
		{
			str = rs.getString(1);
			if(str.matches(tid))
			{
				out.println("<center><p style=\"font: bold 14 arial; color: red\">Error:</p>"); 
				out.println("<p>Duplicate Transaction ID<p>");
				out.println("<p>Transaction for this material on this date already exists!</p>");
				out.println("<a href=\"outselmat.jsp\" target=\"_self\">Go Back</a></center>");
				flag = true;
			}
		}
		rs.close();
		if(!flag)
		{
			query = "insert into outward values ('"+tid+"',"+mkey+","+oqty+",'"+odate+"','"+ojob+"');";
			stmt.executeUpdate(query);
			mstock = mstock-oqty;
			query = "update material set mat_qty="+mstock+" where mat_key="+mkey+";";
			stmt.executeUpdate(query);
		 %>
		<p>Outward transaction added successfully.</p>
		<p><a href="outselmat.jsp" target="_self">Click to enter another transaction</a></p>
<%
		}
		stmt.close();
		con.close();
	}
	catch(SQLException ex)
	{
		out.println("there's a problem "+ex);
	}
%>
