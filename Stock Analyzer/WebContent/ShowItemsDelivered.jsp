
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>

<HEAD>

	<LINK href="styles.css" type="text/css" rel="stylesheet">

<title>List of Delivered items</title>
<SCRIPT LANGUAGE="JavaScript">
<!--
function sendInfo(txtVal,txt1Val,txt2Val,txt3Val,txt4Val,txt5Val,txt6Val,txt7Val,txt8Val)
{
		var txt = window.opener.document.forms(0).ItemName;
		txt.value=txtVal;
		var txt1 = window.opener.document.forms(0).DateOfDelivery;
		txt1.value=txt1Val;
		var txt2 = window.opener.document.forms(0).GodownID;
		txt2.value=txt2Val;
		var txt3 = window.opener.document.forms(0).InvoiceNo;
		txt3.value=txt3Val;
		var txt4 = window.opener.document.forms(0).ReturnedBy;
		txt4.value=txt4Val;
		var txt5 = window.opener.document.forms(0).BillCheckedBy;
		txt5.value=txt5Val;
		var txt6 = window.opener.document.forms(0).Quantity;
		txt6.value=txt6Val;
		var txt7 = window.opener.document.forms(0).BillValue;
		txt7.value=txt7Val;
		var txt8 = window.opener.document.forms(0).ReceiptNo;
		txt8.value=txt8Val;
		window.close();
}

//-->
</SCRIPT>
</HEAD>

<body class="SC">

<h2 align=center>List of Items Delivered</h2>
<form name=cons>
<center><input type=button value=close onclick="window.close()"></center>

<%

/*Declaration of variables*/

Connection con=null;
Statement stmt=null;
ResultSet rs=null;

String orderby="GodownID";
String GodownID,ItemName,ReturnedBy,DeliveredTo,InvoiceNo,BillCheckedBy,BillValue,ReciptNo;
int Quantity;
Date DateOfDelivery;
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

	<table class=notebook align=center>

	<tr class=row_title>
        <th class=row_title><a class=title href="ShowItemsDelivered.jsp?orderby=ItemName">ItemName</a></th>
	<th class=row_title><a class=title href="ShowItemsDelivered.jsp?orderby=DateOfDelivery">DateOfDelivery</a></th>
	<th class=row_title><a class=title 
	href="ShowItemsDelivered.jsp?orderby=GodownID">GodownID</a></th>
	<th class=row_title><a class=title href="ShowItemsDelivered.jsp?orderby=Quantity">Quantity</a></th>
	<th class=row_title><a class=title href="ShowItemsDelivered.jsp?orderby=DeliveredTo">DeliveredTo</a></th>
<th class=row_title><a class=title href="ShowItemsDelivered.jsp?orderby=BillCheckedBy">BillCheckedBy</a></th>


<%
int DisRow=0;
	/*Getting the values from the database*/

	while(rs.next())
	{
	   GodownID=rs.getString(1);
	   ItemName=rs.getString(2);
	   InvoiceNo=rs.getString(3);
	   DateOfDelivery=rs.getDate(4);
	   Quantity=rs.getInt(6);
	   ReturnedBy=rs.getString(5);
	   BillCheckedBy=rs.getString(10);
	   ReciptNo = rs.getString(8);
	   BillValue = rs.getString(9);
	   DisRow++;

	 
	
	%>
	
	 


	<tr class= <%=(DisRow%2!=0)? "row_even" : "row_odd"%>>
		<td><a href="#" onclick="sendInfo('<%=ItemName%>','<%=DateOfDelivery%>','<%=GodownID%>','<%=InvoiceNo%>','<%=ReturnedBy%>','<%=BillCheckedBy%>','<%=Quantity%>','<%=BillValue%>','<%=ReciptNo%>')"><%=ItemName%></a></td>
		<td><%=DateOfDelivery%></td>
		<td><%=GodownID%></td>
		<td><%=Quantity%></td>
		<td><%=ReturnedBy%></td>
		<td><%=BillCheckedBy%></td>

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

