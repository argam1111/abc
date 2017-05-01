<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>

<% 	String uname, upwd;
	uname = request.getParameter("t1");
	upwd = request.getParameter("t2");
	String ctype = request.getParameter("ctype");
	boolean cflag=false;
	String query = "select * from users;";
	
	try
	{
		/* always use this statement. If it is not used, 
		the program may not work everywhere. */
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory","root","");
		Statement stmt=con.createStatement();
		ResultSet rs=stmt.executeQuery(query);
		boolean flag=false;
		while(rs.next())
		{
			String unm = rs.getString(2);
			String upd = rs.getString(3);
			String rctype = rs.getString(4);
			if(unm.matches(uname) && upd.matches(upwd)&& rctype.equals(ctype))
			{
				flag=true;
				if(ctype.equals("wsaler"))
					cflag=true;
				break;
			}
		}
		if(flag && !cflag)
		{ %>
	<html>
		<head>
			<link rel="stylesheet" type="text/css" href="index2.css" />
			<title> Index page </title>
		</head>
		<body>
			<iframe class="top" src="header.html" scrolling="no" frameborder="0">
			</iframe>
			<iframe class="left" name="left" src="menus.html" scrolling="auto" frameborder="0">
			</iframe>
			<iframe class="right" name="right" src="" scrolling="auto" frameborder="0">
			</iframe>
			<iframe class="bot" src="footer.html" scrolling="no" frameborder="0">
			</iframe>
		</body>
	</html>
<!-- could have used include directive file="index.html" instead -->
	<%	}
		if(flag && cflag)
		{%>
		<html>
		<head>
			<link rel="stylesheet" type="text/css" href="index2.css" />
			<title> Index page </title>
		</head>
		<body>
			<iframe class="top" src="header.html" scrolling="no" frameborder="0">
			</iframe>
			<iframe class="left" name="left" src="wmenus.html" scrolling="auto" frameborder="0">
			</iframe>
			<iframe class="right" name="right" src="" scrolling="auto" frameborder="0">
			</iframe>
			<iframe class="bot" src="footer.html" scrolling="no" frameborder="0">
			</iframe>
		</body>
	</html>
		
			
	<% 	}
		if(!flag && !cflag)
		{ %>
	<html>
		<head>
			<title>LOGIN FORM</title>
			<style type="text/css">
				body { margin-top: 20%; }
				p.tabcaption {
					color: #0000ff;
					font-family: monotype corsiva;
					font-size: 20;
					letter-spacing: 1px;
					font-weight: bold;
				}
				table.flds td {
					color: #000000;
					font-family: courier new;
					font-size: 14;
				}
			</style>
		</head>
		<script language="javascript" src="login.js">
		</script>
		<body bgcolor="lightblue" onLoad="document.login.t1.focus()">
			<form name="login" method=post action="login.jsp">
				<p class="tabcaption" align="center">Login</p>
				<table class="flds" border=0 align="center" cellspacing=10 cellpadding=2>
					<tr>
					<td colspan="2" align=center style="font: italic 12 arial; color: red;">*Incorrect Username or Password</td>
					</tr>
					<tr>
					<td align=center>Username:</td>
					<td align=center><input type="text" name="t1" size="16" maxlength="10">
					</td>
					</tr>
					<tr>
					<td align=center>Password:</td>
					<td align=center><input type="password" name="t2" size="16" maxlength="10">
					</td>
					</tr>
					<tr>
				<td align=center>Role:</td>
				<td >
				<select name=ctype>
					<option value=retailer>Retailer</option>
					<option value=wsaler>Whole Saler</option>
				</select>
				</td>
				</tr>
				</table>
				<table border=0 align="center" cellspacing=10 cellpadding=2>
					<tr>
					<td align=right>
					<input type=submit name="submit" value="Submit" onClick="return f1()">
					</td>
					<td align=left>
					<input type=reset name="reset" value="Reset" onClick="t1.focus()">
					</td>
					</tr>
				</table>
			</form>
		</body>
	</html>

	<%	}
		stmt.close();
		con.close();
	}
	catch(SQLException ex)
	{
		out.println("there's a problem "+ex);
	}

%>
