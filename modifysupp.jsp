<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>

<%
	String pskey, psid, sid, sname, saddr, sph, query;
	int svat, stin;
	pskey = request.getParameter("hiddenskey");
	psid = request.getParameter("hiddensid");
	sid = request.getParameter("sid");
	sname = request.getParameter("sname");
	saddr = request.getParameter("saddr");
	sph = request.getParameter("sph");
	svat = Integer.parseInt(request.getParameter("vat"));
	stin = Integer.parseInt(request.getParameter("tin"));
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory","root","");
		
		Statement stmt=con.createStatement();
		query = "select supp_id from supplier;";
		ResultSet rs = stmt.executeQuery(query);
		String str;
		boolean flag=false;
		while(rs.next())
		{
			str = rs.getString("supp_id");
			if(str.matches(psid))
			{
				flag = false;
				break;
			}
			else if(str.matches(sid))
			{
				out.println("<center><p style=\"font: bold 14 arial; color: red\">Error:</p>"); 
				out.println("<p>Duplicate Supplier ID<p>");
				out.println("<a href=\"supplier.jsp\" target=\"_self\">Go Back</a></center>");
				flag = true;
				break;
			}
		}
		if(!flag)
		{
			query = "update supplier set supp_id='"+sid+"',supp_name='"+sname+"',supp_addr='"+saddr+"',supp_phno='"+sph+"',supp_vat="+svat+",supp_tin="+stin+" where supp_key="+pskey+";";
			stmt.executeUpdate(query); %>
		<p>Supplier modified successfully.</p>
		<p><a href="supplier.jsp" target="_self">Back to Supplier page</a></p>
<%		}
		stmt.close();
		con.close();
	}
	catch(SQLException ex)
	{
		out.println("there's a problem "+ex);
	}
	
%>
