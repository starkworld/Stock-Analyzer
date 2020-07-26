
<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>

<HEAD>

	<LINK href="styles.css" type="text/css" rel="stylesheet">
	<script LANGUAGE="Javascript" SRC=""></script>


</HEAD>
<jsp:include page="MultiLevelmenu.htm"/><br><br><br> 
<BODY class=SC>
<h2 align=center>Delete User</h2>

<%

	Connection con;
	ResultSet rs=null;
	Statement stmt=null;
	int result = 0;
	String useridValue = request.getParameter("UserID");
	try{
			
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/amanalyst","root","");
			stmt =  con.createStatement();
			String vsql = "select * from login where UserID='"+useridValue+"'";
		      rs = stmt.executeQuery(vsql);rs.next();
			int auth = Integer.parseInt(rs.getString("Auth"));
			String Query = "Delete from login where userid='"+useridValue+"'";
			if(auth!=0)
				  result = stmt.executeUpdate(Query);
			if(result > 0)	{
				%><h3 align=center>Deleted from the database sucessfully</h3><%
			}
			else{
				%><h3 align=center>Error in deletion..please try again</h3><% 
			}
			 
		}catch(Exception e){%><%=e%><%}
%>
</BODY>


