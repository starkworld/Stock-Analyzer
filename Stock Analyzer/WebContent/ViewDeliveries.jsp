
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
<h2 align=center>Deliveries List</h2>
<form name=cons>


<%

/*Declaration of variables*/

Connection con=null;
Statement stmt=null;
ResultSet rs=null;

String orderby="GodownID";
String GodownID,ItemName,InvoiceNo,DeliveredTo,ReceiptNo,Purpose,BillCheckedBy;
Date DateOfDelivery;
int Quantity;
float BillValue;
System.out.println("--1---");
orderby=((String)request.getParameter("orderby")==null) ? "GodownID":(String)request.getParameter("orderby");
System.out.println("--2--"+orderby);

try
{

	/*Getting the connection variable from session*/

	con=(Connection)session.getAttribute("connection");
	stmt =  con.createStatement();
	String Query = "SELECT * FROM DeliveryMaster order by "+orderby;


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

	<table width="60%" align=right>

	<tr class=row_title>
        <th class=row_title><a class=title href="ViewDeliveries.jsp?orderby=GodownID">GodownID</a></th>
	<th class=row_title><a class=title href="ViewDeliveries.jsp?orderby=ItemName">ItemName</a></th>
        <th class=row_title><a class=title href="ViewDeliveries.jsp?orderby=InvoiceNo">InvoiceNo</a></th>
	<th class=row_title><a class=title href="ViewDeliveries.jsp?orderby=DateOfDelivery">DateOfDelivery</a></th>
	<th class=row_title><a class=title href="ViewDeliveries.jsp?orderby=DeliveredTo">DeliveredTo</a></th>
	<th class=row_title><a class=title href="ViewDeliveries.jsp?orderby=Quantity">Quantity</a></th>
	<th class=row_title><a class=title href="ViewDeliveries.jsp?orderby=Purpose">Purpose</a></th>
	<th class=row_title><a class=title href="ViewDeliveries.jsp?orderby=ReciptNo">ReceiptNo</a></th>
	<th class=row_title><a class=title href="ViewDeliveries.jsp?orderby=BillValue">BillValue</a></th>
	<th class=row_title><a class=title href="ViewDeliveries.jsp?orderby=BillCheckedBy">BillCheckedBy</a></th>
<%
int DisRow=0;
	/*Getting the values from the database*/

	while(rs.next())
	{
	  GodownID=rs.getString(1);
	  ItemName=rs.getString(2);
	  InvoiceNo=rs.getString(3);
  	  DateOfDelivery=rs.getDate(4);
          DeliveredTo=rs.getString(5);
	  Quantity=rs.getInt(6);
	  Purpose=rs.getString(7);
	  ReceiptNo=rs.getString(8);
	  BillValue=rs.getInt(9);
	  BillCheckedBy=rs.getString(10);
	DisRow++;
	%>
	<tr class= <%=(DisRow%2!=0)? "row_even" : "row_odd"%>>
		<td align=center><%=GodownID%></td>
		<td align=center><%= ItemName%></td>
		<td align=center><%= InvoiceNo%></td>
		<td align=center><%=DateOfDelivery%></td>
		<td align=center><%= DeliveredTo%></td>
		<td align=center><%=Quantity%></td>
		<td align=center><%= Purpose%></td>
		<td align=center><%=ReceiptNo%></td>
		<td align=center><%= BillValue%></td>
		<td align=center><%=BillCheckedBy%></td>
		
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

