<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>

<% 	String sid, sname, saddr, sphno;
	int skey, svat, stin;
	sid = request.getParameter("sid");
	sname = request.getParameter("sname");
	saddr = request.getParameter("saddr");
	sphno = request.getParameter("sph");
	/*out.println(sid+" "+sname+" "+saddr+" "+sphno+" ");
	out.println(request.getParameter("vat"));
	out.println(request.getParameter("tin"));*/
	svat = Integer.parseInt(request.getParameter("vat"));
	stin = Integer.parseInt(request.getParameter("tin"));
	saddr = saddr.trim();
	String query = "select max(supp_key) from supplier;";
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
		query = "select supp_id from supplier;";
		rs = stmt.executeQuery(query);
		String str;
		boolean flag=false;
		while(rs.next())
		{
			str = rs.getString("supp_id");
			if(str.matches(sid))
			{
				out.println("<center><p style=\"font: bold 14 arial; color: red\">Error:</p>"); 
				out.println("<p>Duplicate Supplier ID<p>");
				out.println("<a href=\"supplier.jsp\" target=\"_self\">Go Back</a></center>");
				flag = true;
			}
		}
		if(!flag)
		{
			query = "insert into supplier values("+t+",'"+sid+"','"+sname+"','"+saddr+"','"+sphno+"',"+svat+","+stin+");";
			stmt.executeUpdate(query);
			out.println("<p>Supplier "+sname+" added successfully</p>");
			out.println("<p><a href=\"supplier.jsp\" target=\"_self\">Back to Supplier page</a></p>");
		}
		stmt.close();
		con.close();
	}
	catch(SQLException ex)
	{
		out.println("there's a problem "+ex);
	}

%>	