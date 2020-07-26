
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>

<HEAD>

	<LINK href="styles.css" type="text/css" rel="stylesheet">

<title>ConsolidatedReport</title>
<SCRIPT LANGUAGE="JavaScript">
<!--
history.go(+1);


//-->
</SCRIPT>
</HEAD>
<jsp:include page="MultiLevelmenu.htm"/><br><br><br>

<body class="SC">
<P align=right><a class=title onclick="javascipt:window.print()" onmouseover="this.style.cursor='hand'" ><img src="Images/printer1.jpg" width="37" height="38" border=0 alt=""></a></P>
<h2 align=center>UsersList</h2>
<form name=cons>


<%

/*Declaration of variables*/

Connection con=null;
Statement stmt=null;
ResultSet rs=null;

String orderby="UserID";
String UserID;
int Auth,ActiveStatus;
System.out.println("--1---");
orderby=((String)request.getParameter("orderby")==null) ? "UserID":(String)request.getParameter("orderby");
System.out.println("--2--"+orderby);

try
{

	/*Getting the connection variable from session*/

	con=(Connection)session.getAttribute("connection");
	stmt =  con.createStatement();
	String Query = "SELECT UserID,Auth FROM Login order by "+orderby;


	System.out.println("--1--"+Query);
	rs = stmt.executeQuery(Query);
}
catch(Exception e)
{
	//System.out.println("Exception"+e);
	%><%=e%><%
}

%>


<%
if(rs!=null)
{
//System.out.println("Resultset is not null");

%>
	<!--Displaying the table header-->

	<br>
<!--	<DIV STYLE="overflow:scroll;width:650px; height:400px;">-->

	<table width="60%" align=center>

	<tr class=row_title>
        <th class=row_title><a class=title href="ViewUsers.jsp?orderby=UserID">UserID</a></th>
	<th class=row_title><a class=title href="ViewUsers.jsp?orderby=Auth">Auth</a></th>
	
<%
int DisRow=0;
	/*Getting the values from the database*/

	while(rs.next())
	{
	  UserID=rs.getString(1);
	  Auth=rs.getInt(2);
	
	DisRow++;
	%>
	<tr class= <%=(DisRow%2!=0)? "row_even" : "row_odd"%>>
		<td align=center><%=UserID%></td>
		<td align=center><%=Auth%></td>
	
	<%
	}


	rs.close();
if(DisRow==0)
{
	/*To write to the server if the resultset is null*/
	%>
		<CENTER>
			<tr><th colspan=6>No Records found</th></tr>

		</CENTER>
	<%

}

}
%>




</table>
</form>
</BODY>
</HTML>

