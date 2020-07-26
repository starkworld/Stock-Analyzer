
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
function sendInfo(txtVal,txt1Val,txt2Val,txt3Val)
{
		var txt = window.opener.document.forms(0).GodownID;
		txt.value = txtVal;
		var txt1 = window.opener.document.forms(0).ReceivedBy;
		txt1.value=txt1Val;
		var txt2 = window.opener.document.forms(0).GSDate;
		txt2.value=txt2Val;
		var txt3 = window.opener.document.forms(0).BillCheckedBy;
		txt3.value=txt3Val;
		window.close();
}

//-->
</SCRIPT>
</HEAD>

<body class="SC">

<h2 align=center>Godowns List</h2>
<form name=cons>
<center><input type=button value=close onclick="window.close()"></center>

<%

/*Declaration of variables*/

Connection con=null;
Statement stmt=null;
ResultSet rs=null;

String orderby="GodownID";
String GodownID,Location,GodownManager,GSDate;
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

	<table class=notebook align=center>

	<tr class=row_title>
        <th class=row_title><a class=title href="ListGodowns.jsp?orderby=GodownID">GodownID</a></th>
	<th class=row_title><a class=title href="ListGodowns.jsp?orderby=Location">Location</a></th>
<%
int DisRow=0;
	/*Getting the values from the database*/

	while(rs.next())
	{
	   GodownID=rs.getString(1);
	   Location=rs.getString(2);
	   GodownManager=rs.getString(4);
	   GSDate=rs.getString(5);
	   DisRow++;
	%>
	<tr class= <%=(DisRow%2!=0)? "row_even" : "row_odd"%>>
		<td><a href="#" onclick="sendInfo('<%=GodownID%>','<%=GodownManager%>','<%=GSDate%>','<%=GodownManager%>')"><%=GodownID%></a></td>
		<td><%=Location%></td>
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

