
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
<h2 align=center>Godowns List</h2>
<form name=cons>


<%

/*Declaration of variables*/

Connection con=null;
Statement stmt=null;
ResultSet rs=null;

String orderby="GodownID";
String GodownID,Location,GodownManager;
int CapacityinQuintals;
Date GSDate;
System.out.println("--1---");
orderby=((String)request.getParameter("orderby")==null) ? "GodownID":(String)request.getParameter("orderby");
System.out.println("--2--"+orderby);

try
{

	/*Getting the connection variable from session*/

	con=(Connection)session.getAttribute("connection");
	stmt =  con.createStatement();
	String Query = "SELECT * FROM GodownMaster order by "+orderby;


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
        <th class=row_title><a class=title href="ViewGodowns.jsp?orderby=GodownID">GodownID</a></th>
	<th class=row_title><a class=title href="ViewGodowns.jsp?orderby=Location">Location</a></th>
	<th class=row_title><a class=title href="ViewGodowns.jsp?orderby=CapacityinQuintals">CapacityinQuintals</a></th>
	<th class=row_title><a class=title href="ViewGodowns.jsp?orderby=GodownManager">GodownManager</a></th>
	<th class=row_title><a class=title href="ViewGodowns.jsp?orderby=GSDate">GodownStartingDate</a></th>
<%
int DisRow=0;
	/*Getting the values from the database*/

	while(rs.next())
	{
	  GodownID=rs.getString(1);
	  Location=rs.getString(2);
	  CapacityinQuintals=rs.getInt(3);
  	  GodownManager=rs.getString(4);
	  GSDate=rs.getDate(5);
	DisRow++;
	%>
	<tr class= <%=(DisRow%2!=0)? "row_even" : "row_odd"%>>
		<td align=center><%=GodownID%></td>
		<td align=center><%=Location%></td>
		<td align=center><%=CapacityinQuintals%></td>
		<td align=center><%=GodownManager%></td>
		<td align=center><%=GSDate%></td>
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

