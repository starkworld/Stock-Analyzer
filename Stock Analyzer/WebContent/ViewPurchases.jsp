
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
<h2 align=center>Inwards List</h2>
<form name=cons>


<%

/*Declaration of variables*/

Connection con=null;
Statement stmt=null;
ResultSet rs=null;

String orderby="GodownID";
String GodownID,NameOfSupplier,ItemName,InvoiceNo,Quantity,ReceivedBy,ReceiptNo,BillCheckedBy;
Date DateOfSupply;
float BillValue;
System.out.println("--1---");
orderby=((String)request.getParameter("orderby")==null) ? "GodownID":(String)request.getParameter("orderby");
System.out.println("--2--"+orderby);

try
{

	/*Getting the connection variable from session*/

	con=(Connection)session.getAttribute("connection");
	stmt =  con.createStatement();
	String Query = "SELECT * FROM InwardsMaster order by "+orderby;


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

	<table width="50%" align=right>

	<tr class=row_title>
        <th class=row_title><a class=title href="ViewPurchases.jsp?orderby=GodownID">GodownID</a></th>
	<th class=row_title><a class=title href="ViewPurchases.jsp?orderby=NameOfSupplier">NameOfSupplier</a></th>
	<th class=row_title><a class=title href="ViewPurchases.jsp?orderby=DateOfSupply">DateOfSupply</a></th>
	<th class=row_title><a class=title href="ViewPurchases.jsp?orderby=ItemName">ItemName</a></th>
        <th class=row_title><a class=title href="ViewPurchases.jsp?orderby=InvoiceNo">InvoiceNo</a></th>
	<th class=row_title><a class=title href="ViewPurchases.jsp?orderby=Quantity">Quantity</a></th>
	<th class=row_title><a class=title href="ViewPurchases.jsp?orderby=ReceivedBy">ReceivedBy</a></th>
	<th class=row_title><a class=title href="ViewPurchases.jsp?orderby=ReceiptNo">ReceiptNo</a></th>
	<th class=row_title><a class=title href="ViewPurchases.jsp?orderby=BillValue">BillValue</a></th>
	<th class=row_title><a class=title href="ViewPurchases.jsp?orderby=BillCheckedBy">BillCheckedBy</a></th>
<%
int DisRow=0;
	/*Getting the values from the database*/

	while(rs.next())
	{
	  GodownID=rs.getString(1);
	  NameOfSupplier=rs.getString(2);
	  DateOfSupply=rs.getDate(3);
  	  ItemName=rs.getString(4);
          InvoiceNo=rs.getString(5);
	  Quantity=rs.getString(6);
	  ReceivedBy=rs.getString(7);
	  ReceiptNo=rs.getString(8);
	  BillValue=rs.getFloat(9);
	  BillCheckedBy=rs.getString(10);
	DisRow++;
	%>
	<tr class= <%=(DisRow%2!=0)? "row_even" : "row_odd"%>>
		<td align=center><%=GodownID%></td>
		<td align=center><%=NameOfSupplier%></td>
		<td align=center><%=DateOfSupply%></td>
		<td align=center><%=ItemName%></td>
		<td align=center><%=InvoiceNo%></td>
		<td align=center><%=Quantity%></td>
		<td align=center><%= ReceivedBy%></td>
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

