<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>

<%
	String query, itdate, tid;
	int key, itqty;
	key = Integer.parseInt(request.getParameter("hkey"));
	itqty = Integer.parseInt(request.getParameter("itqty"));
	itdate = request.getParameter("itdate");
	tid = request.getParameter("htid");
	query = "select in_tid from inward;";
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
				out.println("<a href=\"inwardtrans.jsp\" target=\"_self\">Go Back</a></center>");
				flag = true;
			}
		}
		rs.close();
		if(!flag)
		{
			query = "insert into inward values ('"+tid+"',"+key+","+itqty+",'"+itdate+"');";
			stmt.executeUpdate(query);
			query = "select mat_qty from material where mat_key="+key+";";
			int mstock=0;
			rs = stmt.executeQuery(query);
			while(rs.next())
			{
				mstock = rs.getInt(1);
			}
			rs.close();
			mstock = mstock+itqty;
			query = "update material set mat_qty="+mstock+" where mat_key="+key+";";
			stmt.executeUpdate(query);
		 %>
		<p>Inward transaction added successfully.</p>
		<p><a href="inwardtrans.jsp" target="_self">Click to enter another transaction</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="inward.html" target="_self">Go to Inward page</a></p>
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
