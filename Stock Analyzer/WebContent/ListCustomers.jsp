
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
function sendInfo(txtVal)
{
		var txt = window.opener.document.forms(0).CustID;
		txt.value = txtVal;
		window.close();
}

//-->
</SCRIPT>
</HEAD>

<body class="SC">

<h2 align=center>Customers List</h2>
<form name=cons>


<%

/*Declaration of variables*/

Connection con=null;
Statement stmt=null;
ResultSet rs=null;

String orderby="CustID";
String CustID,CustName,Address;
int PhoneNo;
System.out.println("--1---");
orderby=((String)request.getParameter("orderby")==null) ? "CustID":(String)request.getParameter("orderby");
System.out.println("--2--"+orderby);

try
{

	/*Getting the connection variable from session*/

	con=(Connection)session.getAttribute("connection");
	stmt =  con.createStatement();
	String Query = "SELECT * FROM CustomerMaster order by "+orderby;


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
        <th class=row_title><a class=title href="ViewCustomers.jsp?orderby=CustID">CustID</a></th>
	<th class=row_title><a class=title href="ViewCustomers.jsp?orderby=CustName">CustName</a></th>
	<th class=row_title><a class=title href="ViewCustomers.jsp?orderby=Address">Address</a></th>
	<th class=row_title><a class=title href="ViewCustomers.jsp?orderby=PhoneNo">PhoneNo</a></th>
<%
int DisRow=0;
	/*Getting the values from the database*/

	while(rs.next())
	{
	  CustID=rs.getString(1);
	  CustName=rs.getString(2);
	  Address=rs.getString(3);
  	  PhoneNo=rs.getInt(4);
	DisRow++;
	%>
	<tr class= <%=(DisRow%2!=0)? "row_even" : "row_odd"%>>
		<td><a href="#" onclick="sendInfo('<%=CustID%>')"><%=CustID%></a></td>
		<td><%=CustName%></td>
		<td><%=Address%></td>
		<td><%=PhoneNo%></td>
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

