
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>

<HEAD>

	<LINK href="styles.css" type="text/css" rel="stylesheet">

<title>List of Items Available</title>
<SCRIPT LANGUAGE="JavaScript">
<!--
function sendInfo(txtVal,txt1Val,txt2Val,txt3Val,txt4Val,txt5Val)
{
		var txt = window.opener.document.forms(0).ItemName;
		txt.value=txtVal;
		var txt1 = window.opener.document.forms(0).InvoiceNo;
		txt1.value=txt1Val;
		var txt2 = window.opener.document.forms(0).DateOfSupply;
		txt2.value=txt2Val;
		var txt3 = window.opener.document.forms(0).Quantity;
		txt3.value=txt3Val;
		var txt4 = window.opener.document.forms(0).ReceiptNo;
		txt4.value=txt4Val;
		var txt5 = window.opener.document.forms(0).BillValue;
		txt5.value=txt5Val;
		window.close();
}

//-->
</SCRIPT>
</HEAD>

<body class="SC">

<h2 align=center>List of Items Available </h2>
<form name=cons>
<center><input type=button value=close onclick="window.close()"></center>

<%

/*Declaration of variables*/

Connection con=null;
Statement stmt=null;
ResultSet rs=null;

String orderby="GodownID",Query="";
String GodownID,ItemName,InvoiceNo,DateOfSupply,ReceiptNo,BillValue;
int Quantity;
System.out.println("--2--"+orderby);
String Condition = (String)request.getParameter("GodownID");

try
{

	/*Getting the connection variable from session*/

	con=(Connection)session.getAttribute("connection");
	stmt =  con.createStatement();
	if(Condition.equals("NA")){
		 Query = "SELECT * FROM InwardsMaster order by "+orderby ;
	}
	else{
       Query = "SELECT * FROM InwardsMaster where GodownID = '"+Condition+"' order by "+orderby ;		
	}
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
        <th class=row_title><a class=title href="ShowItemsList.jsp?orderby=ItemName">ItemName</a></th>
	<th class=row_title><a class=title href="ShowItemsList.jsp?orderby=GodownID">GodownID</a></th>
	<th class=row_title><a class=title href="ShowItemsList.jsp?orderby=Quantity">Quantity</a></th>

<%
int DisRow=0;
	/*Getting the values from the database*/

	while(rs.next())
	{
	   GodownID=rs.getString(1);
	   DateOfSupply=rs.getString(3);
	   ItemName=rs.getString(4);
	   InvoiceNo=rs.getString(5);
	   Quantity=rs.getInt(6);
	   ReceiptNo=rs.getString(8);
	   BillValue=rs.getString(9);
	   DisRow++;
	%>
	<tr class= <%=(DisRow%2!=0)? "row_even" : "row_odd"%>>
		<td><a href="#" onclick="sendInfo('<%=ItemName%>','<%=InvoiceNo%>','<%=DateOfSupply%>','<%=Quantity%>','<%=ReceiptNo%>','<%=BillValue%>')"><%=ItemName%></a></td>
		<td><%=GodownID%></td>
		<td><%=Quantity%></td>

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
